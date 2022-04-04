import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_router_2/cubit/navigation_cubit.dart';
import 'package:flutter_router_2/pages/pages.dart';

import 'router_delegate.dart';
import 'route_parser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit([CharactersPageConfig()]),
      child: const MyAppView(),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<NavigationCubit>();
    RIMORouterDelegate _delegate = RIMORouterDelegate(_cubit);
    RIMORouteInformationParser _parser = RIMORouteInformationParser();

    return MaterialApp(
      home: Scaffold(
        body: MaterialApp.router(
            routeInformationParser: _parser, routerDelegate: _delegate),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _HomeTabButton(
                pageConfig: CharactersPageConfig(),
                icon: Icons.person,
              ),
              _HomeTabButton(
                pageConfig: LocationsPageConfig(),
                icon: Icons.location_pin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    Key? key,
    required this.pageConfig,
    required this.icon,
  }) : super(key: key);

  final PageConfig pageConfig;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final firstRoute =
        context.select((NavigationCubit cubit) => cubit.state.first);

    final isActive = firstRoute == pageConfig;
    return IconButton(
      onPressed: () => context.read<NavigationCubit>().replace(pageConfig),
      iconSize: 32,
      color: isActive ? Theme.of(context).colorScheme.secondary : null,
      icon: Icon(
        icon,
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

//   late RIMORouterDelegate _delegate;
//   late RIMORouteInformationParser _parser; // = RIMORouteInformationParser();
//   late final _cubit;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(create: (_) {
//       _cubit = NavigationCubit([CharactersPageConfig()]);
//       _delegate = RIMORouterDelegate(_cubit);
//       _parser = RIMORouteInformationParser();
//       return _cubit;
//     }, child: Builder(builder: (context) {
//       // return Text('');
//     }));
//     // child: MaterialApp.router(
//     // routeInformationParser: _parser, routerDelegate: _delegate),
//     // child: (_) => MyNav(
//     //       cubit: _cubit,
//     //       delegate: _delegate,
//     //       parser: _parser,
//     //     ));
//   }
// }

// class MyNav extends StatelessWidget {
//   const MyNav(
//       {Key? key,
//       required this.delegate,
//       required this.parser,
//       required this.cubit})
//       : super(key: key);

//   final RIMORouterDelegate delegate;
//   final RIMORouteInformationParser parser;
//   final NavigationCubit cubit;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routeInformationParser: parser,
//       routerDelegate: delegate,
//     );
//   }
// }
