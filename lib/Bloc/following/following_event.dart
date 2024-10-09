part of 'following_bloc.dart';

@immutable
sealed class FollowingEvent {}
class FetchFollowing extends FollowingEvent {
  late final name;
  FetchFollowing({required this.name});
}

