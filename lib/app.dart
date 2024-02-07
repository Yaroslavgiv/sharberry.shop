import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/general_bindings.dart';
import 'features/authentication/screens/onboarding/onboarding.dart';
import 'utils/constants/colors.dart';
import 'utils/constants/text_strings.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBindings(),
        // home: const HomeMenu(),
        // home: const OnBoardingScreen(),
        home: const Scaffold(
          backgroundColor: TColors.buttonPrimary,
          body: Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ));
  }
}
