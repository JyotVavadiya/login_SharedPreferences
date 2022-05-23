import 'dart:async';
import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalName='';

class Splesh extends StatefulWidget {
  const Splesh({Key? key}) : super(key: key);

  @override
  State<Splesh> createState() => _SpleshState();
}

class _SpleshState extends State<Splesh> {

  @override
  void initState() {
    getvalidationData().whenComplete(()async{
      Timer(Duration(microseconds: 2), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>(finalName==null)?sign_up():Home_page())));
    });
    super.initState();
  }

  Future getvalidationData()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('name');

    setState(() {
      finalName = obtainedEmail!;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      ),
    );
  }
}