import 'package:calculator_demo/Pages/CalculatorPage.dart';
import 'package:flutter/material.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:toastification/toastification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final updater = ShorebirdUpdater();
  int? _currentPatch;

  @override
  void initState() {
    super.initState();

    // Get the current patch number and print it to the console.
    // It will be `null` if no patches are installed.
    updater
        .readCurrentPatch()
        .then((currentPatch) {
          print('The current patch number is: ${currentPatch?.number}');
          setState(() {
            _currentPatch = currentPatch?.number;
          });
        })
        .then((value) => _checkForUpdates());
  }

  Future<void> _checkForUpdates() async {
    // Check whether a new update is available.
    final status = await updater.checkForUpdate();

    if (status == UpdateStatus.outdated) {
      try {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: Text("'New Update Available"),
            actions: [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: Text("Dismiss"),
              ),
            ],
          ),
        );

        // Perform the update
        await updater.update(track: UpdateTrack.stable);
      } on UpdateException catch (error) {
        // Handle any errors that occur while updating.
      }
    } else if (status == UpdateStatus.upToDate) {
      try {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: Text("No Available update"),
            actions: [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: Text("Dismiss"),
              ),
            ],
          ),
        );
        toastification.show(
          autoCloseDuration: Duration(seconds: 4),

          type: ToastificationType.success,
          style: ToastificationStyle.flat,

          title: Text('No update available'),
        );
      } catch (error) {}
    } else if (status == UpdateStatus.restartRequired) {
      try {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: Text("Restart Your App"),
            actions: [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: Text("Dismiss"),
              ),
            ],
          ),
        );
      } catch (error) {
        debugPrint("$error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          debugPrint("------------");
          // _checkForUpdates();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CalculatorPage()),
          );
        },
        child: Icon(Icons.refresh),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child:
                (_currentPatch == null)
                    ? Text("No Patch Available")
                    : Text("Current Patch: $_currentPatch"),
          ),
          Center(child: Text(" Arijit")),
        ],
      ),
    );
  }
}
