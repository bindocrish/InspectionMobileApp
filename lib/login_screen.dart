import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inspection_app_mobile/services/login_service.dart';
import 'bottom_navigation_bar.dart';
import 'common_widgets/custom_toast_message.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  String _errorMessage = '';
  bool _obscureText = true;
  Map loginDetails = {};
  Future<void> _login() async{
setState(() {
  isLoading = true;
});
    final username = _usernameController.text;
    final password = _passwordController.text;

    Map<String,dynamic> body = {
      "mobile_number":username.toLowerCase(),
      "password": password.toString()
    };

    try {
      final  response = await LoginService.loginPostMethod(
          body
      );
      print("Bindo");
      loginDetails = response;
      CustomToaster.successToasterMsg("Login Successful");
      if(!mounted)return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  BottomNavigationBarScreen()),
      );
    } catch (e) {
      CustomToaster.errorToasterMessage(e.toString());
      _errorMessage = 'Login failed: $e';

    }
setState(() {
isLoading = false;
});
  }


  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: const Text('Inspection App'),
      ),
      body: Container(
       alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade100],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(88),
                ),
                child: Container(
                    width: 80,
                    height: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/logo.jpg',height: 50,fit: BoxFit.cover,)),
              ),
              const SizedBox(height: 20),
              buildTextField(controller: _usernameController, name: "Username"),
              const SizedBox(height: 20),
              buildTextField(
                controller: _passwordController,
                name: "Password",
                passwordHide: true,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: _login,
                child: isLoading ? CircularProgressIndicator() : Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade100),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue.shade200,
                  ),
                  child: Center(child: Text("Login",style: TextStyle(color: Colors.white),)),
                ),
              ),

              // if (_errorMessage.isNotEmpty)
              //   Padding(
              //     padding: const EdgeInsets.only(top: 10),
              //     child: Text(
              //         _errorMessage,
              //         style: const TextStyle(color: Colors.red)
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField({
    TextEditingController? controller,
    String? name,
    String? hint,
    bool? passwordHide = false,
  }) {
    return TextField(
      controller: controller,
      obscureText:passwordHide! ? _obscureText : false,
      decoration: InputDecoration(
        filled: true,
        suffixIcon:passwordHide ?  IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,size: 15,
          ),
          onPressed: _togglePasswordView,
        ) : SizedBox(),
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
    );
  }

}
