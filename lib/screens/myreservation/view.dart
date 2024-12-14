import 'package:carservice/models/reservation_modle.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../sharedwidgets/dio_helper.dart';

class MyreservationScreen extends StatefulWidget {
  const MyreservationScreen({Key? key}) : super(key: key);

  @override
  State<MyreservationScreen> createState() => _MyreservationScreenState();
}

class _MyreservationScreenState extends State<MyreservationScreen> {
  GetStorage getStorage = GetStorage();

  List<ReservationModle> allReservation = [];

  void getAllReservation() async {
    var response = await DioHelper.getData(
      url: 'all_order_user/${getStorage.read('userId')}',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
            itemBuilder: (context, index) =>
                ReservItem(reservationModle: allReservation[index]),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
            itemCount: allReservation.length),
      ),
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
            onPressed: () {}),
        title: const Text(
          "My Reservation",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D3C3C)),
        ),
      ),
    );
  }
}

class ReservItem extends StatelessWidget {
  const ReservItem({super.key, required this.reservationModle});

  final ReservationModle reservationModle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: SizedBox(
        height: 296,
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
             Padding(
              padding: const EdgeInsets.only(left: 16, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(reservationModle.name ?? 'send it from api',
                        style: const TextStyle(
                          color: Color(0xff0D3C3C),
                          fontSize: 14,
                        )),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Icon(Icons.car_crash_sharp, color: Color(0xff0D3C3C)),
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
          ]),
        ),
      ),
    );
  }
}
