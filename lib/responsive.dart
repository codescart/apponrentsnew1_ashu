import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  
  final Widget mobile;
  final Widget ?tablet;
  final Widget desktop;
  
  const Responsive({Key? key,
    required this.mobile, 
    required this.tablet,
    required this.desktop})
      : super(key: key);
  
  static bool ismobile(BuildContext context){
    return MediaQuery.of(context).size.width<400;
  }

  static bool isdesktop(BuildContext context){
    return MediaQuery.of(context).size.width<800 && MediaQuery.of(context).size.width<=1200;
  }

  static bool istablet(BuildContext context){
    return MediaQuery.of(context).size.width<800;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth>=900){
        return desktop;
      } else if(constraints.maxWidth>=600){
        return tablet ?? mobile;
      } else{
        return mobile;
      }
    });
  }
}
