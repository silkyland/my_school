import 'package:flutter/material.dart';
import 'package:my_school/connect.dart';
import 'package:my_school/screens/guestbook_form.dart';
import 'package:my_school/type.dart';
import 'package:mysql1/mysql1.dart';

class GuestBookScreen extends StatefulWidget {
  static const String routeName = '/guest_book';
  const GuestBookScreen({Key? key}) : super(key: key);

  @override
  State<GuestBookScreen> createState() => _GuestBookScreenState();
}

class _GuestBookScreenState extends State<GuestBookScreen> {
  List<Guestbook> _guestbooks = [];

  Future<void> getGuestbooks() async {
    final _conn = await MySqlConnection.connect(Connect.settings);
    var results =
        await _conn.query('SELECT * FROM guestbooks ORDER BY id DESC');
    List<Guestbook> guestbooks = [];
    for (var row in results) {
      guestbooks.add(Guestbook(
        id: row.fields['id'],
        name: row.fields['name'],
        message: row.fields['message'].toString(),
        email: row.fields['email'],
        createdAt: row.fields['created_at'],
        updatedAt: row.fields['updated_at'],
      ));
    }
    setState(() {
      _guestbooks = guestbooks;
    });
  }

  Future<bool> deleteGuestbook(int id) async {
    final _conn = await MySqlConnection.connect(Connect.settings);
    var result = await _conn.query('DELETE FROM guestbooks WHERE id = ?', [id]);
    return result.affectedRows == 1;
  }

  @override
  void initState() {
    super.initState();
    getGuestbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _guestbooks.length == 0
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _guestbooks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('ลบข้อมูล'),
                              content:
                                  const Text('คุณต้องการลบข้อมูลใช่หรือไม่'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('ยกเลิก'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await deleteGuestbook(
                                      _guestbooks[index].id,
                                    );
                                    getGuestbooks();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('ตกลง'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      leading: Text("${index + 1}"),
                      title: Text(_guestbooks[index].name),
                      subtitle: Text(_guestbooks[index].message),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            GuestbookFormScreen.routeName,
          ).then((value) {
            getGuestbooks();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
