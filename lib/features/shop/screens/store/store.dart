
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_products_count.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/products/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/dummy_data.dart';
import '../../controllers/store_controller.dart';
import '../brand/all_brands.dart';
import '../brand/brand.dart';
import '../cart/cart.dart';
import '../home/widgets/header_search_container.dart';
import 'widgets/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoreController());
    final categories = controller.getFeaturedCategories();
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        /// -- Appbar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace / 1.5),
            child: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace / 1.5),
              child: TCartMenuIcon(onPressed: () => Get.to(() => const CartScreen())),
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                // Space between Appbar and TabBar. WithIn this height we have added [Search bar] and [Featured brands]
                expandedHeight: 440,

                /// -- Search & Featured Store
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const THeaderSearchContainer(showBorder: true),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// -- Featured Brands
                      TSectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      /// -- Brands
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          final brand = TDummyData.brands[index];
                          return TBrandWithProductsCount(
                            brand: brand,
                            showBorder: true,
                            onTap: () => Get.to(() => BrandScreen(brand: brand)),
                          );
                        },
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                    ],
                  ),
                ),

                /// -- TABS
                bottom: TTabBar(tabs: categories.map((e) => Tab(child: Text(e.name))).toList()),
              )
            ];
          },

          /// -- TabBar Views
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
