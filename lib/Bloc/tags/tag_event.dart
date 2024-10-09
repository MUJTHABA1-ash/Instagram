part of 'tag_bloc.dart';

@immutable
sealed class TagEvent {}
class Fetchtag extends TagEvent {
  late final name;
  Fetchtag({required this.name});
}
