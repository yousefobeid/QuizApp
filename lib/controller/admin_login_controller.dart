import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/admin/add_quiz.dart';

class AdminLoginController extends GetxController {
  TextEditingController usernmaecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController option1Controller = TextEditingController();
  FocusNode userNameFoucsNode = FocusNode();
  FocusNode passwordFoucsNode = FocusNode();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  logInAdmain(BuildContext context) {
    if (formKey.currentState!.validate()) {
      FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
        for (var result in snapshot.docs) {
          if (result.data()['id'] != usernmaecontroller.text.trim()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Your id is not correct",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          } else if (result.data()['password'] !=
              passwordController.text.trim()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Your password is not correct",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          } else {
            Route route = MaterialPageRoute(
              builder: (context) => const AddQuiz(),
            );
            Navigator.pushReplacement(context, route);
          }
        }
      });
    }
  }

  String? handleLoginUserName(String? value) {
    if (value == null || value.isEmpty) {
      return " Please Enter UserName";
    }
    return null;
  }

  String? handleLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return " Please Enter Password";
    }
    return null;
  }
}
