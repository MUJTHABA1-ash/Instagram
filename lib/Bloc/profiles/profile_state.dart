part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class Profileloading extends ProfileState {}
final class Profileloaded extends ProfileState {}
final class Profileerror extends ProfileState {}