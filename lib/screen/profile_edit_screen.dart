import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_portofolio_app/providers/user_providers.dart';
import 'package:my_portofolio_app/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

class ProfileEditScreen extends StatelessWidget {
  final String currentName;
  final String currentPosition;
  final String currentLocation;

  const ProfileEditScreen({
    required this.currentName,
    required this.currentPosition,
    required this.currentLocation,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _editName = TextEditingController(
      text: currentName,
    );
    final TextEditingController _editPosiition = TextEditingController(
      text: currentPosition,
    );
    final TextEditingController _editLocation = TextEditingController(
      text: currentLocation,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _editName,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _editPosiition,
              decoration: InputDecoration(labelText: 'Position'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _editLocation,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newName = _editName.text;
                final newPosition = _editPosiition.text;
                final newLocation = _editLocation.text;
                if (newName.isNotEmpty) {
                  context.read<UserProviders>().updateName(newName);
                }
                if (newPosition.isNotEmpty) {
                  context.read<UserProviders>().updatePosition(newPosition);
                }
                if (newLocation.isNotEmpty) {
                  context.read<UserProviders>().updateLocation(newLocation);
                }
                Navigator.pop(context);
                customToast('Profile saved!');
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
