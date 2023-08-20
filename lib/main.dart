
import 'package:e_branch/Screens/HomeScreens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'Helpers/Config.dart';
import 'Providers/Auth/AuthProvider.dart';
import 'Providers/Home/HomeProvider.dart';
import 'Screens/Splashscreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: OKToast(
        child: MaterialApp(
          title: 'E-Branch',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Config.mainColor,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(color: Colors.white,iconTheme: IconThemeData(color: Colors.white)),
          ),
          home:
         const Splashscreen(),
        ),
      ),
    );
  }
}
