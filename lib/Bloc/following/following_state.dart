part of 'following_bloc.dart';

@immutable
sealed class FollowingState {}

final class FollowingInitial extends FollowingState {}
class followingLoading extends FollowingState {}
class followingLoaded extends FollowingState {}
class followingError extends FollowingState {}
