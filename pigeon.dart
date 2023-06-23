@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/pigeon.g.dart',
    swiftOut: 'ios/Classes/messages.g.swift',
  ),
)
library;

import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class ToHost {
  @async
  NativeAuthSession fetchAuthSession();
}

@FlutterApi()
abstract class FromHost {
  @async
  NativeAuthSession fetchAuthSession();
}

class NativeAuthSession {
  late bool isSignedIn;

  String? userSub;
  NativeUserPoolTokens? userPoolTokens;

  String? identityId;
  NativeAWSCredentials? awsCredentials;
}

class NativeUserPoolTokens {
  late String accessToken;
  late String refreshToken;
  late String idToken;
}

class NativeAWSCredentials {
  late String accessKeyId;
  late String secretAccessKey;
  String? sessionToken;
  String? expirationIso8601Utc;
}
