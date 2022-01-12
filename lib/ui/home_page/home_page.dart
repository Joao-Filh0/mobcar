import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob_car_2/data/remote/crud_db.dart';
import 'package:mob_car_2/data/repositories/db_crud_repository.dart';
import 'package:mob_car_2/domain/entities/price_entity.dart';
import 'package:mob_car_2/presentation/bloc/bloc_validator.dart';
import 'package:mob_car_2/presentation/home_presenter.dart';
import 'package:mob_car_2/presentation/repositories/home_presenter_repository.dart';
import 'package:mob_car_2/ui/components/mobcar_icons.dart';
import 'package:mob_car_2/ui/home_page/widgets/drawer_home.dart';
import 'package:mob_car_2/ui/home_page/widgets/register_car_home.dart';
import 'package:mob_car_2/ui/home_page/widgets/reserve_car_home.dart';
import 'package:mob_car_2/ui/home_page/widgets/title_info_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    implements HomePresenterRepository {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  late CrudDbRepository _crudDb;
  late HomePresenter _homePresenter;
  late Size size;

  late BlocValidator _blocValidator;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _blocValidator = BlocProvider.of<BlocValidator>(context);
    return SafeArea(
      child: Scaffold(
          key: _key,
          appBar: AppBar(actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: mobCarIconIn,
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ], backgroundColor: Colors.black, leading: steeringIcon),
          endDrawer: DrawerHome(
            key: UniqueKey(),
            size: size,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: StreamBuilder<bool>(
                stream: _blocValidator.getHomeController,
                initialData: true,
                builder: (context, snapshot) {
                  return ListView(
                    children: [
                      const Text(
                        "Title 1",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Text("Title 2",
                              style: TextStyle(fontSize: 17.0)),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () async {

                              //Essa variavel esta aqui pois a api nao tem url mas o layout pede imagem
                              const String url =
                                  "https://cdn.motor1.com/images/mgl/VobQz/s1/10-carros-brasileiros-com-nomes-curiosos-no-exterior.jpg";

                              registerCarHome(context,
                                  url: url,
                                  onPressed: (value){
                                    Navigator.of(context).pop();
                                      _homePresenter.create(value);});
                            },
                            child: const Text(
                              "Add new",
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      FutureBuilder<List<PriceEntity>>(
                          future: _crudDb.readDb(),
                          builder: (context, response) {
                            switch ( response.connectionState) {
                              case ConnectionState.waiting:
                              case ConnectionState.none:
                                return const Center(child:  CircularProgressIndicator());
                              case ConnectionState.active:
                              case ConnectionState.done:
                                if ( !response.hasData) {
                                  return const Center(child: Text("Nada Ainda"));
                                }
                                return Column(
                                  children:  response.data!
                                      .map<TitleInfoHome>(
                                        (e) => TitleInfoHome(
                                            title: e.model,
                                            year: e.year.toString(),
                                            url: e.urlImage,
                                            view: () {
                                              reserveCarHome(
                                                context,
                                                data: e,
                                              );
                                            },
                                            edit: () {
                                              registerCarHome(context,
                                                  url: e.urlImage,
                                                  onPressed: (data) async{
                                                data.id = e.id;
                                                await _crudDb.updateDb(data);
                                                setState(() {
                                                });
                                                Navigator.of(context).pop();
                                                  });
                                            },
                                            delete: () async{
                                              await _crudDb.deleteDb(e.id!);
                                              setState(() {

                                              });
                                            }, ),
                                      )
                                      .toList(),
                                );
                            }
                          })
                    ],
                  );
                }),
          )),
    );
  }

  @override
  void sucessOrErrorCreate(String text, Color color) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(fontSize: size.width * 0.05),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
    _blocValidator.setHomeController.add(true);


    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    _crudDb = CrudDb();
    _homePresenter = HomePresenter(this);
    super.initState();
  }

}
