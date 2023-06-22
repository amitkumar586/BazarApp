import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier{

   int _count = 1;

    int getCount(){
      return _count ;
    } 

    void setCount(){
      _count++ ;
      notifyListeners();
    }    
}