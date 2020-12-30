import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'SearchDetail.dart';

class CloudFirestoreSearch extends StatefulWidget {
  String name;
  CloudFirestoreSearch({Key key, this.name}) : super(key: key);
  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0C9869),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                widget.name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:  Firestore.instance
            .collection('shopItems')
            .where("searchKeywords", arrayContains: widget.name)
            .snapshots(),
        builder: (context, snapshot) {
          print(widget.name);
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Text("Đang tìm kiếm", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
              ),
              CircularProgressIndicator()
            ],
          )

          )
              : ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data.documents[index];
              return Card(
                child:InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchDetail(id: data['id'],)));
                  },
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        data['imgPath'],
                        width: 150,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        data['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )

              );
            },
          );
        },
      ),
    );
  }

}