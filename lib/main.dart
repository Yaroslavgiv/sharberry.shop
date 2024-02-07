import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sharberry_shop/app.dart';
import 'package:sharberry_shop/firebase_options.dart';

import 'data/repositories.authentication/authentication_repository.dart';

Future<void> main() async {
  // Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Init Local Storage
  await GetStorage.init();
  // Await Splash util other items Lood
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Initialize Firebase & Initialize Authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  


  runApp(const App());
}
