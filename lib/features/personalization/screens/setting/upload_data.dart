import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/upload_data_controller.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadDataController());
    return Scaffold(
      appBar: const TAppBar(title: Text('Загружать данные'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Profile Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TSectionHeading(title: 'Основная запись', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.category, size: 28, color: TColors.primary),
                    title: Text('Загрузить категории', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadCategories(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.shop, size: 28, color: TColors.primary),
                    title: Text('Загрузить бренды', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBrands(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.shopping_cart, size: 28, color: TColors.primary),
                    title: Text('Загрузить продукты', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadProducts(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.image, size: 28, color: TColors.primary),
                    title: Text('Загрузить бренды', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBanners(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'Отношения', showActionButton: false),
                  const Text('Убедитесь, что вы уже загрузили весь вышеуказанный контент.'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.link, size: 28, color: TColors.primary),
                    title: Text('Загружать данные о соотношении брендов и категорий', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBrandCategory(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.link, size: 28, color: TColors.primary),
                    title: Text('Загружать реляционные данные о категориях продуктов', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadProductCategories(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
