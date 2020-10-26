import 'package:flutter/material.dart';
import 'package:onsite/modules/home/home.dart';

class Login extends StatefulWidget {
  //form key used to control form states
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _signinFormkey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _phoneNumberTexteditingcontroller =
      TextEditingController();

  TextEditingController _passwordTexteditingcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text("OnSight",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27,letterSpacing: 4),)
        ],),
        leading: Text(""),
        elevation: 0,
        backgroundColor:Color(0xFF66B9C4) ,
      ),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: Color(0xFF66B9C4),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                      ),
                    Container(   
                              height: MediaQuery.of(context).size.height/8,   
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                clipBehavior: Clip.antiAlias,
                child: Image.asset("assets/logo/logo.PNG"),
              ),
            ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Sign in to your Account",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
              SizedBox(
                height: height / 20,
              ),
              Form(
                key: _signinFormkey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10),
                      child: TextFormField(
                        controller: _phoneNumberTexteditingcontroller,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            hintText: 'Enter UserName'),
                        validator: (value) {
                          if (value.isEmpty)
                            return "Your username or password is incorrect";
                          else
                            return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10),
                      child: TextFormField(
                        controller: _passwordTexteditingcontroller,
                        textAlign: TextAlign.start,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: 'Enter Password',
                          suffixIcon: IconButton(
                           
                            onPressed: () {},
                            icon: Icon(Icons.ac_unit),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return "incorrect password ";
                          else
                            return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_signinFormkey.currentState.validate()) {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Home()));
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      color:  Color(0xFF66B9C4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
