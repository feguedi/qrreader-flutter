import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qrreader/src/models/models.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    // Path de la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');

    // crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE SCAN (
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT 
          )
          ''');
      },
    );
  }

  nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    // verificar la base de datos
    final db = await database;
    final resultado = await db.rawInsert('''
      INSERT INTO SCAN (id, tipo, valor) VALUES (
        $id, $tipo, $valor
      );
    ''');

    return resultado;
  }

  Future<int> nuevoScan(ScanModel ns) async {
    final db = await database;
    final resultado = await db.insert('SCAN', ns.toJson());
    print(resultado);
    return resultado;
  }
}
