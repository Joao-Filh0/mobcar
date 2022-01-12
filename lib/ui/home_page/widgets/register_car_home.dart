import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:mob_car_2/data/remote/get_brand_data.dart';
import 'package:mob_car_2/data/remote/get_model_data.dart';
import 'package:mob_car_2/data/remote/get_price_data.dart';
import 'package:mob_car_2/data/remote/get_year_data.dart';
import 'package:mob_car_2/data/repositories/get_brand_data_repository.dart';
import 'package:mob_car_2/data/repositories/get_data_repository.dart';
import 'package:mob_car_2/domain/entities/brand_entity.dart';
import 'package:mob_car_2/domain/entities/model_entity.dart';
import 'package:mob_car_2/domain/entities/price_entity.dart';
import 'package:mob_car_2/domain/entities/year_entity.dart';
import 'package:mob_car_2/presentation/bloc/bloc_validator.dart';
import 'package:mob_car_2/ui/home_page/widgets/custom_button.dart';
import 'package:mob_car_2/ui/home_page/widgets/custom_drop_down.dart';






Future<void> registerCarHome(BuildContext context,
{required String url,
  required Function(PriceEntity) onPressed

}) async {
  GetDataRepository _getPriceData = GetPriceData() ;
  GetDataRepository<List<YearEntity>> _getYearData = GetYearData() ;
  GetDataRepository<List<ModelEntity>> _getModelData = GetModelData();
  GetBrandDataRepository<List<BrandEntity>>  _getBrandData = GetBrandData();
  final BlocValidator  blocValidator = BlocProvider.of<BlocValidator>(context);
  PriceEntity? _data;





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
                          Spacer(),IconButton(onPressed: ()=>Navigator.of(context).pop(),icon: Icon(Icons.close))
                        ],
                      ),
                      ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                          child: Container(
                            height: 130.0,

                            child: Image.network(
                               url, fit : BoxFit.fill
                            ),
                          )),
                      FutureBuilder<List<BrandEntity>?>(
                        future: _getBrandData.get(),
                          builder: (context,snapshot){
                          if(!snapshot.hasData|| snapshot.data!.isEmpty) {
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
                      return FutureBuilder<List<ModelEntity>?>(
                        future: _getModelData.get([code.data]),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData || snapshot.data!.isEmpty) {
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
                            return FutureBuilder<List<YearEntity>?>(
                                future: _getYearData.get(code.data!),
                                builder: (context, snapshot) {
                                  if(!snapshot.hasData || snapshot.data!.isEmpty) {
                                    return const SizedBox();
                                  }
                                  return CustomdropDownMenuItem("Ano",snapshot.data!,
                                          (value)async{
                                    List codes = code.data!;
                                    codes.add(value);
                                     _data = await _getPriceData.get(codes);
                                    blocValidator.setValidatorForValue.add(_data!.price.toString());
                                    blocValidator.setvalidatorButton.add(true);
                                  }
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
                          borderRadius: const BorderRadius.all(Radius.circular(8.0),),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Align(
                          alignment:  Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  Text(snapshot.data!,
                            style: const  TextStyle(fontSize: 13.0),overflow: TextOverflow.ellipsis,),
                          ))
                  ),
                );

              }),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Spacer(),
                          Button(text : "Cancelar",onPressed: (){
                            Navigator.of(context).pop();
                          },
                              backGroundColor: Colors.white,border: Colors.black,
                              colorText: Colors.black),
                          StreamBuilder<bool>(
                            initialData: false,
                            stream:blocValidator.getvalidatorButton ,
                            builder: (context, snapshot) {
                              return Button(text : "Salvar",onPressed:
                              !snapshot.data!
                                  ? null : (){

                                onPressed(
                                   _data!);
                              }, backGroundColor: Colors.black);
                            }
                          )

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



