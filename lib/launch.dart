
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchCaller() async {
  const url = "tel:+917705015444";
  if (await canLaunch(url)) {
    await launch(url);
  } else    {
    throw 'Could not launch $url';
  }
}
openwhatsapp(String message) async{
  var whatsapp ="+917705015444";
  // var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=$message";
  // var whatappURL_ios ="https://wa.me/$whatsapp?text=$message";
  final url='https://api.whatsapp.com/send?phone=7705015444&text='+message;
  if( await canLaunch(url)){
    await launch(url);
  }else{

  }
}
String email="info@foundercodes.com";
launchEmail() async {
  if (await canLaunch("mailto:$email")) {
    await launch("mailto:$email");
  } else {
    throw 'Could not launch';
  }
}


class Launch extends StatelessWidget {
  final String ? message;
 Launch({Key? key, this.message}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
