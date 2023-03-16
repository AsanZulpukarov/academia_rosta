import 'dart:convert';

import 'package:academi_rost/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ThemeThisApp.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final _formKey = GlobalKey<FormState>();

  final username = TextEditingController();
  final password = TextEditingController();
  final _focusUsername = FocusNode();
  final _focusPassword = FocusNode();
  bool _hidePass = true;
  String? role = '';
  bool isSelectRole = true;
  bool rememberMe = false;

  // UserLoginPassword newUser = UserLoginPassword();

  @override
  void dispose() {
    _focusUsername.dispose();
    _focusPassword.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
  }

  Widget _getImageLogo() {
    return Container(
      alignment: Alignment.center,
      width: 250.w,
      height: 71.h,
      child: Image.asset(
        'assets/logo/Logo.png',
      ),
    );
  }

  Widget _getTextField() {
    return SizedBox(
      width: 274.w,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            focusNode: _focusUsername,
            onFieldSubmitted: (_) {
              _focusUsername.nextFocus();
            },
            textInputAction: TextInputAction.next,
            style: ThemeThisApp.styleTextBase,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return value;
            },
            controller: username,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.all(12.0.sp),
              labelText: 'Логин',
              labelStyle: ThemeThisApp.styleTextBase,
              hintText: 'Логин',
              icon: Icon(
                Icons.person,
                color: ThemeThisApp.fillButton,
                size: 33.sp,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: ThemeThisApp.borderColor,
                ),
                onPressed: () {
                  username.clear();
                },
              ),
              border: ThemeThisApp.borderTextField,
              // onSaved: (value) => newUser.userName = value!,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            focusNode: _focusPassword,
            onFieldSubmitted: (_) {
              _focusPassword.unfocus();
            },
            textInputAction: TextInputAction.done,
            style: ThemeThisApp.styleTextBase,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return value;
            },
            controller: password,
            obscureText: _hidePass,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.all(12.0.sp),
              labelText: 'Пароль',
              labelStyle: ThemeThisApp.styleTextBase,
              hintText: 'Пароль',
              icon: const Icon(
                Icons.security,
                color: ThemeThisApp.fillButton,
                size: 33,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _hidePass ? Icons.visibility : Icons.visibility_off,
                  color: ThemeThisApp.borderColor,
                ),
                onPressed: () {
                  setState(() {
                    _hidePass = !_hidePass;
                  });
                },
              ),
              border: ThemeThisApp.borderTextField,
            ),
            // onSaved: (value) => newUser.password = value!,
          ),
        ],
      ),
    );
  }

  Widget _getRadioButton() {
    return Container(
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
              const Text(
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
              const Text(
                "Ученик",
                style: TextStyle(color: ThemeThisApp.fillButton),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getRowCheckBox() {
    return Row(
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
                rememberMe = value!;
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ВХОД',
        ),
        centerTitle: true,
      ),
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _getImageLogo(),
              // SizedBox()
              SizedBox(
                height: 68.h,
              ),
              _getTextField(),
              SizedBox(
                height: 11.h,
              ),
              _getRadioButton(),
              SizedBox(
                height: 50.h,
              ),
              _getRowCheckBox(),
              SizedBox(
                height: 17.h,
              ),
              ElevatedButton(
                style: ThemeThisApp.styleButton,
                onPressed: () {
                  setState(() {
                    // if (_formKey.currentState!.validate()) {
                    //   // loadData(newUser.userName, newUser.password);
                    //   // If the form is valid, display a snackbar. In the real world,
                    //   // you'd often call a server or save the information in a database.
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Processing Data')),
                    //   );
                    // }
                    SplashScreen.register = true;
                  });
                  Navigator.pushReplacementNamed(context, '/main_page');
                },
                child: const Text("Войти"),
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
