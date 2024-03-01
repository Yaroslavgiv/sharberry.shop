import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/personalization/models/address_model.dart';
import '../authentication/authentication_repository.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /* ---------------------------- FUNCTIONS ---------------------------------*/

  /// Get all order related to current User
  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.firebaseUser!.uid;
      if (userId.isEmpty) throw 'Не удается найти информацию о пользователе. Повторите попытку через несколько минут.';

      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();
    } catch (e) {
      // log e.toString();
      throw 'Что-то пошло не так при получении адресной информации. Попробуйте еще раз позже';
    }
  }

  /// Store new user order
  Future<String> addAddress(AddressModel address, String userId) async {
    try {
      final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Что-то пошло не так при получении адресной информации. Попробуйте еще раз позже';
    }
  }

  /// Clear the "selected" field for all addresses
  Future<void> updateSelectedField(String userId, String addressId, bool selected) async {
    try {
      await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress': selected});
    } catch (e) {
      throw 'Не удалось обновить выбранный вами адрес. Попробуйте еще раз позже';
    }
  }
}
