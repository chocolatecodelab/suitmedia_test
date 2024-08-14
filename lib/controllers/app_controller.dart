import 'package:get/get.dart';

class AppController extends GetxController {
  var name = ''.obs;
  var palindromeSentence = ''.obs;
  var isPalindrome = false.obs;
  var selectedUserName = ''.obs;

  void checkPalindrome(String text) {
    String reversedText = text.split('').reversed.join('');
    isPalindrome.value = text.replaceAll(' ', '').toLowerCase() ==
        reversedText.replaceAll(' ', '').toLowerCase();
  }

  void setSelectedUserName(String name) {
    selectedUserName.value = name;
  }
}
