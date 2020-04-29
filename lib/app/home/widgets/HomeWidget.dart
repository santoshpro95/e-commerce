import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/ColorsSet.dart';
import '../../config/ColorsSet.dart';
import '../../config/ColorsSet.dart';
import '../../config/ColorsSet.dart';
import '../../config/ColorsSet.dart';
import '../../config/ColorsSet.dart';
import '../../config/ColorsSet.dart';
import '../../config/ImagesSet.dart';
import '../../config/ImagesSet.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Container(
            child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            Container(child: Image.asset(ImagesSet.homeBanner)),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Fashion\nSale",
                      style: TextStyle(
                          fontSize: 35,
                          color: AppColors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.all(0),
                      onPressed: (){},
                      child: Container(
                        height: 35,
                        width: 150,
                        alignment: Alignment.center,
                        child: Text(
                          "Check",
                          style: TextStyle(color: AppColors.white, fontSize: 16),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColors.red),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "New",
                        style: TextStyle(
                            fontSize: 30,
                            color: AppColors.black,
                            fontWeight: FontWeight.w900),
                      ),
                      Text("You’ve never seen it before!")
                    ],
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: (){},
                  child: Text(
                    "View all",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: AppColors.darkGray),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[

                            Container(
                              width: 120,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:AssetImage(ImagesSet.homeProduct+(index+1).toString()+'.png')
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Colors.redAccent,
                              ),
                            ),


                            Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(left:8.0, right: 8, top: 3, bottom: 3),
                                child: Text("-20%", style: TextStyle(color: AppColors.white,
                                fontWeight: FontWeight.w800),),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: AppColors.black
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text("T-shirt", style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w200),),

                        Row(
                          children: <Widget>[
                            Text("300 ₹", style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                            ),),
                            SizedBox(height: 5,),
                            Text("200 ₹", style: TextStyle(
                              fontSize: 12,
                            ),),
                          ],
                        ),

                      ],
                    ),
                  ),
                );
              }, itemCount: 3,),
        ),

      ],
    ));
  }
}
