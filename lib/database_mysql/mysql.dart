import 'package:mysql_client/mysql_client.dart';
class MySqlDb{
  static MySQLConnection? _conn;

  static connDB()async{
    _conn ??= await MySQLConnection.createConnection(
        host: "192.168.0.60",
        port: 3306,
        userName: "shema",
        password: "0000",
    secure: false,databaseName: "project");
    await _conn!.connect();
    print('==================== connected');
  }
  static insert(String table,Map<String, dynamic> data) async{
    String cols = data.keys.join(",");
    String passVal = data.keys.map((e) => ":$e").join(",");
    String sql = "INSERT INTO $table($cols) VALUES($passVal)";
    await _conn!.execute(sql, data);
  }

  static update(String table,Map<String, dynamic> data, int id) async{
    String passVal = data.keys.map((e) => "$e = :$e").join(",");
    String sql = "UPDATE $table SET $passVal WHERE userid = :id";
    data["id"] = id;
    await _conn!.execute(sql, data);
  }

  static query(String table)async{
    String sql = "SELECT * FROM $table";
    final res = await _conn!.execute(sql);
    List data = [];
    for(var row in res.rows){
      data.add(row.assoc());
    }
    return data;
  }

  static delete(String table, int id)async{
    String sql = "DELETE FROM $table WHERE userid = :id";
    await _conn!.execute(sql, {"id": id});
  }
}
