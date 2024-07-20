import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gest_life/core/constants/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gest_life/firebase_options.dart';
import 'package:gest_life/google/GoogleSignInProvider.dart';
import 'package:gest_life/ui/MainPage.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: MaterialTheme.lightScheme(), // ou MaterialAccentColorScheme.light() se aplicável
          ),
          darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: MaterialTheme.darkScheme()),
          title: 'GestaLife',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
          ],
          home: const MainPage(),
        ),
      );
}
