import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CartWidget extends StatefulWidget {
  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.topRight,
            child: Icon(Icons.search),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "My Bag",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),


          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index){

              return     Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Container(

                    child: Row(
                      children: <Widget>[

                        Expanded(
                          flex:1,
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              color: Colors.grey,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://ginabacconi.com/media/wysiwyg/gina-bacconi-mother-of-bride.jpg')),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex:3,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text("T-shirt", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,
                                color: Colors.black,),),
                              Text("color grey  Size: L", style: TextStyle(),),

                              SizedBox(height: 10,),

                              Row(
                                children: <Widget>[

                                  Container(
                                    alignment: Alignment.center,
                                    height:35, width: 35,
                                    decoration: BoxDecoration(borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                    color: Colors.white,


                                        boxShadow: [BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                        ),]
                                    ),
                                    child: Text("-", style: TextStyle(fontSize: 18, color: Colors.black,),),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("2",style: TextStyle(fontSize: 18, color: Colors.black,)),
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    height:35, width: 35,
                                    decoration: BoxDecoration(borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                        ),]
                                    ),
                                    child: Text("+", style: TextStyle(fontSize: 18, color: Colors.black,),),
                                  ),


                                  Expanded(child: Container(child: Text("123/-",

                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                                  ),


                                  alignment: Alignment.centerRight,
                                  ))



                                ],
                              ),




                            ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
          ),

//
//          Container(
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.all(Radius.circular(5)),
//              color: Colors.white,
//              border: Border.all(width: 1, color: Colors.grey)
//            ),
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: TextField(
//                style: TextStyle(fontSize: 12),
//               decoration: InputDecoration.collapsed(
//                 hintText: "Enter Promocode",
//                 hintStyle: TextStyle(fontSize: 12)
//               ),
//              ),
//            ),
//          ),
          SizedBox(
            height: 10,
          ),

          Row(
            children: <Widget>[

              Expanded(child: Text("Total anount:")),

              Text("1233/-", style: TextStyle(fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),)
            ],
          ),

          SizedBox(
            height: 10,
          ),

          CupertinoButton(
            padding: EdgeInsets.all(0),
            onPressed: (){},
            child: Container(
              height: 40,
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.red
              ),
              child: Text("CHECK OUT", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
            ),
          ),

        ],
      ),
    );
  }
}
