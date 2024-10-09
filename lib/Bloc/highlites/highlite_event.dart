part of 'highlite_bloc.dart';

@immutable
sealed class HighliteEvent {}
class FetchHighlite extends HighliteEvent {
  late final name;
  FetchHighlite({required this.name});
}
