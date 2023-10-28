import 'package:flutter/material.dart';

class SenderProvider extends ChangeNotifier {
  String fullName = '';
  String email = '';
  String phoneNumber = '';
  String country = '';
  String city = '';
  List<String> addressLineList = [''];
  int? postcode;

  setFullName(String value) {
    fullName = value;
    notifyListeners();
  }

  setEmail(String value) {
    email = value;
  }

  setPhoneNumber(String value) {
    phoneNumber = value;
  }

  setCountry(String value) {
    country = value;
  }

  setCity(String value) {
    city = value;
  }

  setAddressLine(String value, int index) {
    addressLineList[index] = value;
  }

  addEmptyItemToAddressList() {
    addressLineList.add('');
    notifyListeners();
  }

  setPostcode(int value) {
    postcode = value;
  }
}
