import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController homeController = Get.put(HomeController());
  String currentAge = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Age Calculator",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0, 
        actions: [
          IconButton(
            onPressed: () {
          
            },
            icon: const Icon(Icons.settings), 
          ),
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.teal,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cake,
                size: 80,
                color: Colors.teal,
              ),
              const SizedBox(height: 20),
              const Text(
                'Your Current Age',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  homeController.currentAge.value,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => pickDob(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 10),
                    Text(
                      'Select Date of Birth',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pickDob(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.teal,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: const ColorScheme.light(primary: Colors.teal)
                .copyWith(secondary: Colors.teal),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      homeController.calculateAge(pickedDate);
    }
  }


}
