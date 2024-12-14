import 'package:cached_network_image/cached_network_image.dart';
import 'package:carservice/models/all_washing_model.dart';
import 'package:carservice/screens/userhome/view.dart';
import 'package:carservice/sharedwidgets/cach_helper.dart';
import 'package:carservice/sharedwidgets/dio_helper.dart';
import 'package:flutter/material.dart';
import '../washingservice/washing_view.dart';

class WashbasinsScreen extends StatefulWidget {
  const WashbasinsScreen({Key? key}) : super(key: key);

  @override
  State<WashbasinsScreen> createState() => _WashbasinsScreenState();
}

class _WashbasinsScreenState extends State<WashbasinsScreen> {
  List<AllWashingModel> allWashing = [];

  void getAllWash() async {
    var response = await DioHelper.getData(
        url: 'all_washing', token: CacheHelper.getToken());
    final List<dynamic> responseData = response.data;
    final List<Map<String, dynamic>> data =
        List.castFrom<dynamic, Map<String, dynamic>>(responseData);
        setState(() {
           allWashing = data.map((json) => AllWashingModel.fromJson(json)).toList();
        });
   

    for (AllWashingModel washing in allWashing) {
      print(washing.id);
    }
      print(allWashing.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllWash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.white ,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff0D3C3C),
            ),
            onPressed: () {Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const UserHomeScreen(),
              ),
            );}),
        title: const Text(
          "Washbasins",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D3C3C)),
        ),
      ),
    
      body: SafeArea(
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(4.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              return WashItem(
                allWashingModel: allWashing[index],
              );
            },
            itemCount: allWashing.length),
      ),
    );
  }
}

class WashItem extends StatelessWidget {
  const WashItem({
    super.key,
    required this.allWashingModel
  });
  final AllWashingModel allWashingModel; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WashingServiceScreen(
          allWashingModel: allWashingModel,
        ) ,));
        
      },
      child: Container(
        height: 170,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      allWashingModel.image1??'https://images.unsplash.com/photo-1607860108855-64acf2078ed9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80',
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Text(
                allWashingModel.name ?? '',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
