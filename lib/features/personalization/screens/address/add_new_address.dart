import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Добавте новый адрес')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => TValidator.validateEmptyText('Имя', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Имя'),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: TValidator.validatePhoneNumber,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Телефон'),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => TValidator.validateEmptyText('Улица', value),
                        expands: false,
                        decoration: const InputDecoration(
                          labelText: 'Улица',
                          prefixIcon: Icon(Iconsax.building_31),
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => TValidator.validateEmptyText('Номер дома и квартиры', value),
                        expands: false,
                        decoration: const InputDecoration(
                          labelText: 'Номер дома и квартиры',
                          prefixIcon: Icon(Iconsax.code),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => TValidator.validateEmptyText('Город', value),
                        expands: false,
                        decoration: const InputDecoration(
                          labelText: 'Город',
                          prefixIcon: Icon(Iconsax.building),
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    // Expanded(
                    //   child: TextFormField(
                    //     controller: controller.state,
                    //     validator: (value) => TValidator.validateEmptyText('Область', value),
                    //     expands: false,
                    //     decoration: const InputDecoration(
                    //       labelText: 'Область',
                    //       prefixIcon: Icon(Iconsax.activity),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                // const SizedBox(height: TSizes.spaceBtwInputFields),
                // TextFormField(
                //   controller: controller.country,
                //   validator: (value) => TValidator.validateEmptyText('Строна', value),
                //   decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Строна'),
                // ),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child:
                  ElevatedButton(onPressed: () => controller.addNewAddresses(), child: const Text('Сохранить')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}