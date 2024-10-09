part of 'followers_bloc.dart';

@immutable
sealed class FollowersState {}

final class FollowersInitial extends FollowersState {}
class followersLoading extends FollowersState {}
class followersLoaded extends FollowersState {}
class followesError extends FollowersState {}