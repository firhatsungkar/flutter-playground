import 'package:flutter/material.dart';

class FlutterForm extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final formController = <String, TextEditingController>{
    'email': TextEditingController(),
  };
  final formKey = GlobalKey<FormState>();
  Future<void> _buildAlert({BuildContext context, String message}) {
    print('_showAlert method called');
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(message),
        );
      }
    );
  }
  Future<void> _showAlert(BuildContext context) {
    print('_showAlert method called');
    return _buildAlert(context: context, message: 'You typed: "${_controller.text}"');
  }
  void _submit(BuildContext context) {
    final form = formKey.currentState;
    if (form.validate()) {
      print('email is ${formController['email'].text}');
      form.save();
      // _buildAlert(context: context, message: '');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form'),),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type Something ...',
                labelText: 'Text Field'
              ),
            ),
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () => _showAlert(context),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) => !value.contains('@') ? 'Not valid email' : null,
                      onSaved: (val) => null,
                      controller: formController['email'],
                      decoration: const InputDecoration(
                        hintText: 'Type your email',
                        labelText: 'Email'
                      ),
                    ),
                    RaisedButton(
                      child: Text('Submit Form'),
                      onPressed: () => _submit(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}