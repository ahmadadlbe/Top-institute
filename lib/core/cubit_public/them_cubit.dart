import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_institute/core/storage/storage_handler.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(StorageHandler().appTheme == "light" ? false : true);

  toggleTheme(bool isDark) {
    emit(isDark);
  }
}
