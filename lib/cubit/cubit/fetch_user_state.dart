part of 'fetch_user_cubit.dart';

@immutable
sealed class FetchUserState {}

final class FetchUserInitial extends FetchUserState {}

final class FetchUserLoadingState extends FetchUserState{}
final class FetchUserLoadedState extends FetchUserState{
final List<UserData> userData;
FetchUserLoadedState({required this.userData});
}
final class fetchUserErrorState extends FetchUserState{}
