import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob_car_2/data_developer_test/get_cars.dart';
import 'package:mob_car_2/ui/home_page/bloc/bloc_validator.dart';
import 'package:mob_car_2/ui/home_page/widget/custom_button.dart';
import 'package:mob_car_2/ui/home_page/widget/custom_drop_down.dart';






Future<void> registerCarHome(BuildContext context,
{required String url

}) async {
  GetCars getCars = GetCars();
  final BlocValidator  blocValidator = BlocProvider.of<BlocValidator>(context);



  return showDialog<void>(
      context: context,

      // user must tap button!
      builder: (BuildContext context) {
        return Center(
          child:
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.only(left: 14.0,right: 14.0,bottom: 14.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Row(
                        children: [
                        const  Padding(
                            padding: const EdgeInsets.only(right: 3.0),
                            child: Icon(Icons.directions_car),
                          ),
                          const Text("Title",style: TextStyle(fontWeight: FontWeight.bold),) ,
                          Spacer(),IconButton(onPressed: (){},icon: Icon(Icons.close))
                        ],
                      ),
                      ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                          child: Container(
                            height: 130.0,

                            child: Image.network(
                                "https://cdn.motor1.com/images/mgl/VobQz/s1/10-carros-brasileiros-com-nomes-curiosos-no-exterior.jpg",
                                fit : BoxFit.fill
                            ),
                          )),
                      FutureBuilder<List<dynamic>>(
                        future: getCars.getMarca(),
                          builder: (context,snapshot){
                          if(!snapshot.hasData) {
                            return const SizedBox();
                          }


                        return CustomdropDownMenuItem("Marca",snapshot.data!,
                            (value){blocValidator.setValidatorForModel.add(value);
                            blocValidator.setValidatorForYear.add(["59","5940"]);
                        }
                            );
                          }
                        ),
                StreamBuilder<String>(
                    initialData: "59",
                    stream: blocValidator.getValidatorForModel,
                    builder: (context, code) {
                      print(code.data!);
                      return FutureBuilder<List<dynamic>>(
                        future: getCars.getModelo(code.data!),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData) {
                            return const SizedBox();
                          }
                          return CustomdropDownMenuItem("Modelo",snapshot.data!,
                              (value)=> blocValidator.setValidatorForYear.add([code.data,value])
                          );
                        }
                      );
                    }
                ),
                      StreamBuilder<List>(
                          initialData: const  ["59","5940"],
                          stream: blocValidator.getValidatorForYear,
                          builder: (context, code) {
                            print(code.data!);
                            return FutureBuilder<List<dynamic>>(
                                future: getCars.getAno(code.data!),
                                builder: (context, snapshot) {
                                  if(!snapshot.hasData) {
                                    return const SizedBox();
                                  }
                                  return CustomdropDownMenuItem("Ano",snapshot.data!,
                                          (value)async{
                                    List codes = code.data!;
                                    codes.add(value);
                                    var result = await getCars.getValor(codes);
                                    blocValidator.setValidatorForValue.add(result["Valor"].toString());}
                                  );
                                }
                            );
                          }
                      ),

              StreamBuilder<String>(
                initialData: "Valor (R\$",
                stream: blocValidator.getValidatorForValue,
                  builder: (context,snapshot){
                return Padding(
                  padding:  const EdgeInsets.only(top: 18.0),
                  child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0),),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Align(
                          alignment:  Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  Text(snapshot.data!),
                          ))
                  ),
                );

              }),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Spacer(),
                          Button(text : "Cancelar",onPressed: (){},
                              backGroundColor: Colors.white,border: Colors.black,
                              colorText: Colors.black),
                          Button(text : "Salvar",onPressed: (){}, backGroundColor: Colors.black)

                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });}



