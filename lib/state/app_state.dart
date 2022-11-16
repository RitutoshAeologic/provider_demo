import 'dart:async';

import 'package:flutter/material.dart';

import '../model/data_model.dart';

enum ViewState { Idle, Busy }
class AppState extends ChangeNotifier{

  int temp = 10;
  bool change = false;
  void updateWidget() {
    change = !change;
    notifyListeners();
  }

  List<DataModel> dataList = [];
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }


  void update() {
    notifyListeners();
  }

  void updateDataModel(List<DataModel> dataList) {
    this.dataList = dataList;
    notifyListeners();
  }

  void editDataModel(List<DataModel> datalist,DataModel title,int index) async {
    this.dataList = dataList;
    List editDataModel = [];
    for(int i =0; i < dataList.length; i++)
      {
        if(index == i){
          editDataModel.add(title.toJson());
        }
        else
          {
            editDataModel.add(datalist[i].toJson());
          }
      }
    notifyListeners();
  }

  // addDataModel( DataModel title) async {
  //   setState(ViewState.Busy);
  //   await DataModel.fromJson(json);
  //   await FirestoreDB.setHobbiesInSelectedList(hobbies.hobbyId ?? '');
  //   await getUserDetail();
  //   setState(ViewState.Idle);
  // }


  deleteDataModel(index) async {
    setState(ViewState.Busy);
    await
    this.dataList.removeAt(index);
    setState(ViewState.Idle);
  }

  int start = 0;

  void updateStart(int start) {
    this.start = start;
    notifyListeners();
  }

  void getTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateStart(timer.tick);
    });
  }

}
class UpdateAppState extends ChangeNotifier{
  int num = 1;
  void increment(){
    num++;
    notifyListeners();
  }

  void decrement(){
    num--;
    notifyListeners();
  }

  void reset(){
    num = 0;
    notifyListeners();
  }
  void square(){
    num = num*num;
    notifyListeners();
  }
  // void divide(){
  //   num = num/2;
  //   notifyListeners();
  // }

}