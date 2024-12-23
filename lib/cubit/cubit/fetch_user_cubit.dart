
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_flutter_project/model/get_userdata.dart';
import 'package:new_flutter_project/repo/fetch_user.dart';

part 'fetch_user_state.dart';

class FetchUserCubit extends Cubit<FetchUserState> {
  final FetchUserRepo fetchUserRepo;
  FetchUserCubit(this.fetchUserRepo) : super(FetchUserInitial());

  Future<void> getUserData()async{
    emit(FetchUserLoadingState());
    try{
      final userData = await fetchUserRepo.getUserData();

      if(userData.first.body!=null){
        emit(FetchUserLoadedState(userData: userData));
      }
    }catch(e){
      log(e.toString());
      emit(fetchUserErrorState());
    }
  }
}
