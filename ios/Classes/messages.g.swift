// Autogenerated from Pigeon (v10.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeAuthSession {
  var isSignedIn: Bool
  var userSub: String? = nil
  var userPoolTokens: NativeUserPoolTokens? = nil
  var identityId: String? = nil
  var awsCredentials: NativeAWSCredentials? = nil

  static func fromList(_ list: [Any?]) -> NativeAuthSession? {
    let isSignedIn = list[0] as! Bool
    let userSub: String? = nilOrValue(list[1])
    var userPoolTokens: NativeUserPoolTokens? = nil
    if let userPoolTokensList = list[2] as! [Any?]? {
      userPoolTokens = NativeUserPoolTokens.fromList(userPoolTokensList)
    }
    let identityId: String? = nilOrValue(list[3])
    var awsCredentials: NativeAWSCredentials? = nil
    if let awsCredentialsList = list[4] as! [Any?]? {
      awsCredentials = NativeAWSCredentials.fromList(awsCredentialsList)
    }

    return NativeAuthSession(
      isSignedIn: isSignedIn,
      userSub: userSub,
      userPoolTokens: userPoolTokens,
      identityId: identityId,
      awsCredentials: awsCredentials
    )
  }
  func toList() -> [Any?] {
    return [
      isSignedIn,
      userSub,
      userPoolTokens?.toList(),
      identityId,
      awsCredentials?.toList(),
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeUserPoolTokens {
  var accessToken: String
  var refreshToken: String
  var idToken: String

  static func fromList(_ list: [Any?]) -> NativeUserPoolTokens? {
    let accessToken = list[0] as! String
    let refreshToken = list[1] as! String
    let idToken = list[2] as! String

    return NativeUserPoolTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      idToken: idToken
    )
  }
  func toList() -> [Any?] {
    return [
      accessToken,
      refreshToken,
      idToken,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct NativeAWSCredentials {
  var accessKeyId: String
  var secretAccessKey: String
  var sessionToken: String? = nil
  var expirationIso8601Utc: String? = nil

  static func fromList(_ list: [Any?]) -> NativeAWSCredentials? {
    let accessKeyId = list[0] as! String
    let secretAccessKey = list[1] as! String
    let sessionToken: String? = nilOrValue(list[2])
    let expirationIso8601Utc: String? = nilOrValue(list[3])

    return NativeAWSCredentials(
      accessKeyId: accessKeyId,
      secretAccessKey: secretAccessKey,
      sessionToken: sessionToken,
      expirationIso8601Utc: expirationIso8601Utc
    )
  }
  func toList() -> [Any?] {
    return [
      accessKeyId,
      secretAccessKey,
      sessionToken,
      expirationIso8601Utc,
    ]
  }
}

private class ToHostCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return NativeAWSCredentials.fromList(self.readValue() as! [Any?])
      case 129:
        return NativeAuthSession.fromList(self.readValue() as! [Any?])
      case 130:
        return NativeUserPoolTokens.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class ToHostCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? NativeAWSCredentials {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? NativeAuthSession {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else if let value = value as? NativeUserPoolTokens {
      super.writeByte(130)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class ToHostCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return ToHostCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return ToHostCodecWriter(data: data)
  }
}

class ToHostCodec: FlutterStandardMessageCodec {
  static let shared = ToHostCodec(readerWriter: ToHostCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol ToHost {
  func fetchAuthSession(completion: @escaping (Result<NativeAuthSession, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class ToHostSetup {
  /// The codec used by ToHost.
  static var codec: FlutterStandardMessageCodec { ToHostCodec.shared }
  /// Sets up an instance of `ToHost` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: ToHost?) {
    let fetchAuthSessionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ToHost.fetchAuthSession", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      fetchAuthSessionChannel.setMessageHandler { _, reply in
        api.fetchAuthSession() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      fetchAuthSessionChannel.setMessageHandler(nil)
    }
  }
}
private class FromHostCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return NativeAWSCredentials.fromList(self.readValue() as! [Any?])
      case 129:
        return NativeAuthSession.fromList(self.readValue() as! [Any?])
      case 130:
        return NativeUserPoolTokens.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class FromHostCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? NativeAWSCredentials {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? NativeAuthSession {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else if let value = value as? NativeUserPoolTokens {
      super.writeByte(130)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class FromHostCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return FromHostCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return FromHostCodecWriter(data: data)
  }
}

class FromHostCodec: FlutterStandardMessageCodec {
  static let shared = FromHostCodec(readerWriter: FromHostCodecReaderWriter())
}

/// Generated class from Pigeon that represents Flutter messages that can be called from Swift.
class FromHost {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger){
    self.binaryMessenger = binaryMessenger
  }
  var codec: FlutterStandardMessageCodec {
    return FromHostCodec.shared
  }
  func fetchAuthSession(completion: @escaping (NativeAuthSession) -> Void) {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.FromHost.fetchAuthSession", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage(nil) { response in
      let result = response as! NativeAuthSession
      completion(result)
    }
  }
}