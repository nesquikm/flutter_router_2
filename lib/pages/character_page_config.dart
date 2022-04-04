import 'pages.dart';

class CharacterPageConfig extends PageConfig {
  CharacterPageConfig(this.id);

  @override
  RIMOPage createPage() => CharacterPage(this);

  final int id;

  @override
  List<Object?> get props => [...super.props, id];
}
