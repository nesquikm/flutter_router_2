import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../pages/pages.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit(List<PageConfig> stack) : super(NavigationState(stack));

  void replace(PageConfig pageConfig) {
    if (pageConfig != state.first) {
      emit(NavigationState([pageConfig]));
    }
  }

  void push(PageConfig pageConfig) {
    if (pageConfig != state.last) {
      emit(NavigationState([...state.configs, pageConfig]));
    }
  }

  void pop() {
    if (state.canPop()) {
      emit(NavigationState(state.configs.sublist(0, state.configs.length - 1)));
    }
  }

  bool canPop() {
    return state.canPop();
  }
}
