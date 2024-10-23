import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/home_screen.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/screens/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  late TextEditingController emailAddress = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController signup_email = TextEditingController();
  late TextEditingController signup_password = TextEditingController();
  late TextEditingController reset_password = TextEditingController();

  final RxBool loader = false.obs;

  void signInWithEmailAndPassword() async {
    try {
      loader.value = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress.text,
        password: password.text,
      );

      Get.snackbar(
        'Success',
        'Login Success',
        backgroundColor: const Color.fromARGB(160, 81, 160, 136),
        barBlur: 3.0,
        colorText: Colors.white,
        borderRadius: 5,
        borderWidth: 50,
        dismissDirection: DismissDirection.horizontal,
      );

      emailAddress.clear();
      password.clear();
      loader.value = false;
      Get.offAll(() => NavigationScreen());
    } on FirebaseAuthException catch (e) {
      loader.value = false;

      // Check for specific FirebaseAuthException codes
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
          backgroundColor: const Color.fromARGB(160, 81, 160, 136),
          barBlur: 3.0,
          colorText: Colors.white,
          borderRadius: 5,
          borderWidth: 50,
          dismissDirection: DismissDirection.horizontal,
        );
        emailAddress.clear();
        password.clear();
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
          backgroundColor: const Color.fromARGB(160, 81, 160, 136),
          barBlur: 3.0,
          colorText: Colors.white,
          borderRadius: 5,
          borderWidth: 50,
          dismissDirection: DismissDirection.horizontal,
        );
        // Only clear the password field on wrong-password error

        password.clear();
      } else if (e.code == 'user-disabled') {
        Get.snackbar(
          'Error',
          'This user account has been disabled.',
          backgroundColor: const Color.fromARGB(160, 81, 160, 136),
          barBlur: 3.0,
          colorText: Colors.white,
          borderRadius: 5,
          borderWidth: 50,
          dismissDirection: DismissDirection.horizontal,
        );
        emailAddress.clear();
        password.clear();
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Error',
          'The email address is not valid.',
          backgroundColor: const Color.fromARGB(160, 81, 160, 136),
          barBlur: 3.0,
          colorText: Colors.white,
          borderRadius: 5,
          borderWidth: 50,
          dismissDirection: DismissDirection.horizontal,
        );
        emailAddress.clear();
      } else {
        // Handle other possible errors
        Get.snackbar(
          'Error',
          'An unexpected error occurred. Please try again later.',
          backgroundColor: const Color.fromARGB(160, 81, 160, 136),
          barBlur: 3.0,
          colorText: Colors.white,
          borderRadius: 5,
          borderWidth: 50,
          dismissDirection: DismissDirection.horizontal,
        );
        emailAddress.clear();
        password.clear();
      }
    } catch (e) {
      // Catch any other errors that are not FirebaseAuthExceptions
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again later.',
        backgroundColor: const Color.fromARGB(160, 81, 160, 136),
        barBlur: 3.0,
        colorText: Colors.white,
        borderRadius: 5,
        borderWidth: 50,
        dismissDirection: DismissDirection.horizontal,
      );
      emailAddress.clear();
      password.clear();
      loader.value = false;
    }
  }

  void signUp() async {
    try {
      loader.value = true;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signup_email.text,
        password: signup_password.text,
      );

      Get.snackbar(
        "Success",
        "Account Created",
        backgroundColor: const Color.fromARGB(160, 81, 160, 136),
        barBlur: 3.0,
        colorText: Colors.white,
        borderRadius: 5,
        borderWidth: 50,
        dismissDirection: DismissDirection.horizontal,
      );
      emailAddress.clear();
      password.clear();
      loader.value = false;
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      loader.value = false;
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Weak Password",
          'The password provided is too weak.',
          backgroundColor: const Color.fromARGB(160, 81, 160, 136),
          barBlur: 3.0,
          colorText: Colors.white,
          borderRadius: 5,
          borderWidth: 50,
          dismissDirection: DismissDirection.horizontal,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Email Already Exists",
          'The account already exists for that email.',
          backgroundColor: const Color.fromARGB(160, 81, 160, 136),
          barBlur: 3.0,
          colorText: Colors.white,
          borderRadius: 5,
          borderWidth: 50,
          dismissDirection: DismissDirection.horizontal,
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void sendPasswordResetEmail() async {
    try {
      loader.value = true;
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: reset_password.text);
      Get.snackbar(
        'Password Reset',
        'Password reset email sent to ${reset_password.text}',
        backgroundColor: const Color.fromARGB(160, 81, 160, 136),
        barBlur: 3.0,
        colorText: Colors.white,
        borderRadius: 5,
        borderWidth: 50,
        dismissDirection: DismissDirection.horizontal,
      );
    } catch (e) {
      // Handle errors
      Get.snackbar(
        'Password Reset',
        'Failed to send password reset email: $e',
        backgroundColor: const Color.fromARGB(160, 81, 160, 136),
        barBlur: 3.0,
        colorText: Colors.white,
        borderRadius: 5,
        borderWidth: 50,
        dismissDirection: DismissDirection.horizontal,
      );
    } finally {
      loader.value = false;
    }
  }

  static void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
      Get.snackbar(
        "Logout",
        "Logout successfully",
        backgroundColor: const Color.fromARGB(160, 81, 160, 136),
        barBlur: 3.0,
        colorText: Colors.white,
        borderRadius: 5,
        borderWidth: 50,
        dismissDirection: DismissDirection.horizontal,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to sign out: $e",
        backgroundColor: const Color.fromARGB(160, 81, 160, 136),
        barBlur: 3.0,
        colorText: Colors.white,
        borderRadius: 5,
        borderWidth: 50,
        dismissDirection: DismissDirection.horizontal,
      );
    }
  }
}
