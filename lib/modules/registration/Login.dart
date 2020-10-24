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

  final String _password = "a";

  final String _phoneNumber = "a";

  TextEditingController _phoneNumberTexteditingcontroller =
      TextEditingController();

  TextEditingController _passwordTexteditingcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: Color(0xFFFF8C10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                      ),
                      Text(
                        "OnSite",
                        style: TextStyle(color: Colors.white, fontSize: 50),
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
                      color: Color(0xFFFF8C10),
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
