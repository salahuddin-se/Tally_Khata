import 'package:tallykhata/models/contact.dart';
import 'package:tallykhata/util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance= new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String dbName="contactDB.db";
  final String contactTable=Util.TABLE_NAME;
  final String columnID="id";
  final String columnName="name";
  final String columnVillage="village";
  final String columnPhone="phone";
  final String columnQty="qty";
  final String columnRate="rate";
  final String columnTotal="total";
  final String columnCollection="collection";
  final String columnDue="due";
  int versionNumber=7;

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,dbName);
    var db=await openDatabase(path, version: 7,onCreate: _onCreate);
    return db;
  }



  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $contactTable ("
            "$columnID INTEGER PRIMARY KEY AUTOINCREMENT,"
            "$columnName TEXT,"
            "$columnVillage TEXT,"
            "$columnPhone TEXT,"
            "$columnQty TEXT,"
            "$columnRate TEXT,"
            "$columnTotal TEXT,"
            "$columnCollection TEXT,"
            "$columnDue TEXT"
            ")");
  }


  Future<int> create(Contact contact) async{
    var dbClient = await db;
    var result = await dbClient.insert(contactTable, contact.toMap());
    return result;
  }

  Future<List> findAll() async{
    var dbClient = await db;
    var result = await dbClient.query(contactTable, columns: [
      columnID,
      columnName,
      columnVillage,
      columnPhone,
      columnQty,
      columnRate,
      columnTotal,
      columnCollection,
      columnDue,
    ]

    );
    return result.toList();
  }

  Future<int> delete(int id) async{
    var dbClient =await db;
    return await dbClient.delete(contactTable, where: '$columnID = ?', whereArgs: [id]);
  }


  Future<int> update(Contact contact) async{
    var dbClient = await db;
    var result = await dbClient.update(contactTable, contact.toMap(), where: "$columnID = ?",whereArgs: [contact.id]);
    return result;
  }
}


