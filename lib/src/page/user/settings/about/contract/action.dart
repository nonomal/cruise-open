import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ContractAction { action }

class ContractActionCreator {
  static Action onAction() {
    return const Action(ContractAction.action);
  }
}
