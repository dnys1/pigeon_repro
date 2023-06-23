import 'package:flutter/material.dart';
import 'package:pigeon_repro/pigeon.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FromHost.setup(Api());
  runApp(const MainApp());
}

class Api implements FromHost {
  @override
  Future<NativeAuthSession> fetchAuthSession() async {
    return NativeAuthSession(isSignedIn: true);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            // Perform a roundtrip
            onPressed: () => ToHost().fetchAuthSession(),
            child: const Text('Trigger crash'),
          ),
        ),
      ),
    );
  }
}
