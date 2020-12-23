import 'package:Cruise/src/page/home/components/channellistdefault_component/component.dart';
import 'package:Cruise/src/page/home/components/channellistdefault_component/state.dart';
import 'package:Cruise/src/page/home/components/homelistdefault_component/component.dart';
import 'package:Cruise/src/page/home/components/homelistdefault_component/state.dart';
import 'package:Cruise/src/page/user/settings/cruisesetting/component.dart';
import 'package:Cruise/src/page/user/settings/cruisesetting/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeListComponent extends Component<HomeListState> {
  HomeListComponent()
      : super(
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeListState>(
              adapter: null,
              slots: <String, Dependent<HomeListState>>{
                'homelistdefault':
                    HomeListDefaultConnector() + HomeListDefaultComponent(),
                'channellistdefault': ChannelListDefaultConnector() +
                    ChannelListDefaultComponent(),
                'cruisesetting': CruiseSettingConnector() +
                    CruiseSettingComponent()
              }),
        );
}
