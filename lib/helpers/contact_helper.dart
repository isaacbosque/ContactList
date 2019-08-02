import 'package:sqflite/sqflite.dart';

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

  get db(){
    if(_db != null)
      return _db;
    else
      _db = initDB();
  }

  initDB(){

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
      map[idColumn
    :
    id
    ];
    return
    map;
  }
}