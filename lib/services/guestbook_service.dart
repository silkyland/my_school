import 'package:my_school/connect.dart';
import 'package:mysql1/mysql1.dart';

import '../type.dart';

class GuestbookService {
  static Future<void> getGuestbook(int id) async {
    final _conn = await MySqlConnection.connect(Connect.settings);
    var results =
        await _conn.query('SELECT * FROM guestbooks WHERE id = ?', [id]);
    print(results.first);
  }

  static Future<void> getGuestbooks() async {
    final _conn = await MySqlConnection.connect(Connect.settings);
    var results = await _conn.query('SELECT * FROM guestbooks');
    print(results);
    //return results.map((e) => Guestbook.fromJson(e)).toList();
  }
}
