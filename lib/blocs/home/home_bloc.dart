import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_the_spot/blocs/bloc_status.dart';
import 'package:on_the_spot/blocs/home/home_event.dart';
import 'package:on_the_spot/blocs/home/home_state.dart';
import 'package:on_the_spot/network/repository/home/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository? homeRepo;

  HomeBloc({this.homeRepo}) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is HomeGetCardData) {
      emit(state.copyWith(appStatus: SubmissionLoading()));

      try {
        await homeRepo?.getHomeCard();
        emit(state.copyWith(appStatus: const SubmissionSuccess()));
        emit(state.copyWith(homeCardModel: await homeRepo?.getHomeCard()));
      } catch (e) {
        emit(state.copyWith(appStatus: SubmissionFailed(e)));
      }
    }
  }
}