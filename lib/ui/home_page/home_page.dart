import 'package:flutter/material.dart';
import 'package:mob_car_2/db_developer_test/get_car_db.dart';
import 'package:mob_car_2/ui/home_page/widget/drawer_home.dart';
import 'package:mob_car_2/ui/home_page/widget/register_car_home.dart';
import 'package:mob_car_2/ui/home_page/widget/reserve_car_home.dart';
import 'package:mob_car_2/ui/home_page/widget/title_info_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  GetCarDb _getCarDb = GetCarDb();



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          key: _key,
          appBar: AppBar(
            actions: [
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      IconData(0xe800, fontFamily: "mobCarIn"),
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
            ],
            backgroundColor: Colors.black,
            leading: Column(
              children: const [
                Icon(
                  IconData(0xe800, fontFamily: "steeringWheel"),
                  color: Colors.blue,
                ),
                Text(
                  "mob car",
                  style: TextStyle(color: Colors.blue, fontSize: 10.0),
                )
              ],
            ),
          ),
          endDrawer: DrawerHome(
            key: UniqueKey(),
            size: size,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: FutureBuilder<List<dynamic>>(
              future: _getCarDb.getAllCars(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Container(color: Colors.red);
                }
                return ListView(

                  children: [
                  const  Text(
                      "Title 1",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                       const Text("Title 2", style: TextStyle(fontSize: 17.0)),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () async{

                            registerCarHome(context,
                                url:
                                "https://cdn.motor1.com/images/mgl/VobQz/s1/10-carros-brasileiros-com-nomes-curiosos-no-exterior.jpg");

                          },
                          child: const Text(
                            "Add new",
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.black),
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              )),
                        ),
                      ],
                    ),
                    ...snapshot.data!.map<TitleInfoHome>((e) =>TitleInfoHome(
                        title: e["Modelo"],
                        year: e["AnoModelo"].toString(),
                        view: () {},
                        edit: () {
                          reserveCarHome(context,
                            url:
                            "https://cdn.motor1.com/images/mgl/VobQz/s1/10-carros-brasileiros-com-nomes-curiosos-no-exterior.jpg",
                          );
                        },
                        delete: () {}), ).toList()
                  ],
                );
              }
            ),
          )),
    );
  }
}
