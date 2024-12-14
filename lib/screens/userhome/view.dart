import 'package:carousel_slider/carousel_slider.dart';
import 'package:carservice/screens/garages/view.dart';
import 'package:carservice/screens/myreservation/view.dart';
import 'package:carservice/screens/useraccount/view.dart';
import 'package:flutter/material.dart';

import '../customcard/anotherone.dart';
import '../washbasins/view.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {

  int index = 0;
  List<Widget> widgets =[
    const Home(),
    const MyreservationScreen(),
    UseraccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
         
         onTap: (value) {
           setState(() {
             index = value;
           });
         },
        
        currentIndex: index,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,color: Color(0xff0D3C3C)
              ),
              label: "Home",),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month_rounded,color: Color(0xff0D3C3C)
              ),
              label: "reservation"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color(0xff0D3C3C),
              ),
              label: "Profile")
        ],
      ),
      body:widgets[index],
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
        children: [
          Padding(
            padding: EdgeInsets.all(
              MediaQuery.of(context).size.height * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const WashbasinsScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.06,
                          ),
                        ),
                      ],
                    )),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const WashbasinsScreen(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              width: 273,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 135,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                ),
                items: [
                  Container(
                    color: const Color(0xffF8F8F8),
                    child: Column(
                      children: [
                        const Text(
                          'It provides you with car services at any time and in anywhere ..the first application in egypt for car services on deman.',
                          style: TextStyle(color: Color(0xff0D3C3C)),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 130,
                            ),
                            Image.asset(
                              'assets/images/asdasd.png',
                              height: 48,
                              width: 39,
                            ),
                            Image.asset(
                              'assets/images/asdkasjd.png',
                              height: 20,
                              width: 19,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 65,
          ),
          Expanded(
            child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 0.85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 2),
                  children: [
                    CustomCard(
                      name: "washbasins",
                      image: "assets/images/washingbasins.png",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const WashbasinsScreen(),
                          ),
                        );
                      },
                    ),
                    CustomCard(
                      name: "garages",
                      image: "assets/images/garages.png",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => const GarageScreen(),
                          ),
                        );
                      },
                    ),
  // CustomCard(
  //                     name: "all reserv",
  //                     image: "assets/images/garages.png",
  //                     onTap: () {
  //                       Navigator.of(context).push(
  //                         MaterialPageRoute(
  //                           builder: (BuildContext context) => MyreservationScreen(),
  //                         ),
  //                       );
  //                     },
  //                   ),


                  ],
                )),
          ),
        ],
      );
  
  }
}
