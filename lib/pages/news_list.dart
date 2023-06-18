import 'package:flutter/material.dart';
import 'package:news_app/model/top_headline_response.dart';
import 'package:news_app/network/dio_http.dart';
import 'package:news_app/widget/news_content.dart';
class NewsList extends StatefulWidget {
  const NewsList({Key? key, required this.newsSource, required this.id}) : super(key: key);
  final String newsSource;
  final String id;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsSource, style: TextStyle(color: Colors.white)),
      ),
      // body: ListView(
      //   children: [
      //     NewsContent(imageUrl: "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/newscms/2020_28/3049071/191011-shepard_smith-ew-409p.jpg", newsTitle: "Australia to seek to stop Rusia building embassy near Parliament", newsDescription: "The Australian government expects to introduce legislation to prevent Russia from building a new embassy building"),
      //
      //     NewsContent(imageUrl: "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/newscms/2020_28/3049071/191011-shepard_smith-ew-409p.jpg", newsTitle: "Australia to seek to stop Rusia building embassy near Parliament", newsDescription: "The Australian government expects to introduce legislation to prevent Russia from building a new embassy building"),
      //
      //     NewsContent(imageUrl: "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/newscms/2020_28/3049071/191011-shepard_smith-ew-409p.jpg", newsTitle: "Australia to seek to stop Rusia building embassy near Parliament", newsDescription: "The Australian government expects to introduce legislation to prevent Russia from building a new embassy building"),
      //
      //     NewsContent(imageUrl: "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/newscms/2020_28/3049071/191011-shepard_smith-ew-409p.jpg", newsTitle: "Australia to seek to stop Rusia building embassy near Parliament", newsDescription: "The Australian government expects to introduce legislation to prevent Russia from building a new embassy building"),
      //   ],
      // ),
      body: FutureBuilder<TopHeadlineResponse>(
        future: getTopHeadLine(widget.id),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data?.articles?.length??0,
                itemBuilder: (context, index){
                  return NewsContent(
                    imageUrl: snapshot.data?.articles?[index].urlToImage,
                    newsDescription: snapshot.data?.articles?[index].description,
                    newsTitle: snapshot.data?.articles?[index].title,
                  );
                });
          }else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
