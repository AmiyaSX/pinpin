import '../../model/notice/notice.dart';
import 'pinpin_db.dart';
import 'package:sqflite/sqflite.dart';

class NoticeDao {

  static Future<void> addAccount(Notice notice) async {
    await ppDB.insert(noticeTableName, notice.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<Notice?> getNoticeByEmail(String email) async {
    List<Map> maps = await ppDB.query(
      accountTableName,
      where: 'email = ?',
      whereArgs: [email],
    );
    if (maps.isEmpty) {
      return null;
    }
    return Notice.fromJson(maps[0]);
  }

  static Future<void> updateUserName(String email, String userName) async {
    await ppDB.rawUpdate("UPDATE $noticeTableName SET user_name = ? where email = ?", [userName, email]);
  }

  static Future<List<Notice>> list() async {
    List<Map> maps = await ppDB.query(noticeTableName);

    List<Notice> notices = [];
    for (var map in maps) {
      notices.add(Notice.fromJson(map));
    }
    return notices;
  }
}