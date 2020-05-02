import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecommerce/app/config/ColorsSet.dart';
import 'package:mecommerce/app/products/model/DataModel.dart';

class DetailsScreen extends StatefulWidget {
  static const tag = '/details';

  final DataModel dataModel;

  DetailsScreen({
    Key key,
    this.dataModel,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState(dataModel);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final DataModel dataModel;

  _DetailsScreenState(this.dataModel);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            dataModel.title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          brightness: Brightness.light,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Image.network(
                  dataModel.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          dataModel.title,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        Text(
                          dataModel.name,
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
                            "Short dress in soft cotton jersey with decorative button down the front and wide, frill-trimmed")
                      ],
                    ),
                  ),
                  Text(
                    dataModel.newPrice.toString() + "/-",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Container(
                  height: 40,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red),
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
