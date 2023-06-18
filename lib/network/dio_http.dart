import 'package:dio/dio.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/model/top_headline_response.dart';

final dio = Dio();

Future<SourceResponse> getSource(String category) async {
  Response response = await dio.get("https://newsapi.org/v2/top-headlines/sources?&apiKey=831e3608c0564754b9c7cca49b653c7c&category=$category");
  print(response.data.toString());
  SourceResponse? sourceResponse = SourceResponse.fromJson(response.data);
  return sourceResponse;
}

Future<TopHeadlineResponse> getTopHeadLine(String id) async {
  Response response = await dio.get("https://newsapi.org/v2/top-headlines?sources=$id&apiKey=831e3608c0564754b9c7cca49b653c7c");
  print(response.data.toString());
  TopHeadlineResponse? topHeadLine = TopHeadlineResponse.fromJson(response.data);
  return topHeadLine;
}
