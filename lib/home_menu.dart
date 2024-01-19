
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sharberry_shop/features/shop/screens/home/home.dart';

import 'features/personalization/screens/setting/settings.dart';
import 'features/shop/screens/favourites/favourite.dart';
import 'features/shop/screens/store/store.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScreenController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          animationDuration: const Duration(seconds: 3),
          selectedIndex: controller.selectedMenu.value,
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : Colors.white,
          elevation: 0,
          indicatorColor: THelperFunctions.isDarkMode(context) ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          onDestinationSelected: (index) => controller.selectedMenu.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Главный'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Категории'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Избранное'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Профиль'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
    );
  }
}

class AppScreenController extends GetxController {
  static AppScreenController get instance => Get.find();

  final Rx<int> selectedMenu = 0.obs;

  final screens = [const HomeScreen(), const StoreScreen(), const FavouriteScreen(), const SettingsScreen()];
}
