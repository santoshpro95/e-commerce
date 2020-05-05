import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecommerce/app/home/ui/HomeScreen.dart';
import 'package:mecommerce/app/login/SignUpScreen.dart';
import 'package:mecommerce/app/login/LoginBloc.dart';
import 'package:mecommerce/app/utils/CommonWidgets.dart';
import 'package:mecommerce/app/utils/CommonMethods.dart';


class LoginScreen extends StatefulWidget {
  static const tag = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      key: _loginBloc.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        brightness: Brightness.light,
      ),

      body: Container(

        margin: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),

            TextField(
              style: TextStyle(fontSize: 14),
              controller: _loginBloc.emailText,
              decoration: InputDecoration(
                  labelText: "Email",
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.green)),

              ),
            ),

            SizedBox(height: 20,),


            TextField(
              controller: _loginBloc.passwordText,
              style: TextStyle(fontSize: 14),
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.green)),

              ),
            ),


            SizedBox(
              height: 30,
            ),

            CupertinoButton(
              padding: EdgeInsets.all(0),
              onPressed: ()=> _loginBloc.login(context),
              child: Container(
                height: 50,
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.red
                ),
                child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
              ),
            ),

            SizedBox(height: 20,),
            CupertinoButton(
              padding: EdgeInsets.all(0),
              onPressed:()=>  _loginBloc.signUp(context),
              child: Container(
                height: 50,
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(width: 1, color: Colors.red)
                ),
                child: Text("SIGNUP", style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),),
              ),
            ),

            SizedBox(height: 60,),
            Center(child: Text("Or login with social account")),
            SizedBox(height: 20,),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Image.network('https://www.konfest.com/wp-content/uploads/2019/05/Konfest-PNG-JPG-Image-Pic-Photo-Free-Download-Royalty-Unlimited-clip-art-sticker-icon-google-website-search-engine-information-company-logo-17.png', height: 40, width: 40,),

                  SizedBox(width: 20,),
                  Image.network('https://cdn3.iconfinder.com/data/icons/capsocial-round/500/facebook-512.png', height: 30, width: 30,),
                ],
              ),
            )



          ],
        )
      ),

    );
  }
}
