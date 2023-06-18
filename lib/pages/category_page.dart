import 'package:flutter/material.dart';
import 'package:news_app/widget/news_card.dart';
import 'package:news_app/pages/source_news_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final String imageUrl = "https://asset.kompas.com/crops/YQrcfXdm304xoWSOn2yxjOxxFyQ=/0x168:5500x3834/750x500/data/photo/2022/01/11/61dd7a1b1e57e.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories", style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NewsCard(category: "General",),
                SizedBox(width: 20,),
                NewsCard(category: "Business",),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NewsCard(category: "Technology",),
                SizedBox(width: 20,),
                NewsCard(category: "Sport",),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NewsCard(category: "Entertainment",),
                SizedBox(width: 20,),
                NewsCard(category: "Health",),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    // route to register page
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>  SourceNewsPage(title: "Science",)));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    height: 100,
                    width: MediaQuery.of(context).size.width *0.43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(
                                imageUrl
                            ),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Text("Science",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
