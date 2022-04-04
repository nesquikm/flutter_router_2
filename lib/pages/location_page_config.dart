import 'pages.dart';

class LocationPageConfig extends PageConfig {
  LocationPageConfig(this.id);

  @override
  RIMOPage createPage() => LocationPage(this);

  final int id;

  @override
  List<Object?> get props => [...super.props, id];
}
