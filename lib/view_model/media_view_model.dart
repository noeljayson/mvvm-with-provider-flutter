

import 'package:flutter/cupertino.dart';

import 'package:mvvm_provider/model/media_repository.dart';

import '../model/media.dart';

class MediaViewModel with ChangeNotifier {


  late DemoModel media;
  bool loading = false;
  MediaRepository repo = MediaRepository();

  getDatas(BuildContext context,value) async {
    loading = true;
    media = await  repo.fetchMediaList(value);

    loading = false;

    notifyListeners();
  }


}