import 'dart:developer';
import 'package:carservice/screens/addservice/view.dart';
import 'package:carservice/screens/vendorhome/cubit/cubit.dart';
import 'package:carservice/sharedwidgets/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';


import '../../models/reservation_modle.dart';
import '../../sharedwidgets/cach_helper.dart';
import '../splash/view.dart';
import '../uploadvendorimage/view.dart';
import 'cubit/state.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({Key? key}) : super(key: key);

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {


  List<ReservationModle> allReservation = [];
  GetStorage getStorage = GetStorage();



  void getAllReservation() async {
    var response = await DioHelper.getData(
      url: 'all_order_vendor/${getStorage.read('userId')}',
    );
    final List<dynamic> responseData = response.data;
    final List<Map<String, dynamic>> data =
        List.castFrom<dynamic, Map<String, dynamic>>(responseData);
    setState(() {
      allReservation =
          data.map((json) => ReservationModle.fromJson(json)).toList();
    });

    for (ReservationModle washing in allReservation) {
      print(washing.id);
    }
    print(allReservation.length);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllReservation();
  }



  void myData() {
    GetStorage getStorage = GetStorage();
    String category = getStorage.read('myUserData')['token'];


    print(category);
  }


   
    updateOrder( {required int orderId ,required String status }) async{
      return await DioHelper.postData(
        data: {
            '_method': 'put',
            'status':status
        },
      url: 'update_status/$orderId',
    );
    }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) {
        final cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text(
              "Reservation",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0D3C3C)),
            ),
          ),
          body:  Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
              itemBuilder: (context, index) =>
                  reservItem(reservationModle: allReservation[index],
                
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: allReservation.length),
          ),
          drawer: Drawer(
            backgroundColor: const Color(0xff0D3C3C),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                    onTap: cubit.chooseMyImage,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 39),
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        height: 155,
                        width: 154,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: BlocBuilder<HomeCubit, HomeStates>(
                            builder: (context, state) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              if (cubit.myImage != null)
                                Image.file(
                                  cubit.myImage!,
                                  fit: BoxFit.contain,
                                ),
                              Icon(
                                Icons.camera,
                                color: cubit.myImage != null
                                    ? Colors.white
                                    : Colors.black,
                              )
                            ],
                          );
                        }),
                      ),
                    )),
                const SizedBox(
                  height: 120,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const UploadSceen(),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.account_circle_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 110,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () { Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const AddserviceScreen(),
                      ),
                    );},
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.account_circle_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add Service',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.account_circle_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.account_circle_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Contact Us ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                       getStorage.remove('userId');
                     CacheHelper.clear();
                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SplashScreen(),));
                    },
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.account_circle_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Log Out ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                        )
                      ],
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }

  reservItem({ required  reservationModle}){
return  Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: SizedBox(
        height: 330,
        child: Card(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xffE4E4E4))),
          color: const Color(0xffE4E4E4),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.04),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.4),
                    child: const Icon(
                      Icons.exposure_zero,
                      color: Color(0xffE4E4E4),
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        " Reservation Details",
                        style: TextStyle(
                            color: Color(0xff0D3C3C),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Icon(Icons.calendar_month_outlined,
                      color: Color(0xff0D3C3C))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.58),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: Colors.white),
                child: const Center(
                    child: Text(
                  "#201302",
                  style: TextStyle(color: Color(0xff0D3C3C)),
                )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text("SPLASH , Sream washing|",
                        style: TextStyle(
                          color: Color(0xff0D3C3C),
                          fontSize: 14,
                        )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.car_crash_sharp, color: Color(0xff0D3C3C)),
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 16, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("${reservationModle.createdAt}",
                        style: const TextStyle(
                          color: Color(0xff0D3C3C),
                          fontSize: 14,
                        )),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Icon(Icons.access_time_outlined, color: Color(0xff0D3C3C)),
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 16, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("${reservationModle.price}",
                        style: const TextStyle(
                          color: Color(0xff0D3C3C),
                          fontSize: 14,
                        )),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Icon(Icons.money_outlined, color: Color(0xff0D3C3C)),
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 16, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("${reservationModle.location}",
                        style: const TextStyle(
                          color: Color(0xff0D3C3C),
                          fontSize: 14,
                        )),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Icon(Icons.my_location, color: Color(0xff0D3C3C)),
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 16, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("${reservationModle.phone}",
                        style: const TextStyle(
                          color: Color(0xff0D3C3C),
                          fontSize: 14,
                        )),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Icon(Icons.wifi_calling_3, color: Color(0xff0D3C3C)),
                ],
              ),
            ),
           reservationModle.status == 'under review'? Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Row(children: [
                ElevatedButton(onPressed: ()async{
                  log('reservationModle id :${reservationModle.id}');
                    await updateOrder(orderId: reservationModle.id! ,status: 'accept');
                    getAllReservation();
                  
                },   style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade300)
                  ),
                
                child: const Text('Accept', style: TextStyle(
                    color: Colors.black
                  ))),
                const SizedBox(width: 12,),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade300)
                  ),
                  onPressed: ()async{
                     await updateOrder(orderId: reservationModle.id! ,status: 'cancel');
                    getAllReservation();

                     
                  }, child: const Text('Cancel' ,style: TextStyle(
                    color: Colors.black
                  ),)),
              ],),
            ) : const SizedBox(),
          ]),
        ),
      ),
    );
 
  }
}


