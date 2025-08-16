import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:co_working/dao/home_dao.dart';
import 'package:co_working/models/co_worker_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late HomeDao homeDao;

  HomeBloc() : super(HomeInitial()) {
    homeDao = HomeDao();

    on<FetchCoworkerEvent>((event, emit) async{
      await mapFetchCoworkerEvent(event, emit);
    });
  }

  Future<void> mapFetchCoworkerEvent(
      FetchCoworkerEvent event, Emitter<HomeState> emit) async {
    try{
      emit(const HomeLoading());

      var response = await homeDao.fetchHomeList();
      final List<dynamic>  jsonDecoded = jsonDecode(response.body);

      if(response.statusCode == 200){
        List<CoworkerList> coWorkerList = [];
        for (var item in jsonDecoded) {
          coWorkerList.add(CoworkerList.fromJson(item));
        }
        emit(FetchCoWorkerSuccess(coWorkerList: coWorkerList));
      }else{
        emit(const FetchCoWorkerFailed());
      }
    }catch(error){
      print("The error is : $error");
      emit(const FetchCoWorkerFailed());
    }
  }
}
