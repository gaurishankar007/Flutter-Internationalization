part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Locale locale;
  const LanguageState({required this.locale});

  @override
  List<Object> get props => [locale];
}
