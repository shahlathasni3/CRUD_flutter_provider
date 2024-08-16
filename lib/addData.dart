import 'package:crud_provider/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addData extends StatelessWidget {

  String from;
  String oldid;

  addData({super.key,required this.from,required this.oldid});


  @override
  Widget build(BuildContext context) {


    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.pink),),
      ),
      body: Container(
        height: height*1,
        width: width*1,
        decoration: BoxDecoration(
          color: CupertinoColors.lightBackgroundGray,
        ),
        child: Padding(
          padding: const EdgeInsets.all(45),
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("NAME" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 15,vertical: 5),
                    decoration: BoxDecoration(
                    border: Border.all(),borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: value.NameController,
                      decoration: InputDecoration(border: InputBorder.none),
                      ),
                  ),
                  SizedBox(height: 25,),
                  Text("Age" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 15,vertical: 5),
                    decoration: BoxDecoration(
                    border: Border.all(),borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: value.AgeController,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Text("Location" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric( horizontal: 15,vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(),borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                    controller: value.LocationController,
                    decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 45),
                  ElevatedButton(onPressed: (){
                    if(from=="NEW"){
                      value.addData(from,"");
                    }
                    else{
                      value.addData(from, oldid);
                    }


                    value.getAddData();
                    Navigator.pop(context);
                  }, child: Text("Add" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.pinkAccent),),
                  ),

                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
