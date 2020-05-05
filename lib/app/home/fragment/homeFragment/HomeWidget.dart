import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecommerce/app/config/StringsSet.dart';
import 'package:mecommerce/app/home/fragment/homeFragment/HomeFragmentBloc.dart';
import 'package:mecommerce/app/products/model/DataModel.dart';

import '../../../config/ColorsSet.dart';
import '../../../config/ImagesSet.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  final _homeFragmentBloc = HomeFragmentBloc();

  @override
  void initState() {
    _homeFragmentBloc.getData();
    super.initState();
  }

@override
  void dispose() {
   _homeFragmentBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child:






        ListView(
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
                      onPressed: ()=> _homeFragmentBloc.openProduct(context, StringsSet.fashionDress),
                      child: Container(
                        height: 35,
                        width: 150,
                        alignment: Alignment.center,
                        child: Text(
                          "Check",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 16),
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
                  onPressed: ()=> _homeFragmentBloc.openProduct(context, StringsSet.newDress),
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
          height: 340,
          child: StreamBuilder<List<DataModel>>(
              stream: _homeFragmentBloc.productStream,
              builder: (context, snapshot) {
               if(snapshot.hasData){
                 return Container(
                     child: ListView.builder(
                       shrinkWrap: true,
                       itemBuilder: (context, index){
                       return Container(
                         width: 180,
                         child: CupertinoButton(
                           padding: EdgeInsets.all(0),
                           onPressed: ()=> _homeFragmentBloc.openDetails(snapshot.data[index], context),
                           child: Container(
                             margin: EdgeInsets.all(10),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 Stack(
                                   alignment: Alignment.bottomRight,
                                   children: <Widget>[
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Container(
                                         height: 200,
                                         child: Stack(
                                           children: <Widget>[
                                             Container(
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.all(
                                                     Radius.circular(5)),
                                                 color: AppColors.lightGray,
                                                 image: DecorationImage(
                                                     fit: BoxFit.cover,
                                                     image: NetworkImage(snapshot
                                                         .data[index].imageUrl)),
                                               ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Container(
                                                 height: 30,
                                                 width: 50,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.all(
                                                       Radius.circular(20)),
                                                   color: AppColors.red,
                                                 ),
                                                 alignment: Alignment.center,
                                                 child: Text(
                                                   "-" +
                                                       snapshot
                                                           .data[index].discount
                                                           .toString() +
                                                       "%",
                                                   style: TextStyle(
                                                       color: Colors.white,
                                                       fontWeight: FontWeight.w400,
                                                       fontSize: 14),
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                     Align(
                                       alignment: Alignment.centerRight,
                                       child: Container(
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius.all(
                                                 Radius.circular(30)),
                                             color: Colors.white,
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.grey,
                                                 blurRadius: 5.0,
                                               ),
                                             ]),
                                         child: Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child:
                                             Icon(
                                               Icons.favorite_border,
                                               color: Colors.grey,
                                             ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                   height: 10,
                                 ),
                                 Container(
                                   height: 20,
                                   child: ListView.builder(
                                     itemBuilder: (context, index) {
                                       return index < 3
                                           ? Icon(
                                         Icons.star,
                                         size: 12,
                                         color: AppColors.orange,
                                       )
                                           : Icon(
                                         Icons.star_border,
                                         color: AppColors.lightGray,
                                         size: 12,
                                       );
                                     },
                                     scrollDirection: Axis.horizontal,
                                     itemCount: 5,
                                   ),
                                 ),
                                 Text(
                                   snapshot.data[index].name,
                                   style: TextStyle(
                                       fontSize: 12,
                                       color: AppColors.lightGray,
                                       fontWeight: FontWeight.w400),
                                 ),
                                 SizedBox(
                                   height: 2,
                                 ),
                                 Text(
                                   snapshot.data[index].title,
                                   style: TextStyle(
                                       fontSize: 18,
                                       color: Colors.black,
                                       fontWeight: FontWeight.w700),
                                 ),
                                 SizedBox(
                                   height: 2,
                                 ),
                                 Row(
                                   children: <Widget>[
                                     Text(
                                       snapshot.data[index].oldPrice.toString() +
                                           "₹",
                                       style: TextStyle(
                                         decoration: TextDecoration.lineThrough,
                                         color: AppColors.darkGray,
                                         fontSize: 14,
                                         fontWeight: FontWeight.w700,
                                       ),
                                     ),
                                     SizedBox(
                                       width: 10,
                                     ),
                                     Text(
                                       snapshot.data[index].newPrice.toString() +
                                           "₹",
                                       style: TextStyle(
                                           color: AppColors.red,
                                           fontWeight: FontWeight.w700,
                                           fontSize: 14),
                                     ),
                                   ],
                                 )
                               ],
                             ),
                           ),
                         ),
                       );

                     }, itemCount: 3,scrollDirection: Axis.horizontal,)

                 );
               }
               return Container();
              }
          ),
        ),
      ],
    ));

}
}
