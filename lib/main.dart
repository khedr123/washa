
import 'package:carservice/screens/splash/view.dart';
import 'package:carservice/sharedwidgets/cach_helper.dart';
import 'package:carservice/sharedwidgets/dio_helper.dart';
import 'package:carservice/sharedwidgets/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DioHelper.init();

  await CacheHelper.init();
  //CacheHelper.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey:navigatorKey ,
      debugShowCheckedModeBanner: false,
      color: const Color(0xff0D3C3C),
      home:const SplashScreen()
    );
  }
}
