import Flutter
import UIKit

public class PayButtonsPlugin: NSObject, FlutterPlugin {
    private var activeResult: FlutterResult?
    
  public static func register(with registrar: FlutterPluginRegistrar) {
      let messenger = registrar.messenger()
      
      let buttonFactory = ApplePayButtonViewFactory(messenger: messenger)
      registrar.register(buttonFactory, withId: Constants.buttonChannel)
  }
}
