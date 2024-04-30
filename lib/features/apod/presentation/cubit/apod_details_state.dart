part of 'apod_details_cubit.dart';

@immutable
sealed class ApodDetailsState {}

final class InitState extends ApodDetailsState {}

final class LoadingState extends ApodDetailsState {}

final class DataLoadedState extends ApodDetailsState {
  DataLoadedState(this.data);
  final ApodModel data;
}

final class ErrorState extends ApodDetailsState {
  ErrorState(this.message);
  final String message;
}
