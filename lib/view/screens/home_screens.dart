import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/media_view_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MediaViewModel>(context, listen: false).getDatas(context, "a");
  }

  @override
  Widget build(BuildContext context) {

    final _inputController = TextEditingController();
    final mediaList = Provider.of<MediaViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mvvm with provider'),
      ),
      body:mediaList.loading==true?const Center(child:  CircularProgressIndicator(color: Colors.blueAccent,)): Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              child: TextField(
                  controller: _inputController,
                  onSubmitted: (value) {
                    setState(() {
                      Provider.of<MediaViewModel>(context, listen: false)
                          .getDatas(context, _inputController.text);
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Enter Artist Name',
                  )),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: mediaList.media.results.length,
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(mediaList
                                      .media.results[index].artworkUrl100),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        mediaList.media.results[index]
                                            .collectionName,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ]),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
