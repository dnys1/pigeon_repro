import Flutter
import UIKit

public class PigeonReproPlugin: NSObject, FlutterPlugin, ToHost {
    func fetchAuthSession(
        completion: @escaping (Result<NativeAuthSession, Error>) -> Void
    ) {
        fromHost.fetchAuthSession { session in
            completion(.success(session))
        }
    }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "pigeon_repro", binaryMessenger: registrar.messenger())
    let instance = PigeonReproPlugin(
        fromHost: FromHost(binaryMessenger: registrar.messenger())
    )
      ToHostSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
  }
    
    init(fromHost: FromHost) {
        self.fromHost = fromHost
    }
    
    let fromHost: FromHost
}
