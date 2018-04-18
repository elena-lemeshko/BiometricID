##### Some Touch ID case on iOS 11

The app requests a Touch ID on its launch and does nothing excepts the one thing - launching the app and blocking the device by pressing the power button __twice__ will cause a loop of reappearing alerts on the blocked device's screen.

Sample code of the auth process is taken from the [Apple's documentation](https://developer.apple.com/documentation/localauthentication/)
