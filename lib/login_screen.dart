import 'package:flutter/material.dart';

import 'package:inspection_app_mobile/services/login_service.dart';
import 'bottom_navigation_bar.dart';
import 'common_widgets/appconstant.dart';
import 'common_widgets/custom_toast_message.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _obscureText = true;
  Map loginDetails = {};

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      final username = _usernameController.text;
      final password = _passwordController.text;

      Map<String, dynamic> body = {
        "mobile_number": username.toLowerCase(),
        "password": password.toString(),
      };

      try {
        final response = await LoginService.loginPostMethod(body);
        loginDetails = response;
        CustomToaster.successToasterMsg("Login Successful");
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),
        );
      } catch (e) {
        CustomToaster.errorToasterMessage(e.toString());
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
           color: Colors.white,

        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/logo.jpg',
                  height: 80,
                  fit: BoxFit.cover,
                ),
                Text(
                  "INSPECTION APP",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                Column(
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Login into your account",
                      style: TextStyle(fontSize: 15, color: Colors.black38),
                    ),
                    SizedBox(height: 30),
                    buildTextField(
                      controller: _usernameController,
                      name: "Mobile Number",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        } else if (value.length < 8) {
                          return 'User must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    buildTextField(
                      controller: _passwordController,
                      name: "Password",
                      passwordHide: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 20,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(value: false, onChanged: (val) {}),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text("Remember me"),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: _login,
                      child:
                          isLoading
                              ? CircularProgressIndicator()
                              : Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue.shade100,
                                  ),
                                  borderRadius: BorderRadius.circular(33),
                                  color: AppColors.primary,
                                ),
                                child: Center(
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    TextEditingController? controller,
    String? name,
    String? hint,
    FormFieldValidator<String>? validator,
    bool? passwordHide = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: passwordHide! ? _obscureText : false,
      decoration: InputDecoration(
        filled: true,
        suffixIcon:
            passwordHide
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 15,
                  ),
                  onPressed: _togglePasswordView,
                )
                : SizedBox(),
        fillColor: Color(0xFFF2F2F2),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: Colors.black26),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),

        labelText: name,
      ),
      validator: validator,
    );
  }
}
