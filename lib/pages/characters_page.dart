import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_router_2/cubit/navigation_cubit.dart';
import 'package:flutter_router_2/pages/pages.dart';

import 'pages.dart';

class CharactersPage extends RIMOPage<CharactersPageConfig> {
  const CharactersPage(CharactersPageConfig routePath) : super(routePath);

  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      final _cubit = context.read<NavigationCubit>();
      _cubit.push(CharacterPageConfig(10));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('CharactersPage'),
        OutlinedButton(
            onPressed: _onPressed,
            child: const Text('To CharacterPage, with id=10'))
      ],
    );
  }
}
