import 'package:flutter/material.dart';
import 'package:news_app/pages/source_news_page.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.category}) : super(key: key);
  final String category;
  final String imageUrl = "https://asset.kompas.com/crops/YQrcfXdm304xoWSOn2yxjOxxFyQ=/0x168:5500x3834/750x500/data/photo/2022/01/11/61dd7a1b1e57e.jpg";


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          // route to register page
          Navigator.push(context, MaterialPageRoute(
              builder: (context) =>  SourceNewsPage(title: category,)));
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, top: 10),
          height: 100,
          // width: MediaQuery.of(context).size.width *0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: NetworkImage(
                      imageUrl
                  ),
                  fit: BoxFit.fill
              )
          ),
          child: Text(category,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}