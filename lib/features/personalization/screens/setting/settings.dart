import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../home_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/cart/cart.dart';
import '../../../shop/screens/order/order.dart';
import '../../controllers/user_controller.dart';
import '../address/address.dart';
import '../profile/profile.dart';
import 'upload_data.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return PopScope(
      canPop: false,
      // Intercept the back button press and redirect to Home Screen
      onPopInvoked: (value) async => Get.offAll(const HomeMenu()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// -- Header
              TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// AppBar
                    TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),

                    /// User Profile Card
                    TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),

              /// -- Profile Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// -- Account  Settings
                    const TSectionHeading(title: 'Настройка аккаунта', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'Мой адрес',
                      subTitle: 'Укажите адрес доставки покупок',
                      onTap: () => Get.to(() => const UserAddressScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'Корзина',
                      subTitle: 'Добавляйте, удаляйте товары и переходите к оформлению заказа',
                      onTap: () => Get.to(() => const CartScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'История покупок',
                      subTitle: 'Незавершенные и завершенные заказы',
                      onTap: () => Get.to(() => const OrderScreen()),
                    ),
                    const TSettingsMenuTile(
                        icon: Iconsax.bank, title: 'Номер карты', subTitle: 'Вывести остаток средств на карту'),
                    // const TSettingsMenuTile(
                    //     icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                    TSettingsMenuTile(
                        icon: Iconsax.notification, title: 'Уведомления', subTitle: 'Установите любой вид уведомительного сообщения', onTap: () {}),
                    // const TSettingsMenuTile(
                    //     icon: Iconsax.security_card, title: 'Конфиденциальность', subTitle: 'Управление использованием данных'),

                    /// -- App Settings
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const TSectionHeading(title: 'Настройки приложения', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Загрузить данные',
                      subTitle: 'Загружайте данные в свою облачную базу данных Firebase',
                      onTap: () => Get.to(() => const UploadDataScreen()),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // TSettingsMenuTile(
                    //   icon: Iconsax.location,
                    //   title: 'Г',
                    //   subTitle: 'Set recommendation based on location',
                    //   trailing: Switch(value: true, onChanged: (value) {}),
                    // ),
                    // TSettingsMenuTile(
                    //   icon: Iconsax.security_user,
                    //   title: 'Safe Mode',
                    //   subTitle: 'Search result is safe for all ages',
                    //   trailing: Switch(value: false, onChanged: (value) {}),
                    // ),
                    // TSettingsMenuTile(
                    //   icon: Iconsax.image,
                    //   title: 'HD Image Quality',
                    //   subTitle: 'Set image quality to be seen',
                    //   trailing: Switch(value: false, onChanged: (value) {}),
                    // ),

                    /// -- Logout Button
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                        width: double.infinity, child: OutlinedButton(onPressed: () => controller.logout(), child: const Text('Выйти из аккаунта'))),
                    const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
