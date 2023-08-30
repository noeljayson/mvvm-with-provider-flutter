// class Media {
//   final String? artistName;
//   final String? collectionName;
//   final String? trackName;
//   final String? artworkUrl;
//   final String? previewUrl;
//
//   Media(
//       {this.artistName,
//         this.collectionName,
//         this.trackName,
//         this.artworkUrl,
//         this.previewUrl});
//
//
//   factory Media.fromJson(Map<String, dynamic> json) {
//     return Media(
//       artistName: json['artistName'] as String?,
//       collectionName: json['collectionName'] as String?,
//       trackName: json['trackName'] as String?,
//       artworkUrl: json['artworkUrl100'] as String?,
//       previewUrl: json['previewUrl'] as String?,
//     );
//   }
// }

import 'package:meta/meta.dart';
import 'dart:convert';

DemoModel demoModelFromMap(String str) => DemoModel.fromMap(json.decode(str));

String demoModelToMap(DemoModel data) => json.encode(data.toMap());

class DemoModel {
  int resultCount;
  List<Result> results;

  DemoModel({
    required this.resultCount,
    required this.results,
  });

  factory DemoModel.fromMap(Map<String, dynamic> json) => DemoModel(
        resultCount: json["resultCount"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "resultCount": resultCount,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Result {
  String artistName;

  String artworkUrl60;
  String artworkUrl100;
  String collectionName;

  Result({
    required this.artistName,
    required this.collectionName,
    required this.artworkUrl60,
    required this.artworkUrl100,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        artistName: json["artistName"] ?? "",
        collectionName: json["collectionName"] ?? "",
        artworkUrl60: json["artworkUrl60"] ?? "",
        artworkUrl100: json["artworkUrl100"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "artistName": artistName,
        "collectionName": collectionName,
        "artworkUrl60": artworkUrl60,
        "artworkUrl100": artworkUrl100,
      };
}
