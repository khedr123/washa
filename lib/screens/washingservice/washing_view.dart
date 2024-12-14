import 'package:carservice/models/all_data_service.dart';
import 'package:carservice/models/all_garage.dart';
import 'package:carservice/models/all_service.dart';
import 'package:carservice/screens/reservationdate/view.dart';
import 'package:carservice/screens/washbasins/view.dart';
import 'package:flutter/material.dart';

import '../../models/all_washing_model.dart';
import '../../sharedwidgets/dio_helper.dart';

class WashingServiceScreen extends StatefulWidget {
  const WashingServiceScreen({Key? key,  this.allWashingModel , this.allGarage})
      : super(key: key);
  final AllWashingModel? allWashingModel;
  final AllGarage? allGarage;
  @override
  State<WashingServiceScreen> createState() => _WashingServiceScreenState();
}

class _WashingServiceScreenState extends State<WashingServiceScreen> {
  List<AllService> allCars = [];
  AllService? selectedCar;
  List<AllDataService> allDataService = [];

  void getAllDataservice() async {
    var response = await DioHelper.getData(
        url: 'all_data_service/${widget.allWashingModel?.id ??widget.allGarage!.id }');
    final List<dynamic> responseData = response.data;
    final List<Map<String, dynamic>> data =
    List.castFrom<dynamic, Map<String, dynamic>>(responseData);
    setState(() {
      allDataService =
          data.map((json) => AllDataService.fromJson(json)).toList();
    });

    for (AllDataService washing in allDataService) {
      print(washing.id);
    }

    print(' allDataService length is :${allDataService.length}');
  }

  void getAllCars() async {
    var response = await DioHelper.getData(url: 'all_car');
    final List<dynamic> responseData = response.data;
    final List<Map<String, dynamic>> data =
    List.castFrom<dynamic, Map<String, dynamic>>(responseData);
    setState(() {
      allCars = data.map((json) => AllService.fromJson(json)).toList();
    });

    for (AllService washing in allCars) {
      print(washing.id);
    }
    print(' allService length is :${allCars.length}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllDataservice();
    getAllCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                builder: (BuildContext context) => const WashbasinsScreen(),
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
              top: 62,
              right: MediaQuery.of(context).size.width * 0.60,
              bottom: MediaQuery.of(context).size.width * 0.02,
            ),
            child: const Text(
              "choose your car",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0D3C3C)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<AllService>(
                      value: selectedCar,
                      isExpanded: true,
                      items: allCars.map((AllService option) {
                        return DropdownMenuItem<AllService>(
                          value: option,
                          child: Text(option.name ?? '',),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCar = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Padding(
              padding:
              EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: ListView.builder(
                itemCount: allDataService.length,
                itemBuilder: (context, index) {
                  return DataServiceItem(
                    allDataService: allDataService[index],
                  );
                },
              ),
            ),
          ),

          // Padding(
          //   padding:
          //       EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
          //   child: mytextbutton(
          //     text: "حجز موعد",
          //     rad: 30,
          //     fixhight: MediaQuery.of(context).size.width * 0.9,
          //     fixwidth: MediaQuery.of(context).size.width * 0.13,
          //     color: Color(0xff5D002B),
          //     colortext: Colors.white,
          //     sizetext: 18,
          //     weight: FontWeight.bold,
          //     myfunction: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // )
          // Text(
          //   "                                                        Another Service",
          //   style: TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.bold,
          //       color: Color(0xff0D3C3C)),
          //   textAlign: TextAlign.left,
          // ),
          // SizedBox(
          //   height: 12,
          // ),
          // Container(
          //   height: 74,
          //   width: 292,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8),
          //       color: Color(0xFFFFFFFF),
          //       boxShadow: [
          //         BoxShadow(blurRadius: 1, offset: Offset(0.5, 0.5))
          //       ]),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 22,
          //     ),
          //     child: TextField(
          //       decoration: InputDecoration(
          //           border: InputBorder.none,
          //           hintText: "Tybe Here..",
          //           hintStyle:
          //               TextStyle(fontSize: 14, color: Color(0xFFD9D9D9))),
          //       textAlign: TextAlign.left,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
          //   child: SizedBox(
          //     height: MediaQuery.of(context).size.height * 0.05,
          //     width: MediaQuery.of(context).size.width * 0.8,
          //     child: ElevatedButton(
          //       style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.all(
          //             Color(0xff0D3C3C),
          //           ),
          //           shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(20)))),
          //       child: Text('Reservation'),
          //       onPressed: () {
          //         ;
          //       },
          //     ),
          //   ),
          // ),

        ]),
      ),
    );
  }
}

class DataServiceItem extends StatelessWidget {
  const DataServiceItem({super.key, required this.allDataService});

  final AllDataService allDataService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  ReservationScreen(allDataService: allDataService,)),
              );
            },
            child: Container(
              height: 185,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xffFFFFFF),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 0.3,
                    )
                  ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 90, top: 18),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.29,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xff0D3C3C)),
                          height: 22,
                          width: 100,
                          child: Center(
                              child: Text(
                                allDataService.name ?? '',
                                style: const TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.52, top: 19),
                  child: SizedBox(
                    child: Text(
                      allDataService.description ?? "",
                      style: const TextStyle(
                          color: Color(0xff0D3C3C),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(right: 210, top: 11),
                //   child: SizedBox(
                //     height:
                //     MediaQuery.of(context).size.height * 0.06,
                //     width:
                //     MediaQuery.of(context).size.width * 0.6,
                //     child: Text(
                //       maxLines: 2,
                //       overflow: TextOverflow.ellipsis,
                //       "Car wash with a pressure washer",
                //       style: TextStyle(
                //           color: Color(0xff0D3C3C),
                //           fontSize: 14,
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 242,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff0D3C3C)),
                        height: 28,
                        width: 66,
                        child: Center(
                            child: Text(
                              "${allDataService.price ?? 0}",
                              style: const TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.00),
            child: SizedBox(
              height: 185,
              width: 142,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  // allDataService.image??''
                  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
