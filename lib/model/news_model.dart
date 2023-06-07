// Package imports:
import 'package:hive/hive.dart';

part 'news_model.g.dart';

class NewsModel {
  late String? status;
  late int totalResults;
  late List<Articles> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    totalResults = json['totalResults'];
    articles = (json['articles'] as List<dynamic>)
        .map((v) => Articles.fromJson(v))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    data['articles'] = this.articles.map((v) => v.toJson()).toList();
    return data;
  }
}

@HiveType(typeId: 101)
class Articles {
  @HiveField(0)
  late String? sourceName;
  @HiveField(1)
  late String author;
  @HiveField(2)
  late String title;
  @HiveField(3)
  late String description;
  @HiveField(4)
  late String url;
  @HiveField(5)
  late String urlToImage;
  @HiveField(6)
  late String publishedAt;
  @HiveField(7)
  late String content;

  Articles({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    sourceName =
        (json['source'] != null) ? Source.fromJson(json['source']).name : '';
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sourceName != null) {
      data['sourceName'] = this.sourceName;
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  String id;
  String name;

  Source({required this.id, required this.name});

  Source.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        name = json['name'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
