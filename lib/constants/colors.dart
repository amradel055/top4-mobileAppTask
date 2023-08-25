
import 'package:flutter/material.dart';

Color? titleColor = Colors.yellow[700];
Color? black = Colors.black87;
Color? yellow = Colors.yellow[700] ;
Color? subTitleColor = Colors.grey[700] ;
Color appBarColor = Colors.black87 ;


MaterialStateProperty<Color> buttonColor = MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
     return appBarColor.withOpacity(0.5);
    }) ;

MaterialStateProperty<Color> row1color = MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
      return Colors.white70;
    }) ;
MaterialStateProperty<Color> headrow1color = MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
      return Colors.black54;
    }) ;