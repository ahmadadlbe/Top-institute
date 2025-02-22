import 'package:easy_localization/easy_localization.dart';
import '../strings/failures.dart';

// validations
class AppValidator {
  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }
    if (!(RegExp(r'^\+?[0-9]{6,}$').hasMatch(value))) {
      return FailureMessages.invalidPhone.tr();
    }
    return null;
  }

  static String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }
    double? x;
    x = double.tryParse(value);
    if (x == null) {
      return FailureMessages.invalidNumber.tr();
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
            .hasMatch(value)) {
      return FailureMessages.invalidEmail.tr();
    }
    return null;
  }

  static String? nameValidator(dynamic value) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }
    return null;
  }

  static String? objectValidator(dynamic value) {
    if (value == null) {
      return FailureMessages.empty.tr();
    }
    return null;
  }

  static String? policValidator(bool? value) {
    if (value == false) {
      return "Check policy required";
    }
    return null;
  }

  static String? stringValidator(String? value, {int length = 4}) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }

    if ((value.length < length)) {
      return "can't be less @length than Letter";
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى إدخال تاريخ الميلاد";
    }

    // نمط التحقق: يجب أن يكون YYYY-MM-DD
    final RegExp datePattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');

    if (!datePattern.hasMatch(value)) {
      return "صيغة التاريخ غير صحيحة، يرجى إدخال YYYY-MM-DD";
    }

    try {
      // تحويل النص إلى تاريخ
      DateTime birthDate = DateTime.parse(value);
      DateTime today = DateTime.now();
      DateTime eighteenYearsAgo = today.subtract(Duration(days: 18 * 365));

      if (birthDate.isAfter(eighteenYearsAgo)) {
        return "يجب أن يكون العمر 18 سنة أو أكثر";
      }

      return null; // لا يوجد خطأ
    } catch (e) {
      return "تاريخ غير صالح";
    }
  }

  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }
    if ((value.length != 4)) {
      return FailureMessages.invalidOTP.tr();
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return FailureMessages.empty.tr();
    }
    if ((value.length < 8)) return FailureMessages.invalidPass.tr();

    return null;
  }

  static String? matchPassword(String value1, String value2) {
    if (value1.isEmpty) {
      return FailureMessages.empty.tr();
    }
    if (value1 != value2) {
      return FailureMessages.notMatch.tr();
    }
    return null;
  }
}
