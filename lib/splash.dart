import 'dart:async';

import 'package:crud_provider/provider/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class splash extends StatefulWidget {
  splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override

  void initState(){
    super.initState();

    Future.delayed(Duration(seconds: 3),() {
      MainProvider provider=Provider.of<MainProvider>(context,listen:false);
      provider.getAddData();
      Navigator.push(context, MaterialPageRoute(builder: (context) => home(),));
    },);
  }

  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Container(
        height: height*1,
        width: width*1,
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        child: Center(child: Text("CRUD APP",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900,color: Colors.white),)),
      ),
    );
  }
}
