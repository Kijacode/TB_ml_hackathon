import 'package:flutter/material.dart';
import 'package:tb_app/modules/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  //form key used to control form states
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _signinFormkey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _phoneNumberTexteditingcontroller =
      TextEditingController();

  final TextEditingController _passwordTexteditingcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text(
                "OnSight",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    letterSpacing: 4),
              )
            ],
          ),
          leading: const Text(""),
          elevation: 0,
          backgroundColor: const Color(0xFF66B9C4),
        ),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: const Color(0xFF66B9C4),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 150,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/logo/logo.PNG"),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
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
                // autovalidate: true,
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
                          if (value!.isEmpty || value != "admin") {
                            return "Your username or password is incorrect";
                          } else {
                            return null;
                          }
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
                            icon: const Icon(Icons.ac_unit),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value != "district") {
                            return "incorrect password ";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (_signinFormkey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        }
                      },
                      color: const Color(0xFF66B9C4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
