import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../controllers/categories_controller.dart';
import '../../all_products/all_products.dart';

class CadegoryList extends StatelessWidget {
  final categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    final categories = categoryController.allCategories;
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: -300,
              verticalOffset: -850,
              child: GestureDetector(
                onTap: () => Get.to(
                    () => AllProducts(
                      title: categories[index].name,
                      futureMethod: categoryController.getCategoryProducts(
                          categoryId: categories[index].id),
                    ),
                  ),
                child: Container(
                  decoration: BoxDecoration(
                    color: TColors.accent,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: _w / 20),
                  height: _w / 6,
                  child: Center(
                    child: Text(
                      categories[index].name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
