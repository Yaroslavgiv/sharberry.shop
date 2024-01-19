import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../search/search.dart';

class THeaderSearchContainer extends StatelessWidget {
  const THeaderSearchContainer({super.key, this.showBackground = false, this.showBorder = false});

  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const SearchScreen()),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          border: showBorder ? Border.all(color: TColors.grey) : null,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            color: showBackground
                ? THelperFunctions.isDarkMode(context)
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Iconsax.search_normal, color: THelperFunctions.isDarkMode(context) ? TColors.grey : TColors.darkGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('Найти в Магазине', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
