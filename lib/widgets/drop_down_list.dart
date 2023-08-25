import 'package:flutter/material.dart';
import '../constants/text_styles.dart';



Widget appDropDown (String title, Size size , List valuesList , void Function(String?)? onChanged , String? dropValue){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      title.isNotEmpty ? Text(
        title,
        style: subTitleStyle,
      ) : const SizedBox(),
      const SizedBox(
        height: 5,
      ),
      Card(
        elevation: 0.5,
        child: SizedBox(
          height: size.height * 0.06,
          child: DropdownButton(
              value: dropValue != null ? dropValue : null ,
              hint: const Text("Choose"),
              underline: const SizedBox(),
              style: valueStyle,
              items: valuesList
                    .map<DropdownMenuItem<String>>((value){
                    return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  SizedBox(
                        height: size.height *0.035,
                        child: FittedBox(
                          child: Text(
                          value.toString(),
                          style: regularTextStyle,
                          ),
                        ),
                      ),
                    ),
                    );
                    }).toList(),
              isExpanded: true,
            onChanged: onChanged,
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
    ],
  );
}