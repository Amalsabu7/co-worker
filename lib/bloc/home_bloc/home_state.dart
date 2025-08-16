part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable{
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}


class HomeLoading extends HomeState {
  const HomeLoading();
  @override
  List<Object> get props => [];
}

class FetchCoWorkerSuccess extends HomeState {
  List<CoworkerList> coWorkerList = [];
  FetchCoWorkerSuccess({required this.coWorkerList});
  @override
  List<Object> get props => [coWorkerList];
}

class FetchCoWorkerFailed extends HomeState {
  const FetchCoWorkerFailed();
  @override
  List<Object> get props => [];
}