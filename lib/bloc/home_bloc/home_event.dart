part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable{
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class FetchCoworkerEvent extends HomeEvent{

  const FetchCoworkerEvent();
  @override
  List<Object>  get props => [];

}