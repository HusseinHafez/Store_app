import 'package:flutter/widgets.dart';

class ProfileContainerClipper extends CustomClipper<Path>{


 

  @override
  Path getClip(Size size) {
    Path path =Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width-200, size.height, size.width, 0);
   // path.lineTo(size.width, 0);
    return path;
  }

 
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>true;

}