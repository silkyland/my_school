import 'package:flutter/material.dart';
import 'package:my_school/screens/guestbook_form.dart';
import 'package:my_school/services/guestbook_service.dart';
import 'package:my_school/type.dart';

class GuestBookScreen extends StatefulWidget {
  static const String routeName = '/guest_book';
  const GuestBookScreen({Key? key}) : super(key: key);

  @override
  State<GuestBookScreen> createState() => _GuestBookScreenState();
}

class _GuestBookScreenState extends State<GuestBookScreen> {
  List<Guestbook> _guestbooks = [];

  Future<void> _getGuestbooks() async {
    var guestbooks = await GuestbookService.getGuestbooks();
  }

  @override
  void initState() {
    super.initState();
    _getGuestbooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('Guest Book'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            GuestbookFormScreen.routeName,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
