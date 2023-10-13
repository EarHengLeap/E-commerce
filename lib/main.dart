import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/mainscreen_provider.dart';
import 'pages/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MainScreenNotifier(),
      )
    ],
    child: const App()));
}
