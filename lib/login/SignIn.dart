import 'package:flutter/cupertino.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/login/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:petrescue/login/forgot_password.dart';
import 'package:petrescue/login/SignUp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:petrescue/petrescue_theme.dart';
import 'package:petrescue/repository/data/post_data.dart';
import 'package:petrescue/screens/post_home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String USER = "user@gmail.com";
  final String TRUNGTAMCUUHO = "trungtamcuuho@gmail.com";
  final myController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  bool _showPassword = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("FFB9AC"),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 256,
              width: 387,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/petfamily.png'),
                      fit: BoxFit.none)),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'CỨU HỘ CHÓ MÈO',
                style: TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 300,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Form(
                        autovalidate: true,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: TextFormField(
                                controller: myController,
                                  decoration: InputDecoration(
                                      //hintText: "Input yor Email",
                                      labelText: 'Email',
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.account_circle)),
                                  validator: (value) =>
                                      EmailValidator.validate(value)
                                          ? null
                                          : "Hãy nhập email hợp lệ"),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Hẫy nhập mật khẩu hợp lệ';
                                  }
                                  return null;
                                },
                                obscureText: !this._showPassword,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Mật khẩu',
                                    prefixIcon: Icon(Icons.security),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.remove_red_eye,
                                        color: this._showPassword
                                            ? Colors.blue
                                            : Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() => this._showPassword =
                                            !this._showPassword);
                                      },
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(myController.text == TRUNGTAMCUUHO || myController.text== USER) {
                          if (myController.text == TRUNGTAMCUUHO) {
                            currentUser.isVerifyRescueCenter = true;
                          } else {
                            currentUser.isVerifyRescueCenter = false;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PostHome(
                                      listOfPost: listOfPosts,
                                    )),
                          );
                        }
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotScreen()),
                );
              },
              child: Text(
                "Quên mật khẩu?",
                style: TextStyle(color: Colors.indigoAccent),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "HOẶC",
            ),
            SignInButton(
              Buttons.Google,
              text: "Đăng nhập bằng Google",
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Thành viên mới? ",
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    'Đăng kí',
                    style: TextStyle(color: Colors.indigoAccent),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
