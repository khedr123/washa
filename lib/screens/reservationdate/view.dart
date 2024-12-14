import 'package:carservice/screens/finalreservation/view.dart';
import 'package:carservice/screens/map.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/all_data_service.dart';
import '../../sharedwidgets/dio_helper.dart';
import '../../sharedwidgets/input.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key, required this.allDataService})
      : super(key: key);
  final AllDataService allDataService;

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime _selectedValue = DateTime.now();
  bool _value = false;
  bool isLocationCliecd = false;
  final key = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();

  GetStorage getStorage = GetStorage();

  addOrder() async {
    return await DioHelper.postData(
      data: {

        'car': 'tucan',
        'service_id': '${widget.allDataService.id}',
        'price': '${widget.allDataService.price}',
        'time': '$_selectedValue',
        'location':
            '${getStorage.read('long') ?? 00000},${getStorage.read('lat') ?? 00000000}',
        'phone': phoneNumber.text,
        'emergency': '${_value == true ? 0 : 1}',
        'vendor_id': '${widget.allDataService.userId}',
        'user_id': '${getStorage.read('userId')}'
      },
      url: 'add_order',
    );
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
            onPressed: () {}),
        title: const Text(
          "Reservation ",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D3C3C)),
        ),
      ),
      body: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 52,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.black,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedValue = date;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 130,
            ),

            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade300),
                ),
                onPressed: () {
                  setState(() {
                    isLocationCliecd = true;
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const MapSample()));
                  });
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.gps_fixed, color: Colors.black),
                    SizedBox(
                      width: 200,
                    ),
                    Text(
                      'Location',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
            const SizedBox(
              height: 16,
            ),

            SizedBox(
              width: 350,

              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ), //BoxDecoration

                    /** CheckboxListTile Widget **/
                    child: CheckboxListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      secondary: const Text('Emergency'),
                      autofocus: false,
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      selected: _value,
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ), //CheckboxListTile
                  ), //Container
                ), //Padding
              ), //Center
            ), //SizedBox
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.00),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Card(
                  color: const Color(0xffD9D9D9),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                  ),
                  elevation: 7,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.4),
                            child: Text(
                              "${widget.allDataService.price}",
                              style: const TextStyle(
                                  color: Color(0xff0D3C3C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.04),
                            child: const Text(
                              "Total",
                              style: TextStyle(
                                  color: Color(0xff0D3C3C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.2),
                            child: Text(
                              "${widget.allDataService.price}",
                              style: const TextStyle(
                                  color: Color(0xff0D3C3C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04),
                            child: const Text(
                              "Deserved Amount",
                              style: TextStyle(
                                  color: Color(0xff0D3C3C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Input(label: 'phone number', controller: phoneNumber),
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
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff0D3C3C),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  child: const Text('Reservation confirmation'),
                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      var res = await addOrder();
                      if (res.data['message'] ==
                          'the order is send succesfully') {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => elnehaya(
                            name: '${widget.allDataService.name}',
                            date: '$_selectedValue',
                            location:
                                '${getStorage.read('long') ?? 00000},${getStorage.read('lat') ?? 00000000}',
                            price: '${widget.allDataService.price}',
                            phone: phoneNumber.text,
                          ),
                        ));
                      }
                    } else {
                      print('erorr');
                    }
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
