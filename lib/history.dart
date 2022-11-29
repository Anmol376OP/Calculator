import 'package:flutter/material.dart';

class History extends StatelessWidget {
  final List hst;
  const History({super.key, required this.hst});

  @override
  Widget build(BuildContext context) {
    // print(hst.length);

  return Scaffold(
    appBar: AppBar(
      title: Text('History'),
      backgroundColor: Colors.black54,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for(int i=hst.length-1;i>0;i--)
          Padding(padding: EdgeInsets.only(right: 16,top: 8,bottom: 8),child: Align(alignment: Alignment.bottomRight,child: Text(hst[i],style: TextStyle(fontSize: 25,color: Colors.black),),),),
      ],
    ),
  );
  }
}

