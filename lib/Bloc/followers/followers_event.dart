part of 'followers_bloc.dart';

@immutable
sealed class FollowersEvent {}
class FetchFollowers extends FollowersEvent {
  late final String name;
  FetchFollowers({required this.name});
}
