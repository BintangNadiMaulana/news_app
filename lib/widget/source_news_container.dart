import 'package:flutter/material.dart';
import 'package:news_app/pages/news_list.dart';

class SourceNewsContainer extends StatelessWidget {
  const SourceNewsContainer({Key? key, this.content, this.source, this.id}) : super(key: key);
  final String? source;
  final String? content;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>  NewsList(newsSource: source??"",id: id??"",)));
      },
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(source??"", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, ),),
            SizedBox(height: 10,),
            Text(content??"", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),)
          ],
        ),
      ),
    );
  }
}
