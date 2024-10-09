part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}
class postLoading extends PostState {}
class postLoaded extends PostState {}
class postError extends PostState {}
