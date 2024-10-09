part of 'highlite_bloc.dart';

@immutable
sealed class HighliteState {}

final class HighliteInitial extends HighliteState {}
final class Highliteloading extends HighliteState {}
final class Highliteloaded extends HighliteState {}
final class Highliteerror extends HighliteState {}
