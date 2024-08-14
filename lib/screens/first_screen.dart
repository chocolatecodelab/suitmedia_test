import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test_application/controllers/app_controller.dart';
import 'package:suitmedia_test_application/screens/second_screen.dart';
import 'package:suitmedia_test_application/widgets/app_button.dart';

class FirstScreen extends StatelessWidget {
  final AppController controller = Get.put(AppController());

  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100, // ukuran lebar avatar
                  height: 100, // ukuran tinggi avatar
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/avatar.png"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape
                        .circle, // membuat bentuk lingkaran untuk avatar
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  onChanged: (value) => controller.name.value = value,
                  decoration: const InputDecoration(
                    hintText: "Name",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) =>
                      controller.palindromeSentence.value = value,
                  decoration: const InputDecoration(
                    hintText: "Palindrome",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
                const SizedBox(height: 20),
                AppButton(
                  label: 'CHECK',
                  onPressed: () {
                    controller
                        .checkPalindrome(controller.palindromeSentence.value);
                    Get.dialog(
                      AlertDialog(
                        content: Text(controller.isPalindrome.value
                            ? "isPalindrome"
                            : "not palindrome"),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                AppButton(
                  label: "NEXT",
                  onPressed: () => Get.to(SecondScreen()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
