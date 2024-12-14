import 'package:carservice/screens/userhome/view.dart';
import 'package:flutter/material.dart';

class elnehaya extends StatefulWidget {
  const elnehaya({
    super.key,
    required this.name,
    required this.date,
    required this.price,
    required this.location,
    required this.phone,
  });

  final String name, date, price, location, phone;

  @override
  State<elnehaya> createState() => _elnhaiaState();
}

class _elnhaiaState extends State<elnehaya> {
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
            onPressed: () {Navigator.pop(context);}),
        title: const Text(
          "Thanks",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0D3C3C)),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 118,
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Image.asset('assets/images/aftersplash.jpg'),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.height * 0.1,
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: const Text(
                      "Reservation Completed successfully",
                      style: TextStyle(
                          color: Color(0xff0D3C3C),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 55,
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: SizedBox(
                  height: 340,
                  child: Card(
                    elevation: 4,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Color(0xffE4E4E4))),
                    color: const Color(0xffE4E4E4),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          0.4),
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
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(widget.name,
                                      style: const TextStyle(
                                        color: Color(0xff0D3C3C),
                                        fontSize: 14,
                                      )),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Icon(Icons.car_crash_sharp,
                                    color: Color(0xff0D3C3C)),
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
                                  child: Text(widget.date,
                                      style: const TextStyle(
                                        color: Color(0xff0D3C3C),
                                        fontSize: 14,
                                      )),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Icon(Icons.access_time_outlined,
                                    color: Color(0xff0D3C3C)),
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
                                  child: Text(widget.price,
                                      style: const TextStyle(
                                        color: Color(0xff0D3C3C),
                                        fontSize: 14,
                                      )),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Icon(Icons.money_outlined,
                                    color: Color(0xff0D3C3C)),
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
                                  child: Text(widget.location,
                                      style: const TextStyle(
                                        color: Color(0xff0D3C3C),
                                        fontSize: 14,
                                      )),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Icon(Icons.my_location,
                                    color: Color(0xff0D3C3C)),
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
                                  child: Text(widget.phone,
                                      style: const TextStyle(
                                        color: Color(0xff0D3C3C),
                                        fontSize: 14,
                                      )),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Icon(Icons.phone_android,
                                    color: Color(0xff0D3C3C)),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(left: 90, top: 18),
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.only(left: 79),
                          //         child: Text("0152357865 |",
                          //             style: TextStyle(
                          //               color: Color(0xff0D3C3C),
                          //               fontSize: 14,
                          //             )),
                          //       ),
                          //       SizedBox(
                          //         width: 6,
                          //       ),
                          //       Icon(Icons.wifi_calling_3,
                          //           color: Color(0xff0D3C3C)),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.4),
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xff0D3C3C)),
                              child: const Center(
                                  child: Text(
                                "completed",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ), backgroundColor: const Color(0xff0D3C3C),

                  fixedSize: const Size(314, 44),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const UserHomeScreen(),
                  ));
                },
                child: const Text(
                  "Back To Home",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GapLocation {}
