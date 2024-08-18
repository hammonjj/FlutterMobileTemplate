import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class ChangeLocaleEvent extends LocalizationEvent {
  final Locale locale;

  const ChangeLocaleEvent(this.locale);

  @override
  List<Object> get props => [locale];
}
