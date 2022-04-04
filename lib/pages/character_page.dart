import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_router_2/cubit/navigation_cubit.dart';
import 'package:flutter_router_2/pages/pages.dart';

import 'pages.dart';

class CharacterPage extends RIMOPage<CharacterPageConfig> {
  const CharacterPage(CharacterPageConfig routePath) : super(routePath);

  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      final _cubit = context.read<NavigationCubit>();
      _cubit.pop();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('CharacterPage ${routePath.id}'),
        OutlinedButton(onPressed: _onPressed, child: const Text('Pop to top!')),
      ],
    );
  }
}
