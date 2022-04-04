part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState(this._stack);

  final List<PageConfig> _stack;

  List<RIMOPage> get pages => List.unmodifiable(_stack.map((e) => e.page));
  List<PageConfig> get configs => _stack;
  int get length => _stack.length;
  PageConfig get first => _stack.first;
  PageConfig get last => _stack.last;

  bool canPop() {
    return _stack.length > 1;
  }

  @override
  List<Object> get props => [_stack];
}
