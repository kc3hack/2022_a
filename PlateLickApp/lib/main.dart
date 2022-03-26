import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/Drawerhiden/hiddendrawer.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:provider/provider.dart';
import 'data/shared/Task_saved.dart';
import 'data/thems.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TaskerPreference.init(); // for initial SharedPerfomance ..
  await Firebase.initializeApp(
    //for initial firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemProvider(),
      builder: (context, _) {
        final themProvider = Provider.of<ThemProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode: themProvider.themeMode,
          darkTheme: Mytheme.darkthem,
          theme: Mytheme.lightthem,
          home: AuthGate(),
        );
      });
}

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(providerConfigs: [
            EmailProviderConfiguration(),
          ]);
        }

        // Render your application if authenticated
        return HiddenDrawer();
      },
    );
  }
}
