import 'package:Cruise/src/models/Channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:Cruise/src/component/loading_item.dart';

class ChannelPartSnippet extends StatelessWidget {
  const ChannelPartSnippet({
    Key key,
    @required this.part,
  }) : super(key: key);

  final AsyncValue<Channel> part;

  @override
  Widget build(BuildContext context) {
    return part.when(
      loading: () => Padding(
        padding: const EdgeInsets.only(
          left: 4,
        ),
        child: LoadingItem(),
      ),
      error: (err, stack) {
        print(err);
        return Center(child: Text('Error: $err'));
      },
      data: (item) {
        return item.deleted
            ? Container()
            : Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Feather.circle,
                        size: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "(${item.score}) ${item.content}",
                                ),
                              ),
                              Row(children: [
                                Expanded(
                                  flex: (100 - (100 - item.score)).abs(),
                                  child: Container(
                                    height: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Expanded(
                                  flex: (100 - item.score).abs(),
                                  child: Container(
                                    height: 20,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
