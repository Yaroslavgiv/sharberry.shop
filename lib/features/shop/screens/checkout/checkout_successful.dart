import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../home_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';


class CheckoutSuccessfulScreen extends StatelessWidget {
  const CheckoutSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TDeviceUtils.getAppBarHeight()),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: TSizes.spaceBtwSections * 4),
              Image(
                image: const AssetImage(TImages.successfulPaymentIcon),
                width: TDeviceUtils.getScreenWidth(context) * 0.5,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text('Payment Success!', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text('Your item will be shipped soon!', style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(const HomeMenu()),
                  child: const Text('Continue Shopping'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
