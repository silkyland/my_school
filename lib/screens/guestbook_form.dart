import 'package:flutter/material.dart';

class GuestbookFormScreen extends StatefulWidget {
  static const String routeName = '/guest_book_form';
  const GuestbookFormScreen({Key? key}) : super(key: key);

  @override
  State<GuestbookFormScreen> createState() => _GuestbookFormScreenState();
}

class _GuestbookFormScreenState extends State<GuestbookFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _messageController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void> _submit() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สมุดเยี่ยมชม'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'ชื่อ',
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'กรุณากรอกชื่อ';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      labelText: 'ข้อความ',
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'กรุณากรอกข้อความ';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'อีเมล',
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'กรุณากรอกอีเมล';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text('ส่ง'),
              onPressed: () {
                _submit();
              },
            ),
          ],
        ),
      ),
    );
  }
}
