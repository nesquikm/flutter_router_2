import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_router_2/cubit/navigation_cubit.dart';
import 'package:flutter_router_2/pages/pages.dart';

import 'pages.dart';

class LocationsPage extends RIMOPage<LocationsPageConfig> {
  const LocationsPage(LocationsPageConfig routePath) : super(routePath);

  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      final _cubit = context.read<NavigationCubit>();
      _cubit.push(LocationPageConfig(42));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('LocationsPage'),
        OutlinedButton(
            onPressed: _onPressed,
            child: const Text('To LocationPage, with id=42'))
      ],
    );
  }
}
