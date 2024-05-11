part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.error(String errorMessage) = _Error;
  const factory HomeState.loaded(Tasks tasks) = _Loaded;
}
