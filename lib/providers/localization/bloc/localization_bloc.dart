import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'localization_event.dart';
import 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState(locale: Locale('en'))) {
    on<ChangeLocaleEvent>((event, emit) {
      emit(LocalizationState(locale: event.locale));
    });
  }
}
