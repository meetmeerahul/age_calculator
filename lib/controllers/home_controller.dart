import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString currentAge = ''.obs;

  void calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = (age.inDays % 365) % 30;
    currentAge.value = '$years years, $months months, and $days days';
  }
  
}
