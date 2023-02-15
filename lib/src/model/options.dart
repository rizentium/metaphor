import 'package:metaphor/src/model/resolver.dart';

class MetaphorOptions {
  final bool isEnabled;
  final List<MetaphorResolver> resolvers;

  MetaphorOptions({this.isEnabled = true, this.resolvers = const []});
}
