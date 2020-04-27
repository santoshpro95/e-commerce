import 'dart:async';

class HomeBloc{

  final _bottomBarController = StreamController<int>();

  Stream<int> get bottomBarStream => _bottomBarController.stream;



  void onChangeBottomBar(int position){
    _bottomBarController.sink.add(position);
  }


  void dispose(){

    _bottomBarController.close();
  }



}