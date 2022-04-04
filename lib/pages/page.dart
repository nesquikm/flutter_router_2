import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class PageConfig extends Equatable {
  late final RIMOPage page = createPage();
  RIMOPage createPage();

  @override
  // TODO(nesquikm) IMHO page shouldn't be there
  // List<Object?> get props => [page];
  List<Object?> get props => [];
}

abstract class RIMOPage<T extends PageConfig> extends Page {
  const RIMOPage(this.routePath);
  final T routePath;

  Widget build(BuildContext context);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Scaffold(body: Center(child: build(context)));
        });
  }
}
