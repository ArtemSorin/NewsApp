import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Data welcomeFromJson(String str) => Data.fromJson(json.decode(str));

String welcomeToJson(Data data) => json.encode(data.toJson());

Future<List<Result>> fetchCoinsList() async {
  final response = await http.get(Uri.parse(
      'https://newsdata.io/api/1/news?apikey=pub_142130508821fc709ead8b63ff777f5efff96&language=en'));

  if (response.statusCode == 200) {
    Map<String, dynamic> userMap = jsonDecode(response.body);
    return (userMap['results'] as List).map((e) => Result.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load CoinsList');
  }
}

class Data {
  Data({
    required this.status,
    required this.totalResults,
    required this.results,
    required this.nextPage,
  });

  String status;
  int totalResults;
  List<Result> results;
  int nextPage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result {
  Result({
    required this.title,
    required this.link,
    required this.keywords,
    required this.creator,
    required this.videoUrl,
    required this.description,
    required this.content,
    required this.pubDate,
    required this.imageUrl,
    required this.sourceId,
    required this.country,
    //required this.category,
    required this.language,
  });

  String title;
  String link;
  List<dynamic>? keywords;
  List<dynamic>? creator;
  dynamic videoUrl;
  String? description;
  String content;
  DateTime pubDate;
  String imageUrl;
  String sourceId;
  List<String> country;
  //List<Category> category;
  String language;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? null
            : List<String>.from(json["keywords"].map((x) => x)),
        creator: json["creator"] == null
            ? null
            : List<String>.from(json["creator"].map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"],
        content: json["content"] ?? "",
        pubDate: DateTime.parse(json["pubDate"]),
        imageUrl: json["image_url"] ?? "",
        sourceId: json["source_id"],
        country: List<String>.from(json["country"].map((x) => x)),
        //category: List<Category>.from(json["category"].map((x) => categoryValues.map[x])),
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "keywords": keywords == null
            ? null
            : List<dynamic>.from(keywords!.map((x) => x)),
        "creator":
            creator == null ? null : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate.toIso8601String(),
        "image_url": imageUrl,
        "source_id": sourceId,
        "country": List<dynamic>.from(country.map((x) => x)),
        //"category": List<dynamic>.from(category.map((x) => categoryValues.reverse[x])),
        "language": language,
      };
}
