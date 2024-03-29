import 'package:ali_fouad_app/core/views/loading_widget.dart';
import 'package:ali_fouad_app/core/views/no_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateBuilder<T extends GetxController> extends GetView<T> {
  final WidgetState initialWidgetState;
  final StateControllerBuilder<T> builder;
  final String id;
  final Widget? loadingView;
  final bool disableState;

  final Widget? errorView;
  final Widget? noResultView;
  final Function? onRetryFunction;
  static List<StateHolder> stateList = [];
  StateBuilder({
    required this.id,
    required this.builder,
    this.initialWidgetState = WidgetState.loading,
    this.loadingView,
    this.disableState = false,
    this.onRetryFunction,
    this.errorView,
    this.noResultView,
    Key? key,
  }) : super(key: key) {
    bool contains = false;
    for (StateHolder stateHolder in stateList) {
      if (stateHolder.id == id) {
        contains = true;
      }
    }
    if (!contains) {
      stateList.add(StateHolder(id: id, widgetState: initialWidgetState));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      id: id,
      builder: (_) {
        final widgetState = stateList
            .where((stateHolder) => stateHolder.id == id)
            .toList()
            .first
            .widgetState;
        if (disableState) {
          return builder(widgetState, controller);
        } else {
          switch (widgetState) {
            case WidgetState.loaded:
              return builder(widgetState, controller);
            case WidgetState.loading:
              return loadingView ?? const LoadingWidget();
            case WidgetState.noResults:
              return noResultView ?? const NoResultsWidget();
            case WidgetState.error:
              return errorView ?? const NoResultsWidget();
            default:
              return builder(widgetState, controller);
          }
        }
      },
    );
  }
}

enum WidgetState {
  loading,
  error,
  noResults,
  loaded,
  loadingMore,
  disable,
  enable,
  noMoreData
}
typedef StateControllerBuilder<T extends GetxController> = Widget Function(
    WidgetState widgetState, T controller);

class StateHolder {
  final String id;
  WidgetState widgetState;
  StateHolder({
    required this.id,
    required this.widgetState,
  });
  @override
  String toString() {
    return '''
    StateHolder______________________________________
      "id": $id
      "widgetState": ${widgetState.toString()}
    StateHolder______________________________________
    ''';
  }
}
