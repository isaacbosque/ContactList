import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

final String contactTable = "contactTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String phoneColumn = "phoneColumn";
final String emailColumn = "emailColumn";
final String imgColumn = "imgColumn";

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper () => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async{
    if (_db != null)
      return _db;
    else{
      _db = await  initDB();
      return _db;
    }

  }

  Future<Database> initDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contacts.db");

    return await openDatabase(
        path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE ${contactTable} ($idColumn INTEGER PRIMARY KEY,$nameColumn"
              " TEXT not null,$phoneColumn TEXT not null, $emailColumn TEXT, $imgColumn TEXT) ");
    });
  }
}


class Contact {
  int id;
  String name;
  String phone;
  String email;
  String img_folder;

  Contact.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    phone = map[phoneColumn];
    email = map[emailColumn];
    img_folder = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      phoneColumn: phone,
      emailColumn: email,
      imgColumn: img_folder
    };
    if (id != null)
      map[idColumn] = id;
    return
      map;
  }
}