import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecommerce/app/login/SignUpBloc.dart';
import 'package:mecommerce/app/utils/CommonMethods.dart';


class SignUpScreen extends StatefulWidget {
  static const tag = '/signup';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  final _signUpBloc = SignUpBloc();


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
      key: _signUpBloc.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Signup",
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
              controller: _signUpBloc.nameText,
              decoration: InputDecoration(
                labelText: "Name",
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.green)),

              ),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              style: TextStyle(fontSize: 14),
              controller: _signUpBloc.emailText,
              decoration: InputDecoration(
                labelText: "Email",
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.green)),

              ),
            ),

            SizedBox(height: 20,),


            TextField(
              controller: _signUpBloc.passwordText,
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
              onPressed: ()=> _signUpBloc.signUp(context),
              child: Container(
                height: 50,
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.red
                ),
                child: Text("SIGNUP", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
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
        ),
      ),

    );
  }
}
