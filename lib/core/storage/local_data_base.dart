import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as pathp;
import 'package:sqflite/sqflite.dart';

class Sqldb {
  Sqldb._();

  static Sqldb? _instance;

  factory Sqldb() => _instance ??= Sqldb._();
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initdatabace();
      return _db;
    } else {
      return _db;
    }
  }

  Future<bool> get dbisNotNull async {
    if (_db == null) {
      return false;
    } else {
      return true;
    }
  }

  initdatabace() async {
    String databacepath = await getDatabasesPath();
    String path = pathp.join(databacepath, 'movo.db');
    Future<Database> mydb = openDatabase(
      path,
      onCreate: oncreatedatabase,
      version: 3,
      onUpgrade: onupdatedatabase,
    );
    return mydb;
  }

  onupdatedatabase(Database db, int oldversion, int newversion) async {
    await db.execute('''
    ALTER TABLE notes ADD COLUMN title TEXT
    ''');
    if (kDebugMode) {
      print("onupgrade===================");
    }
  }

  oncreatedatabase(Database db, int version) async {
    Batch baths = db.batch();
    baths.execute('''
    CREATE TABLE "notes" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL  ,
    "note" TEXT NOT NULL ,
    "title" TEXT NOT NULL
       )
    ''');
    baths.execute('''
  CREATE TABLE "attendances" (
    "id" integer primary key autoincrement not null,
    "user_id" integer not null,
    "type" varchar check ("type" in ('check_in', 'check_out')) not null,
    "location" Json not null,
    "created_at" datetime,
    foreign key("user_id") references "users"("id"));
    ''');
    baths.execute('''
  CREATE TABLE IF NOT EXISTS "posts" (
  "id" integer primary key not null,
   "title" varchar not null, 
   "sub_title" varchar, 
   "body" text not null, 
   "published_at" datetime,
   "cover_photo_path" varchar not null,
   "user_id" integer ,
   "author" text not null,
   "isOffline" integer
   );
    ''');
    baths.execute('''
 CREATE TABLE IF NOT EXISTS "task_locations" (
  "id" integer primary key autoincrement not null,
  "user_id" integer not null,
  "task_id" integer,
  "location" text not null,
  "created_at" datetime not null,
  foreign key("user_id") references "users"("id") on delete cascade,
  foreign key("task_id") references
  "tasks"("id") on delete cascade);
    ''');
    baths.execute('''
 CREATE TABLE polygons (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type TEXT NOT NULL,
  geometry TEXT NOT NULL,
  properties TEXT NOT NULL
);
    ''');
    await baths.commit();
    if (kDebugMode) {
      print("on create database");
    }
  }

  readData(String sql) async {
    Database? mydata = await db;
    List<Map> respons = await mydata!.rawQuery(sql);
    return respons;
  }

  insertData(String sql) async {
    Database? mydata = await db;
    int response = await mydata!.rawInsert(sql);
    return response;
  }

  deletData(String sql) async {
    Database? mydata = await db;
    int response = await mydata!.rawDelete(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydata = await db;
    int response = await mydata!.rawUpdate(sql);
    return response;
  }

  deletemydatabasee() async {
    String databacepath = await getDatabasesPath();
    String path = pathp.join(databacepath, 'movo.db');
    await deleteDatabase(path);
  }

  read(table) async {
    Database? mydb = await db;
    List<Map> respons = await mydb!.query(table);
    return respons;
  }

  List<T> toListSql<T>(
    T Function(Map<String, dynamic> json) fromJson,
    List<Map<String, dynamic>> mapSql,
  ) {
    return mapSql.map((e) {
      if (kDebugMode) {
        print("Object ==> $e");
      }
      return fromJson(e);
    }).toList();
  }

  insert(table, Map<String, Object?> values) async {
    Database? mydb = await db;
    int respons = await mydb!.insert(table, values);
    return respons;
  }

  update(table, Map<String, Object?> values, String? mywhere) async {
    Database? mydb = await db;
    int respons = await mydb!.update(table, values, where: mywhere);
    return respons;
  }

  delete(table, String? mywhere) async {
    Database? mydb = await db;
    int respons = await mydb!.delete(table, where: mywhere);
    return respons;
  }
}
