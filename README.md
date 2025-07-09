# Over-The-Air-Update_using_Shorebird

This is a step-by-step guide to set up a flutter project using OTA update using Shorebird.

Prerequisites
Before proceeding, ensure you have the following:

Flutter SDK installed (preferably the latest stable version).

A Shorebird account.

Step 1: Install Shorebird

First, you need to install the Shorebird CLI tool. This is used to manage releases and patches for your Flutter app.

    brew install shorebird

Step 2: Configure Shorebird in Your Flutter Project

  1. Navigate to your project directory:

    cd /path/to/your/flutter/project

  2. Initialize Shorebird:

    shorebird init

  3. Add Shorebird dependencies:
     In your pubspec.yaml, add the shorebird_code_push dependency:

         dependencies:
         shorebird_code_push: ^2.0.4
     
     run:

         flutter pub get

   4. Configure Shorebird Engine:
      Shorebird requires its engine to be included in your app. Make sure your Flutter app is built using Shorebird.

Step 3: Build the App Using Shorebird
   
   Build the app for iOS:

      shorebird release --platforms=ios

   Build the app for android:

       shorebird release --platforms=android

Step 4: Create a Release

  Create a Release for iOS:

        shorebird release --platforms=ios

  Create a Release for android:

        shorebird release --platforms=android

Step 5: Implement Code Push in Your App

  1. Import the Shorebird package in your Dart code:

         import 'package:shorebird_code_push/shorebird_code_push.dart';

  2. Initialize Shorebird Code Push in your app:

         void main() async {
         await ShorebirdCodePush.initialize();
         runApp(MyApp());
         }

   3. Check for updates:

          ShorebirdCodePush.checkForUpdates();

Step 6: Create and Apply Patches
    If you need to update your app without releasing a new version, you can create patches. This allows you to send updates (e.g., bug fixes, asset changes) to users without a full app update.
    Create a Patch:
    After making the necessary changes, create a patch using the following command:

         shorebird patch --platforms=ios --release-version=1.0.0+4

   This will create an incremental update (patch) for your app.

   Apply the Patch:
   Once the patch is created, it will be available for users to download and apply the update over the air.

Step 7: Testing the Updates
   To test OTA updates:

  1. Install the app on your device from TestFlight (for iOS) or directly on your Android device.

  2. Make a code change or asset update.

  3. Create a patch using the command in Step 6.

  4. Your app should automatically check for the patch and apply it when it’s available.

Test Using Shorebird Preview:

     shorebird preview --platforms=ios

Additional Resources:

Shorebird Documentation: https://www.shorebird.dev/docs/

Flutter Documentation: https://flutter.dev/docs

Shorebird GitHub: https://github.com/shorebird-dev

Brief Steps for Building an iOS App in Flutter and Uploading to an Internal Website

Step 1: Go to flutter file and then run

    shorebird init

Step 2: run the command

    shorebird release --platforms=ios

Step 3: Go to xcode and archive the app and then upload the signed .ipa file to my internal website.
And then install the app through the generated QR

Step 4: Changed some UI and logic related things to my flutter app

Step 5: Run the command

    shorebird patch --platforms=ios --release-version=1.0.0+1

Step 6: After these steps I open the app and there is a button to check for updates, if updates available then shorebird install the updates in my app and require restart the app.

Step 7: After restarting, all the changes are applied in my uploaded app without installing the whole updated app.

Feel free to reach out if you have any further questions or need assistance!





  




