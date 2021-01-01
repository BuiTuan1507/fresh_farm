import 'package:flutter/material.dart';
class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  String _quan = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Giúp đỡ", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),),
        backgroundColor: Color(0xFF0C9869),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Text("Hướng dẫn", style: TextStyle(fontSize: 22),)
              ),

              DropdownButton(
                  value: _quan,
                  items: [
                    DropdownMenuItem(
                      child: Text("Mai Động"),
                      value: "Mai Động",
                    ),
                    DropdownMenuItem(
                      child: Text("Giáp Bát"),
                      value: "Giáp Bát",
                    ),
                    DropdownMenuItem(
                        child: Text("Linh Đàm"),
                        value: "Linh Đàm"
                    ),
                    DropdownMenuItem(
                        child: Text("Phùng Khoan"),
                        value: "Phùng Khoan"
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _quan = value;
                    });
                  }),

            ],
          )
        ],
      ),
    );
  }
}

