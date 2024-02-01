import 'package:ali_fouad_app/core/services/request_mixin.dart';
import 'package:ali_fouad_app/core/services/widget_state_widget.dart';
import 'package:get/get.dart';

mixin StateProvider on GetxController {
  void updateState(List<String> ids, WidgetState newState) {
    for (String id in ids) {
      for (StateHolder stateHolder in StateBuilder.stateList) {
        if (id == stateHolder.id) {
          stateHolder.widgetState = newState;
        }
      }
    }
    update(ids);
  }

  WidgetState? getWidgetState(String id) {
    for (StateHolder stateHolder in StateBuilder.stateList) {
      if (id == stateHolder.id) {
        return stateHolder.widgetState;
      }
    }
    return null;
  }
}

abstract class GetxStateController<T> extends GetxController
    with StateMixin<T>, StateProvider, RequestMixin {}
