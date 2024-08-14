import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test_application/controllers/app_controller.dart';
import 'package:suitmedia_test_application/screens/third_screen.dart';
import 'package:suitmedia_test_application/widgets/app_button.dart';

class SecondScreen extends StatelessWidget {
  final AppController controller = Get.find<AppController>();

  SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: const Color.fromARGB(255, 211, 211, 211),
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  Obx(() => Text(
                        controller.name.value,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Obx(() => Text(
                        controller.selectedUserName.value != ''
                            ? controller.selectedUserName.value
                            : "Selected User Name",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      )),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 300,
                height: 50,
                child: AppButton(
                  onPressed: () => Get.to(const ThirdScreen()),
                  label: "Choose a User",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
