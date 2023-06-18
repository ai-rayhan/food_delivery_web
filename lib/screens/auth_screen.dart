// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_web/provider/auth_provider.dart';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../constants/constant.dart';

enum AuthMode { signup, login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: deviceSize.height / 8,
                margin: EdgeInsets.only(right: deviceSize.width / 3),
                decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage('assets/images/logo.png'),
                    //     fit: BoxFit.fitWidth,
                    //     colorFilter: ColorFilter.mode(
                    //         Color(0xff0AA1DD), BlendMode.color)),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 255, 110, 66),
                      Color(0xffFE5722),
                    ]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(120))),
                child: const Center(
                  child: Text(
                    "HI,WELCOME",
                    style: TextStyle(
                      fontSize: 30,color: Colors.white
                    ),
                  ),
                ),
              ),
              const SizedBox(
                child: AuthCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({super.key});

  @override
  AuthCardState createState() => AuthCardState();
}

class AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.login;

  String? _fullname, _email, _password, _confirmpassword;

  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _submit() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.login) {
      await authProvider.login(
          email: _email!, password: _password!, context: context);
    } else {
      await authProvider.signUp(
          email: _email!,
          password: _password!,
          name: _fullname!,
          context: context);

      setState(() {
        _authMode = AuthMode.login;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: kIsWeb
              ? EdgeInsets.symmetric(
                  horizontal: deviceSize.width / 3, vertical: 50)
              : EdgeInsets.symmetric(
                  horizontal: deviceSize.width / 8, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("FOOD APP", style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(
                width: 100,
                child: Image.asset('assets/images/logo.png'),
              ),
              TextFormField(
                decoration: decoration('E-mail', Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Invalid email!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const Divider(),
              TextFormField(
                decoration: decoration(' Password', Icons.lock),
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 5) {
                    return 'Password is too short!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              if (_authMode == AuthMode.signup) const Divider(),
              if (_authMode == AuthMode.signup)
                TextFormField(
                  enabled: _authMode == AuthMode.signup,
                  decoration: decoration('Confim Password', Icons.lock),
                  obscureText: true,
                  validator: _authMode == AuthMode.signup
                      ? (value) {
                          if (value != _passwordController.text) {
                            return 'Passwords do not match!';
                          }
                          return null;
                        }
                      : null,
                ),
              if (_authMode == AuthMode.signup) const Divider(),
              if (_authMode == AuthMode.signup)
                TextFormField(
                  decoration: decoration(' Your name', Icons.person),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _fullname = value!;
                  },
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text("Forgotton password",style: TextStyle(color: Color(0xEF000000)),),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                RawMaterialButton(
                  onPressed: _submit,
                  fillColor: const Color(0xffFE5722),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 13.0),
                  child:
                      Text(_authMode == AuthMode.login ? 'LOGIN' : 'SIGN UP'),
                ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_authMode == AuthMode.signup)
                    Text(
                      "You have account",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  else
                    Text(
                      "Not account yet!",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RawMaterialButton(
                    onPressed: _switchAuthMode,
                    fillColor: const Color(0xffE8F9FD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child:
                        Text(_authMode == AuthMode.login ? 'SIGNUP' : 'LOGIN'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration decoration(String labeltext, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Color(0xFFdddddd),
      labelText: labeltext,
      labelStyle: TextStyle(color: primaryColor),
      prefixIcon: Icon(
        icon,
        color: primaryColor,
      ),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:  Color.fromARGB(255, 233, 148, 91), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 233, 148, 91)),
          borderRadius: BorderRadius.all(Radius.circular(50))),
    );
  }
}
