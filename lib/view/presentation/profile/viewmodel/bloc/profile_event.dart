// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInitEvent extends ProfileEvent {
  BuildContext context;
  ProfileInitEvent(this.context);
}

class ProfileeditEvent extends ProfileEvent{
  BuildContext context;
  UserData userdata;
  ProfileeditEvent(this.context,this.userdata);
}