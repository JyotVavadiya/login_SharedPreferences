import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sign_up extends StatefulWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  State<sign_up> createState() => _sign_upState();
}



TextEditingController usernamecontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

class _sign_upState extends State<sign_up> {
  GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
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
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250),bottomRight: Radius.circular(250) ),
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
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(250)),
                          color: Colors.blue.withOpacity(0.6)
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 190),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(250)),
                          color: Colors.indigo.withOpacity(0.6)
                      ),
                    ),
                  ),
                ],
              ),
              Text("Creat", style: TextStyle(fontSize: 60, color: Colors.blue, fontWeight: FontWeight.bold),),
              Text("account", style: TextStyle(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.w500),),
              SizedBox(height: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                          child: TextFormField(
                            controller: usernamecontroller,
                            decoration: const InputDecoration(

                              hintText: 'User Name',
                              prefixIcon: Icon(Icons.account_circle),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                          child: TextFormField(
                            controller: passwordcontroller,
                            decoration: const InputDecoration(

                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
                      sharedpreferences.setString('name', usernamecontroller.text);


                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home_page()));
                    },
                    child: Padding(
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
                            )
                        ),
                        child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                      ),
                    ),
                  ),


                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

}