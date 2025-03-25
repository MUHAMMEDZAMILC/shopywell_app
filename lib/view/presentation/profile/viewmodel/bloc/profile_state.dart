part of 'profile_bloc.dart';

enum ProfileStatus {initlize,loading,loaded,error,btnloading,btnsuccess,btnerror,}
 class ProfileState extends Equatable {
  final ProfileStatus status;
  final UserData? userdata;
  const ProfileState({required this.status,this.userdata});
  
  @override
  List<Object?> get props => [status,userdata];
}


