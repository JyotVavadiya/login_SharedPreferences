import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'splesh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account_screen.dart';


class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {

  r(){
    setState(() {
      finalName;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    r();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Container(
                    height: 150,
                    width: 850,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(250),
                          bottomRight: Radius.circular(250)),
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 190),
                  child: Container(
                    height: 270,
                    width: 270,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(250)),
                        color: Colors.blue.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 190),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(250)),
                        color: Colors.indigo.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Welcom",
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30, left: 30),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.indigo.withOpacity(0.7),
                            Colors.blue,
                          ],
                        )),
                    child: Text(
                      "Login as $finalName",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 250,),
            GestureDetector(
              onTap: ()async{
                final SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
                await sharedpreferences.remove('email');


                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>sign_up()));
              },
              child: Column(
                children: [
                  Text("Delete Account", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, ),),
                  Divider(endIndent: 140, indent: 140, color: Colors.black, thickness: 1,),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}