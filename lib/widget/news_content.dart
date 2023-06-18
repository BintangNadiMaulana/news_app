import 'package:flutter/material.dart';
class NewsContent extends StatelessWidget {
  const NewsContent({Key? key, this.imageUrl, this.newsTitle, this.newsDescription}) : super(key: key);
  final String? imageUrl;
  final String? newsTitle;
  final String? newsDescription;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Colors.grey))),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Image.network(imageUrl??"", height: 150, width: 150,
            errorBuilder: (context, error, stackTrace) => Container(
              child: Center(
                child: Text("Image Error"),
              ),
            ), ),

          SizedBox(width: 15,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment .start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(newsTitle??"",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),maxLines: 2,),

                SizedBox(height: 15,),

                Text(newsDescription??"",style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal), maxLines: 3,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
