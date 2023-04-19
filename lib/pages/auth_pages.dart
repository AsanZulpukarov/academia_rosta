import 'package:academia_rost/model/entity/user_auth_entity.dart';
import 'package:academia_rost/model/static_variable/static_variable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../service/api_service/auth_api.dart';
import '../theme_this_app.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);
  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ipController = TextEditingController(text: StaticVariable.urlIp);
  final _focusUsername = FocusNode();
  final _focusPassword = FocusNode();
  bool _hidePass = true;
  bool _rememberMe = true;

  String text = "";

  UserAuthEntity userAuthEntity = UserAuthEntity();
  final AuthApiHttp authApiHttp = AuthApiHttp();

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
              userAuthEntity.username = value!.trim();
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
            onSaved: (value) => userAuthEntity.password = value!.trim(),
          ),
        ],
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null) {
      return 'Логин бош болбошуу керек.';
    } else {
      return null;
    }
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
              SizedBox(
                height: 20.h,
              ),
              _getImageLogo(),
              // SizedBox()
              SizedBox(
                height: 68.h,
              ),
              _getTextField(),
              SizedBox(
                height: 50.h,
              ),
              _getRowCheckBox(),
              SizedBox(
                height: 17.h,
              ),
              ElevatedButton(
                style: ThemeThisApp.styleButton,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    text = await requestUser();
                    if (text.toLowerCase() == 'успешно'.toLowerCase()) {
                      Navigator.pushReplacementNamed(context, '/main_page');
                    }
                    _showMessage(message: text);
                  }
                },
                child: const Text("Войти"),
              ),
              TextField(
                controller: _ipController,
                onChanged: (value) {
                  StaticVariable.urlIp = value;
                },
                onSubmitted: (value) {
                  StaticVariable.urlIp = value.trim();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> requestUser() async {
    return await authApiHttp.loadData(userAuthEntity, _rememberMe);
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: message.toLowerCase() == 'успешно'.toLowerCase()
            ? Colors.green
            : Colors.red,
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
