import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../strings/words.dart';


class StorageHandler {
  StorageHandler._();

  static StorageHandler? _instance;

  factory StorageHandler() => _instance ??= StorageHandler._();
  static String language = "English";
  late SharedPreferences storage;

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();

    if (cachedLanguage == null) {
      StorageHandler().setLocale(proccessLang());
    }
  
  }

 

//================Auth===============

 
  //==============Setting==============
  Future<void> setLocale(String locale) =>
      storage.setString(Words.cachedLanguage, locale);

  Future<void> setToken(String token) => storage.setString(Words.token, token);


  Future<void> removeToken() => storage.remove(Words.token);
 


 

  String? get token => storage.getString(Words.token);


  String? get cachedLanguage => storage.getString(Words.cachedLanguage);



  String proccessLang() {
    if (language == "ar") {
      return "ar";
    } else {
      return "en";
    }
  }

//===================
}
