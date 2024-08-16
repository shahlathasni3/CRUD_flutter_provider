import 'package:crud_provider/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addData.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.pink),),
      ),
      body: Consumer<MainProvider>(
        builder: (context,value2,child) {
          return Container(
            height: height*1,
            width: width*1,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
              children: [

                ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    // itemCount: 2,
                    itemCount: value2.dataList.length,
                    itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: height*0.15,
                      width:width*0.013,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[400],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Name : " + value2.dataList[index].Name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: (){
                                          value2.editData(value2.dataList[index].id.toString());
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => addData(from: "EDIT", oldid: value2.dataList[index].id.toString())));
                                        },
                                        child: Icon(Icons.edit,color: Colors.white,)),
                                    SizedBox(width: 15,),
                                    InkWell(
                                      onTap: (){
                                        value2.deleteData(value2.dataList[index].id);
                                      },
                                        child: Icon(Icons.delete,color: Colors.white,))
                                  ],
                                ),

                              ],
                            ),
                            Text("Age : " + value2.dataList[index].Age,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white)),
                            Text("Loacation : " + value2.dataList[index].Location,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white)),
                        ],
                      ),
                    ),
                  );
                }),

              ],
            ),
          );
        }
      ),

        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.add),
            backgroundColor: new Color(0xFFE57373),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => addData(from: 'NEW', oldid: '',)));
            }
        ),
    );
  }
}
