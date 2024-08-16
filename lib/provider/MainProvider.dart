

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/addDatamodel.dart';

class MainProvider extends ChangeNotifier {

  TextEditingController NameController = new TextEditingController();
  TextEditingController AgeController = new TextEditingController();
  TextEditingController LocationController = new TextEditingController();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  // add data
  void addData( String from,String oldid) {
    print("Add Data");
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, dynamic> map = HashMap();
    map["Name"] = NameController.text;
    map["Age"] = AgeController.text;
    map["Location"] = LocationController.text;

    if(from=="NEW"){
      map["Id"]=id;
    }
    if(from=="EDIT"){
      db.collection("Add Data").doc(oldid).set(map);
    }
    else{
      db.collection("Add Data").doc(id).set(map,
          SetOptions(merge: true)); //merge : true is used to do update function
    }
notifyListeners();
  }


  // get data
  List<addDatamodel>dataList=[];
  void getAddData(){

    db.collection("Add Data").get().then((value) {
      if(value.docs.isNotEmpty){
        dataList.clear();
        for (var elements in value.docs){
          Map<dynamic, dynamic> getMap = elements.data();
          dataList.add(addDatamodel(
            elements.id,
            getMap["Name"],
            getMap["Age"],
            getMap["Location"],
          ));

        }
        print(dataList.length);
        notifyListeners();
      }


    });
    notifyListeners();
  }

  // delete data
  void deleteData(String id){
    db.collection("Add Data").doc(id).delete();
    getAddData();
    notifyListeners();
  }
  
  // edit data
  void editData(String id) {
    print("Edit Data");
    db.collection("Add Data").doc(id).get().then((value) {
      Map<dynamic, dynamic> map = value.data()as Map;
      if(value.exists) {
        NameController.text = map["Name"].toString();
        AgeController.text = map["Age"].toString();
        LocationController.text = map["Location"].toString();
        notifyListeners();
    } // Refresh the data list after updating
    });
    notifyListeners();
  }

  // void editData(String id) {
  //   print("Edit Data");
  //   Map<String, dynamic> map = {
  //     "Name": NameController.text,
  //     "Age": AgeController.text,
  //     "Location": LocationController.text,
  //   };
  //
  //   db.collection("Add Data").doc(id).update(map).then((_) {
  //     print("Data updated successfully");
  //     getAddData(); // Refresh the data list after updating
  //   }).catchError((error) {
  //     print("Failed to update data: $error");
  //   });
  // }
}




//     .catchError((error) {
// print("Failed to update data: $error");
// });
