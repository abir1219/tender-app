import 'package:flutter/material.dart';

import '../widgets/reusable_widgets.dart';

class PasswordDialogScreen extends StatefulWidget {
  const PasswordDialogScreen({super.key});

  @override
  State<PasswordDialogScreen> createState() => _PasswordDialogScreenState();
}

class _PasswordDialogScreenState extends State<PasswordDialogScreen> {

  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _oldPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Old Password',
            ),
          ),
          TextField(
            controller: _newPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'New Password',
            ),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
          onPressed: () {
            // You can add your logic here to handle the updated password
            String oldPassword = _oldPasswordController.text;
            String newPassword = _newPasswordController.text;

            // Perform password update logic, e.g., call an API, update state, etc.
            // For demonstration purposes, printing the passwords here
            print('Old Password: $oldPassword');
            print('New Password: $newPassword');

            // Close the dialog
            Navigator.of(context).pop();
          },
          child: const Text('Update Password'),
        ),
      ],
    );
  }
}
