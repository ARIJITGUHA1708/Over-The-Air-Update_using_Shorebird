<<<<<<< HEAD
# shore_bird_demo3

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

# Over-The-Air-Update_using_Shorebird

This is a step-by-step guide to set up a flutter project using OTA update using Shorebird (Currently working only for generated .ipa files)

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

Step 3: Create a Release

  Create a Release for iOS:

        shorebird release --platforms=ios

  Create a Release for android:

        shorebird release --platforms=android

Step 4: Implement Code Push in Your App

  1. Import the Shorebird package in your Dart code:

         import 'package:shorebird_code_push/shorebird_code_push.dart';

  2. Initialize Shorebird Code Push in your app:

         void main() async {
         await ShorebirdCodePush.initialize();
         runApp(MyApp());
         }

   3. Check for updates:

          ShorebirdCodePush.checkForUpdates();

Step 5: Create and Apply Patches
    If you need to update your app without releasing a new version, you can create patches. This allows you to send updates (e.g., bug fixes, asset changes) to users without a full app update.
    Create a Patch:
    After making the necessary changes, create a patch using the following command:

         shorebird patch --platforms=ios --release-version=1.0.0+4

   This will create an incremental update (patch) for your app.

   Apply the Patch:
   Once the patch is created, it will be available for users to download and apply the update over the air.

Step 8: Testing the Updates
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

Brief Steps I used to build my iOS app and upload the .ipa file to my internal website

Step 1: I went to the Flutter project and ran:

    shorebird init

Step 2: I ran the command:

    shorebird release --platforms=ios

Step 3: I opened Xcode, archived the app, and uploaded the signed .ipa file to the internal website. Then I installed the app using the generated QR code.

Step 4: I changed some UI and logic-related elements in the Flutter app.

Step 5: I ran the command:

    shorebird patch --platforms=ios --release-version=1.0.0+1

Step 6: After these steps, I opened the app. There was a button to check for updates, and if updates were available, Shorebird installed them in my app and required restarting the app.

Step 7: After restarting, all the changes were applied to my uploaded app without reinstalling the entire updated app.

(Further R&D was required for TestFlight and App Store uploads.)

Note: If anyone would like to contribute to this project, please create a new branch, make your changes, and submit a Pull Request (PR) for review. Once the PR is approved and merged, the changes can be included in the next release or patch.





  




>>>>>>> 95aa0379a1b3e6b3de9e836bd85df522eef1517a
