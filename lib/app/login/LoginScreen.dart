import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecommerce/app/home/ui/HomeScreen.dart';
import 'package:mecommerce/app/utils/CommonWidgets.dart';


class LoginScreen extends StatefulWidget {
  static const tag = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();


  void gotoHome(){
    if(emailText.text == "abc@gmail.com" && passwordText.text == "123"){

      Navigator.pushNamed(context, HomeScreen.tag);
    }else{
      CommonWidgets.showErrorMessage(
          scaffoldKey, "Email or Password is wrong, Please Try Again!");
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),

            TextField(
              style: TextStyle(fontSize: 14),
              controller: emailText,
              decoration: InputDecoration(
                  labelText: "Email",

              ),
            ),



            TextField(
              controller: passwordText,
              style: TextStyle(fontSize: 14),
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",


              ),
            ),


            SizedBox(
              height: 30,
            ),

            CupertinoButton(
              padding: EdgeInsets.all(0),
              onPressed: gotoHome,
              child: Container(
                height: 40,
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.red
                ),
                child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
              ),
            ),


            Expanded(
              child: Container(),
            ),


            Text("Or login with social account"),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Image.network('https://www.konfest.com/wp-content/uploads/2019/05/Konfest-PNG-JPG-Image-Pic-Photo-Free-Download-Royalty-Unlimited-clip-art-sticker-icon-google-website-search-engine-information-company-logo-17.png', height: 40, width: 40,),

                SizedBox(width: 20,),
                Image.network('https://cdn3.iconfinder.com/data/icons/capsocial-round/500/facebook-512.png', height: 30, width: 30,),
              ],
            )



          ],
        )
      ),

    );
  }
}
