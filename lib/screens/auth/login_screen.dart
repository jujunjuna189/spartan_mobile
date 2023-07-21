import 'package:flutter/material.dart';
import 'package:spartan_mobile/repository/auth_repo.dart';
import 'package:spartan_mobile/utils/colors.dart';
import 'package:spartan_mobile/widgets/button/button_submit.dart';
import 'package:spartan_mobile/widgets/text_field/field_password.dart';
import 'package:spartan_mobile/widgets/text_field/field_text.dart';
import 'package:spartan_mobile/widgets/toast/toast_loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onLogin() async {
    ToastLoader.instance.showLoader();
    Map<String, dynamic> dataBatch = {
      'email': _emailController.text,
      'password': _passwordController.text
    };

    await AuthRepo.instance.login(dataBatch).then((value) {
      if(value){
        clearForm();
        Navigator.of(context).pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
      }
    });
  }

  void clearForm(){
    _emailController.text = "";
    _passwordController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(height: 50,),
          const Center(child: Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                color: bgWhite,
                border: Border.all(width: 1, color: bgLightPrimary),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nrp", style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  FieldText(controller: _emailController, placeHolder: "Masukan Nrp...",),
                  const SizedBox(height: 20,),
                  const Text("Password", style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  FieldPassword(controller: _passwordController, placeHolder: "Masukan Password...",),
                  const SizedBox(height: 50,),
                  ButtonSubmit(onPressed: ((){
                    onLogin();
                  }),text: "Login"),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: ((){
                      Navigator.of(context).pushNamed("/register");
                    }),
                    child: const Center(child: Text("Daftar Akun!", style: TextStyle(fontSize: 16),))
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/logo/ma.jpg"),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/logo/a.png"),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/logo/b.png"),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/logo/c.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
