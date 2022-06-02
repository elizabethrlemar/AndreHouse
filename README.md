Install Flutter SDK
--
Install Flutter for your operating system here: 

https://docs.flutter.dev/get-started/install 

Set Up an Editor
--
Install Android Studio here (Preferred):

https://developer.android.com/studio


Install the Flutter and Dart Plugins 
--

For Mac
1. Start Android Studio.
2. Open plugin preferences (Preferences > Plugins as of v3.6.3.0 or later).
3. Select the Flutter plugin and click Install.
4. Click Yes when prompted to install the Dart plugin.
5. Click Restart when prompted.

For Linux or Windows
1. Open plugin preferences (File > Settings > Plugins).
2. Select Marketplace, select the Flutter plugin and click Install

Set up the Emulator
--
1. Enable VM acceleration on your machine.
2. Launch Android Studio, click the AVD Manager icon, and select Create Virtual Device…
    1. In older versions of Android Studio, you should instead launch Android Studio > Tools > Android > AVD Manager and select Create Virtual Device…. (The Android submenu is only present when inside an Android project.)
    2. If you do not have a project open, you can choose Configure > AVD Manager and select Create Virtual Device…
3. Choose a device definition and select Next.
4. Select one or more system images for the Android versions you want to emulate, and select Next. An x86 or x86_64 image is recommended.
5. Under Emulated Performance, select Hardware - GLES 2.0 to enable hardware acceleration.
6. Verify the AVD configuration is correct, and select Finish.

For details on the above steps, see Managing AVDs.

7. In Android Virtual Device Manager, click Run in the toolbar. The emulator starts up and displays the default canvas for your selected OS version and device.
