import 'package:flutter/material.dart';

class appBarcustom extends StatefulWidget {
  const appBarcustom({ Key? key }) : super(key: key);

  @override
  _appBarcustomState createState() => _appBarcustomState();
}

class _appBarcustomState extends State<appBarcustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(leading: Text("test"),);
  }
}