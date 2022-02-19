import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:squircle/squircle.dart';
import 'package:the_mechanic/form_field.dart';
import 'package:the_mechanic/user.dart';
import 'driver_sign_up.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
 final _formKey = GlobalKey<FormState>();
    User user = User('', '');

  @override
  Widget build(BuildContext context) {
   
 
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_circle_left5,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('media/img/e.jpg'),
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              fit: BoxFit.cover)),
      child: Container(
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 170,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: TextEditingController(text: user.email),
                  onChanged: (value) {
                    user.email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Email';
                    } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return null;
                    } else {
                      return 'Enter valid email';
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.blue)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  
                  controller: TextEditingController(text: user.password),
                  onChanged: (value) {
                    user.password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter passwod';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                   
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.blue)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                ),
              ),
              
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  width: 300,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('ok');
                        } else {
                          print('not ok');
                        }
                      },
                      child: Text('sign up',
                          style: TextStyle(color: Colors.white,fontSize: 30))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(65, 10, 0, 0),
                child: Row(
                  children: [
                    Text('Do not have an Account?',
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                        onPressed: () {
                            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DriverSignUp()));
                        },
                        child: Text('Sign up', style: TextStyle(fontSize: 30)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}