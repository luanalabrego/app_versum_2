import FirebaseCore
import FirebaseAnalytics
import UIKit
import Flutter
import GoogleCast

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let criteria = GCKDiscoveryCriteria(applicationID: "4D64B6E0")
  let options  = GCKCastOptions(discoveryCriteria: criteria)
  GCKCastContext.setSharedInstanceWith(options)
  
    if (FirebaseApp.app() == nil) {
      FirebaseApp.configure()
      print("✅ FirebaseApp.configure() called in AppDelegate")
    } else {
      print("ℹ️ FirebaseApp already configured")
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
