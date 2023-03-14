import 'dart:convert';

import 'package:academi_rost/ButtonNavigationBar.dart';
import 'package:academi_rost/ThemeThisApp.dart';
import 'package:academi_rost/model/entity/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

void main() => runApp(SignIn());

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme:
                  AppBarTheme(backgroundColor: ThemeThisApp.fillButton)),
          home: FormRegister(),
        );
      },
    );
  }
}

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final _formKey = GlobalKey<FormState>();

  final username = TextEditingController();
  final password = TextEditingController();
  bool _hidePass = true;
  String? role = '';
  bool? rememberMe = true;
  bool isSelectRole = true;

  User newUser = User();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ВХОД',
        ),
        centerTitle: true,
      ),
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // SizedBox(
              Container(
                alignment: Alignment.center,
                width: 250.w,
                height: 71.h,
                child: Image.asset(
                  'assets/logo/Logo.png',
                ),
              ),
              SizedBox(
                height: 68.h,
              ),
              SizedBox(
                width: 274.w,
                height: 34.h,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return value;
                  },
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: username,
                  decoration: InputDecoration(
                    labelText: 'Логин',
                    hintText: 'Логин',
                    icon: Icon(
                      Icons.person,
                      color: ThemeThisApp.fillButton,
                      size: 33.sp,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: ThemeThisApp.borderColor,
                      ),
                      onPressed: () {
                        username.clear();
                      },
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ThemeThisApp.fillButton, width: 2.0.w),
                      borderRadius: BorderRadius.circular(20.0.r),
                    ),
                  ),
                  onSaved: (value) => newUser.userName = value!,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: 274.w,
                height: 34.h,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return value;
                  },
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    hintText: 'Пароль',
                    icon: Icon(
                      Icons.security,
                      color: ThemeThisApp.fillButton,
                      size: 33,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _hidePass ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _hidePass = !_hidePass;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ThemeThisApp.fillButton, width: 2.0.w),
                      borderRadius: BorderRadius.circular(20.0.r),
                    ),
                  ),
                  onSaved: (value) => newUser.password = value!,
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Radio(
                          activeColor: ThemeThisApp.borderColor,
                          value: "teacher",
                          groupValue: role,
                          onChanged: (value) {
                            setState(() {
                              role = value.toString();
                            });
                          },
                        ),
                        Text(
                          "Учитель",
                          style: TextStyle(color: ThemeThisApp.fillButton),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 26.w,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: ThemeThisApp.borderColor,
                          value: "student",
                          groupValue: role,
                          onChanged: (value) {
                            setState(() {
                              role = value.toString();
                            });
                          },
                        ),
                        Text(
                          "Ученик",
                          style: TextStyle(color: ThemeThisApp.fillButton),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Запомнить меня",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: ThemeThisApp.fillButton,
                    ),
                  ),
                  Checkbox(
                    activeColor: ThemeThisApp.borderColor,
                    value: rememberMe,
                    onChanged: (value) {
                      setState(
                        () {
                          rememberMe = value;
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 17.h,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        ThemeThisApp.fillButton)),
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      loadData(newUser.userName, newUser.password);
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: Text("Войти"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadData(String username, String password) async {
    var client = http.Client();
    var url = Uri.http('192.168.202.234:8080', '/api/auth/signIn');
    var json = {'username': username, 'password': password};
    var response = await client.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(json));
    if (response.statusCode == 200) {
      print('Number of books about http: ${response.body}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
