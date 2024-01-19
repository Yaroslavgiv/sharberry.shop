
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/controllers/dummy_data.dart';
import '../../controllers/address_controller.dart';
import 'add_new_address.dart';
import 'widgets/single_address_widget.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrowIcon: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
        actions: [TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(() => const AddNewAddressScreen()))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: TDummyData.user.addresses!
                .map((address) =>
                    TSingleAddressWidget(address: address, onTap: () => controller.selectedAddress.value = address))
                .toList(),
          ),
        ),
      ),
    );
  }
}
