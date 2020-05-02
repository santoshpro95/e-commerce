import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecommerce/app/config/ColorsSet.dart';
import 'package:mecommerce/app/config/StringsSet.dart';
import 'package:mecommerce/app/products/ProductBloc.dart';
import 'package:mecommerce/app/products/model/DataModel.dart';

class ProductScreen extends StatefulWidget {
  final String productType;

  ProductScreen({
    Key key,
    this.productType,
  }) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState(productType);
}

class _ProductScreenState extends State<ProductScreen> {
  final String productType;

  _ProductScreenState(this.productType);

  int rating = 3;
  final _productBloc = ProductBloc();

  @override
  void initState() {
    _productBloc.getData(productType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: StringsSet.favorites != productType,
        title: Text(
          productType,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        brightness: Brightness.light,
      ),
      body: StreamBuilder<List<DataModel>>(
          stream: _productBloc.productStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: CupertinoButton(
                          padding: EdgeInsets.all(0),
                          onPressed: ()=> _productBloc.openDetails(snapshot.data[index], context),
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
                                              productType == StringsSet.favorites
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    )
                                                  : Icon(
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
                                      return index < rating
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
                      ),
                      Expanded(
                        child: CupertinoButton(
                          padding: EdgeInsets.all(0),
                          onPressed: ()=> _productBloc.openDetails(snapshot.data[index], context),
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
                                          productType == StringsSet.favorites
                                              ? Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                              : Icon(
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
                                      return index < rating
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
                      ),
                    ],
                  );
                },
                itemCount: snapshot.data.length,
              ));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
