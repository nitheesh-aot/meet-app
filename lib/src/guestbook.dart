import 'package:flutter/material.dart';
import 'model/guestbookmsg.dart';
import 'widgets.dart';

class GuestBook extends StatefulWidget {
  GuestBook({required this.addMessage, required this.messages});
  final Future<void> Function(String message) addMessage;
  final List<GuestBookMessage> messages;

  @override
  _GuestBookState createState() => _GuestBookState();
}

class _GuestBookState extends State<GuestBook> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Leave a Message',
                    ),
                    validator: (value) {
                      return (value!.isEmpty)
                          ? 'Enter your message to continue'
                          : null;
                    },
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                StyledButton(
                    child: Row(
                      children: [
                        Icon(Icons.send),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text('Send'),
                      ],
                    ),
                    onPressed: _sendMsg)
              ],
            ),
          ),
        ),
        SizedBox(
          width: 4.0,
        ),
        for (var message in widget.messages)
          Paragraph(
            '${message.name}: ${message.message}',
          ),
        SizedBox(
          width: 4.0,
        ),
      ],
    );
  }

  Future<void> _sendMsg() async {
    if (_formKey.currentState!.validate()) {
      await widget.addMessage(_controller.text);
      _controller.clear();
    }
  }
}
