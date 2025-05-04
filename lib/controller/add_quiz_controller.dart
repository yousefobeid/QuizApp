import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddQuizController extends GetxController {
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  TextEditingController correctController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var selectedValue;

  List<String> quizitem = ["Animal", "Sports", "Random", "Fruits", "Objects"];

  void handleSelectedValue(String? newValue) {
    if (newValue != null && quizitem.contains(newValue)) {
      selectedValue = newValue;
      update();
    }
  }

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  Future<void> getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    update();
  }
}
