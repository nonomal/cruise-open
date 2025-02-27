import 'package:cruise/src/page/home/components/homelist_component/component.dart';
import 'package:cruise/src/page/home/components/homelist_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HistoryPage extends Page<HistoryState, Map<String, dynamic>> {
  HistoryPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HistoryState>(
                adapter: null,
                slots: <String, Dependent<HistoryState>>{
                  'homelist': HistoryArticleConnector() + HomeListComponent(),
                }),
            middleware: <Middleware<HistoryState>>[
            ],);

}
