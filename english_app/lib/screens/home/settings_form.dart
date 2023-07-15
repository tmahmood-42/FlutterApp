import 'package:flutter/material.dart';
import 'package:english_app/utils/constants/inputs.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> gender = ['0', '1', '2', '3', '4'];

  // form values
  String? _currentName;
  String? _currentGender;  
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update User Settings',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Update Email'),
            validator: (val) => val?.isEmpty ?? true ?'Enter Email' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          // dropdown
          /*DropdownButtonFormField(
            value: _currentGender ?? 'Other',
            items: gender.map((selectedGender) {
              return DropdownMenuItem(
                value: selectedGender,
                child: Text(selectedGender),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentGender = val as String?),
          ),
          */
          // slider
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink[400], // Button background color
            ),
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async{
              print(_currentName);
              print(_currentGender);
              print(_currentStrength);
            },
          ),
        ],
      ),
    );
  }
}