import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nasa_today/core/network/api_response_result.dart';
import 'package:nasa_today/features/apod/data/repository/nasa_repository.dart';
import 'package:nasa_today/features/apod/domain/models/apod_model.dart';

part 'apod_details_state.dart';

@Singleton()
class ApodDetailsCubit extends Cubit<ApodDetailsState> {
  ApodDetailsCubit({required NasaRepository nasaRepository})
      : _nasaRepository = nasaRepository,
        super(InitState());

  final NasaRepository _nasaRepository;

  Future<void> getApod() async {
    emit(LoadingState());

    final response = await _nasaRepository.getApod();
    switch (response) {
      case ApiSuccessResult<ApodModel, Exception>():
        emit(DataLoadedState(response.data));
      case ApiErrorResult<ApodModel, Exception>():
        emit(ErrorState(response.exception.toString()));
    }
  }
}
