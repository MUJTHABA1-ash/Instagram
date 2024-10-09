part of 'tag_bloc.dart';

@immutable
sealed class TagState {}

final class TagInitial extends TagState {}
class tagLoading extends  TagState {}
class tagLoaded extends TagState {}
class tagError extends TagState {}
