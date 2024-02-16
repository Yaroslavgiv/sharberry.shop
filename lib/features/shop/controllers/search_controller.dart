
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../models/product_model.dart';

class TSearchController extends GetxController {
  static TSearchController get instance => Get.find();

  RxList<ProductModel> searchResults = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  RxString lastSearchQuery = ''.obs;
  RxDouble minPrice = 0.0.obs;
  RxDouble maxPrice = double.infinity.obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedCategoryId = ''.obs;
  List<String> sortingOptions = ['По названию', 'От меньшей цены', 'От большей цены', 'Популярные', 'Новинки', 'Подходящие'];
  RxString selectedSortingOption = 'По названию'.obs; // Default sorting option

  void search() {
    searchProducts(
      searchQuery.value,
      categoryId: selectedCategoryId.value.isNotEmpty ? selectedCategoryId.value : null,
      minPrice: minPrice.value != 0.0 ? minPrice.value : null,
      maxPrice: maxPrice.value != double.infinity ? maxPrice.value : null,
      sortingOption: selectedSortingOption.value,
    );
  }


  void searchProducts(String query, {String? categoryId, String? brandId, double? minPrice, double? maxPrice, required String sortingOption}) async {
    lastSearchQuery.value = query;
    isLoading.value = true;

    try {
      final results = await ProductRepository.instance
          .searchProducts(query, categoryId: categoryId, brandId: brandId, maxPrice: maxPrice, minPrice: minPrice);

      // Apply sorting
      switch (sortingOption) {
        case 'По названию':
        // Sort by name
          results.sort((a, b) => a.title.compareTo(b.title));
          break;
        case 'От меньшей цены':
        // Sort by price in ascending order
          results.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'От большей цены':
        // Sort by price in descending order
          results.sort((a, b) => b.price.compareTo(a.price));
          break;
      // Add other sorting cases as needed
      }

      // Update searchResults with sorted results
      searchResults.assignAll(results);
    } catch (e) {
      if (kDebugMode) {
        print('Ошибка при извлечении данных: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
