
// File: lib/controller/home_controller.dart
import 'package:carservice/screens/kkkk/service.dart';
import 'package:get/get.dart';
import 'model.dart';

class HomeController extends GetxController {
  var data = <ItemModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var response = await apiService.fetchData('example-endpoint');
      data.assignAll(response.map((item) => ItemModel.fromJson(item)).toList());
    } catch (error) {
      errorMessage(error.toString());
    } finally {
      isLoading(false);
    }
  }
}