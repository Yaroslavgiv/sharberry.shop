
import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../../../data/repositories/banners/banner_repository.dart';
import '../../../data/repositories/brands/brand_repository.dart';
import '../../../data/repositories/categories/category_repository.dart';
import '../../../data/repositories/product/product_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../shop/controllers/brand_controller.dart';
import '../../shop/controllers/categories_controller.dart';
import '../../shop/controllers/dummy_data.dart';
import '../../shop/controllers/product/banner_controller.dart';
import '../../shop/controllers/product/product_controller.dart';

class UploadDataController extends GetxController {
  static UploadDataController get instance => Get.find();

  Future<void> uploadCategories() async {
    try {
      // The following line will enable the Android and iOS wakelock.
      WakelockPlus.enable();

      TFullScreenLoader.openLoadingDialog('Подождите! Ваши КАТЕГОРИИ загружаются...', TImages.cloudUploadingAnimation);

      final controller = Get.put(CategoryRepository());

      // Upload All Categories and replace the Parent IDs in Firebase Console
      await controller.uploadDummyData(TDummyData.categories);

      // Re-fetch latest Categories
      await CategoryController.instance.fetchCategories();

      TLoaders.successSnackBar(title: 'Поздравляем', message: 'Все категории успешно загружены.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // The next line disables the wakelock again.
      WakelockPlus.disable();
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> uploadProductCategories() async {
    try {
      // The following line will enable the Android and iOS wakelock.
      WakelockPlus.enable();

      TFullScreenLoader.openLoadingDialog(
        'Подождите! Загружается связь между вашими ТОВАРНЫМ И КАТЕГОРИЯМИ...',
        TImages.cloudUploadingAnimation,
      );

      final controller = Get.put(CategoryRepository());

      // Upload All Categories and replace the Parent IDs in Firebase Console
      await controller.uploadProductCategoryDummyData(TDummyData.productCategories);

      TLoaders.successSnackBar(title: 'Поздравляем', message: 'Все категории успешно загружены.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // The next line disables the wakelock again.
      WakelockPlus.disable();
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> uploadBrands() async {
    try {
      // The following line will enable the Android and iOS wakelock.
      WakelockPlus.enable();

      TFullScreenLoader.openLoadingDialog('Подождите! Ваши БРЕНДЫ загружаются...', TImages.cloudUploadingAnimation);

      final controller = Get.put(BrandRepository());

      // Upload All Categories and replace the Parent IDs in Firebase Console
      await controller.uploadDummyData(TDummyData.brands);

      // Re-fetch latest Brands
      final brandController = Get.put(BrandController());
      await brandController.getFeaturedBrands();

      TLoaders.successSnackBar(title: 'Поздравляю', message: 'Все бренды загружены.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // The next line disables the wakelock again.
      WakelockPlus.disable();
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> uploadBrandCategory() async {
    try {
      // The following line will enable the Android and iOS wakelock.
      WakelockPlus.enable();

      TFullScreenLoader.openLoadingDialog(
        'Пристегнитесь! Загружается информация о ваших БРЕНДАХ и КАТЕГОРИЯХ...',
        TImages.cloudUploadingAnimation,
      );

      final controller = Get.put(BrandRepository());

      // Upload All Categories and replace the Parent IDs in Firebase Console
      await controller.uploadBrandCategoryDummyData(TDummyData.brandCategory);

      TLoaders.successSnackBar(title: 'Поздравляем!', message: 'Все бренды успешно загружены.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // The next line disables the wakelock again.
      WakelockPlus.disable();
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> uploadProducts() async {
    try {
      // The following line will enable the Android and iOS wakelock.
      WakelockPlus.enable();

      TFullScreenLoader.openLoadingDialog(
        'Подождите! Ваши товары загружаются. Это может занять некоторое время...',
        TImages.cloudUploadingAnimation,
      );

      final controller = Get.put(ProductRepository());

      // Upload All Products and replace the Parent IDs in Firebase Console
      await controller.uploadDummyData(TDummyData.products);

      // Re-fetch latest Featured Products
      ProductController.instance.fetchFeaturedProducts();

      TLoaders.successSnackBar(title: 'Поздравляем!', message: 'Все товары загружены.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // The next line disables the wakelock again.
      WakelockPlus.disable();
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> uploadBanners() async {
    try {
      // The following line will enable the Android and iOS wakelock.
      WakelockPlus.enable();

      TFullScreenLoader.openLoadingDialog('Попейте кофе! Ваши баннеры загружаются. Это может занять некоторое время...', TImages.cloudUploadingAnimation);

      final controller = Get.put(BannerRepository());

      // Upload All Products and replace the Parent IDs in Firebase Console
      await controller.uploadBannersDummyData(TDummyData.banners);

      // Re-fetch latest Banners
      final bannerController = Get.put(BannerController());
      await bannerController.fetchBanners();

      TLoaders.successSnackBar(title: 'Поздравляем!', message: 'Все товары загружены.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // The next line disables the wakelock again.
      WakelockPlus.disable();
      TFullScreenLoader.stopLoading();
    }
  }
}
