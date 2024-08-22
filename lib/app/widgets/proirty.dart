import'package:flutter/material.dart';
import 'package:tasks/app/core/values/colors.dart';
import 'package:tasks/app/core/values/proirties.dart';

List<Text> getProirties(){
  return [
    Text(TextHeight,style: const TextStyle(fontFamily: 'MaterialIcons',color: pink,),),
    Text(TextMedium,style: const TextStyle(fontFamily: 'MaterialIcons',color: yellow,),),
    Text(TextLowe,style: const TextStyle(fontFamily: 'MaterialIcons',color: green,),)
  ];
}