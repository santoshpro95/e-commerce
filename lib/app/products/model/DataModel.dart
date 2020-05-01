import 'package:mecommerce/app/utils/CommonMethods.dart';

class DataModel {
  final String id;
  final String name;
  final String imageUrl;
  final int oldPrice;
  final int newPrice;

  final int discount;
  final String title;

  DataModel({this.id, this.name, this.imageUrl, this.oldPrice, this.newPrice, this.discount, this.title});
  factory DataModel.fromJson(Map<String, dynamic> parsedJson) {
    return DataModel(
      id:  CommonMethods.valueOrDefault(parsedJson['id']),
      name:CommonMethods.valueOrDefault(parsedJson['name']),
      imageUrl: CommonMethods.valueOrDefault(parsedJson['imageUrl']),
      oldPrice:CommonMethods.valueOrDefault(parsedJson['oldPrice']),
      newPrice: CommonMethods.valueOrDefault(parsedJson['newPrice']),

      discount:CommonMethods.valueOrDefault(parsedJson['discount']),
      title: CommonMethods.valueOrDefault(parsedJson['title']),
    );
  }
}