// File: lib/view/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${controller.errorMessage}'));
        } else {
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.data[index].title),
                subtitle: Text(controller.data[index].description),
              );
            },
          );
        }
      }),
    );
  }
}