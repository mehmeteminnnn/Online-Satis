import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_satis/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:online_satis/pages/loading_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterNativeSplash.remove(); // Remove the splash screen
  runApp(LoadingPage());
}


/*List<String> kategoriler = [
  "FashionCart",
  "AppliancesCart",
  "BeautyCart",
  "ElectronicCart",
  "FurnitureCart",
];*/

