import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/network/dio_http.dart';
import 'package:news_app/widget/source_news_container.dart';

class SourceNewsPage extends StatelessWidget {
  const SourceNewsPage({Key? key, required this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!, style: TextStyle(color: Colors.white)),
      ),
      // body: ListView(
      //   children: [
      //     SourceNewsContainer(source: "ABC News", content: "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com",),
      //
      //     SourceNewsContainer(source: "ABC News (AU)", content: "Austalia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more",),
      //
      //     SourceNewsContainer(source: "Aftenposten",content: "Norges ledende nettavis med alltid oppdaterte nyheter innenfor innenriks, utenriks, sport og kultur",),
      //
      //     SourceNewsContainer(source: "Al Jazeera English", content: "News, analysis from the Middle East and worldwide, multimedia and interactives, opinions, documentaries, podcasts, long reads and broadcast schedule,",),
      //
      //     SourceNewsContainer(source: "Ansa.it", content: "Agenzia ANSA: ultime notizie, foto, video e approfondimentisu: cronaca, politica, economia, regioni, mondo, sport, calciocultura e tecnologia",),
      //
      //     SourceNewsContainer(source: "Ary News", content: "Ary news is a Pakistani news channel commited to bring yuo up-to-the minute Pakistan news and featured stories from around Pakistan and all over the world",)
      //   ],
      // ),
      body: FutureBuilder<SourceResponse>(
        future: getSource(title!),
        builder: (context, snapshot) {
          if(snapshot.hasData){

            if(snapshot.data!.sources!.isNotEmpty){
              return ListView.builder(
                  itemCount: snapshot.data?.sources?.length??0,
                  itemBuilder: (context, index){
                    return SourceNewsContainer(
                      content: snapshot.data?.sources?[index].description,
                      source: snapshot.data?.sources?[index].name,
                      id: snapshot.data?.sources?[index].id,);
                  });
            } else{
              return Container(
                child: Center(
                    child: Text("Data Not Found"),
                ),
              );
            }

          } else{
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
