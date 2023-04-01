import 'dart:convert';

import 'package:academi_rost/model/entity/user_entity_json.dart';
import 'package:academi_rost/model/enum/role_user_enum.dart';
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

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _focusUsername = FocusNode();
  final _focusPassword = FocusNode();
  bool _hidePass = true;
  bool _rememberMe = true;
  RoleUser role = RoleUser.teacher;
  bool isSelectRole = true;

  UserEntity userEntity = UserEntity();

  @override
  void dispose() {
    _focusUsername.dispose();
    _focusPassword.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
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
            focusNode: _focusUsername,
            onFieldSubmitted: (_) {
              _focusUsername.nextFocus();
            },
            textInputAction: TextInputAction.next,
            style: ThemeThisApp.styleTextBase,
            validator: _validateName,
            controller: _userNameController,
            decoration: InputDecoration(
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
                  _userNameController.clear();
                },
              ),
              enabledBorder: ThemeThisApp.borderTextField,
              focusedBorder: ThemeThisApp.borderTextField,
              errorBorder: ThemeThisApp.borderTextField,
            ),
            onSaved: (value) {
              userEntity.username = value!.toLowerCase();
            },
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
              return null;
            },
            controller: _passwordController,
            obscureText: _hidePass,
            decoration: InputDecoration(
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
              enabledBorder: ThemeThisApp.borderTextField,
              focusedBorder: ThemeThisApp.borderTextField,
              errorBorder: ThemeThisApp.borderTextField,
            ),
            onSaved: (value) => userEntity.password = value!,
          ),
        ],
      ),
    );
  }

  String? _validateName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Name is reqired.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters.';
    } else {
      return null;
    }
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
                value: RoleUser.teacher,
                groupValue: role,
                onChanged: (value) {
                  setState(() {
                    role = value!;
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
                value: RoleUser.student,
                groupValue: role,
                onChanged: (value) {
                  setState(() {
                    role = value!;
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
          value: _rememberMe,
          onChanged: (value) {
            setState(
              () {
                _rememberMe = value!;
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
        key: _formKey,
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
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    loadData();
                    SplashScreen.register = _rememberMe;
                  }
                },
                child: const Text("Войти"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadData() async {
    var client = http.Client();
    var url = Uri.http('localhost:8080', '/api/auth/signIn');
    var response = await client.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userEntity.toJson()));
    if (response.statusCode == 200) {
      print(response.body);
      Navigator.pushReplacementNamed(context, '/main_page');
    } else if (response.statusCode == 401) {
      _showMessage(message: 'Не правильный логин или пароль');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
