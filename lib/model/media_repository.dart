import 'dart:convert';
import 'dart:developer';

import 'media_model_class.dart';

import 'package:http/http.dart' as http;

class MediaRepository {
  Future<DemoModel> fetchMediaList(value) async {
    late DemoModel media;
    try {
      final response = await http.get(
        Uri.parse("https://itunes.apple.com/search?term=$value"),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        media = DemoModel.fromMap(item);
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return media;
  }
}
