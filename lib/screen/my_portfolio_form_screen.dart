import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_portofolio_app/models/portfolio.dart';
import 'package:intl/intl.dart';

class MyPortfolioFormScreen extends StatefulWidget {
  @override
  _MyPortfolioFormScreenState createState() => _MyPortfolioFormScreenState();
}

class _MyPortfolioFormScreenState extends State<MyPortfolioFormScreen> {
  final _formKey = GlobalKey<FormState>();

  Portfolio newPortfolio = Portfolio(
    projectTitle: '',
    category: null,
    completionDate: '',
    description: '',
    projectImage: '',
    projectLink: '',
  );

  String? selectedValue;

  DateTime? selectedDate;

  final TextEditingController _dateController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // String projectTitle;
  // String category;
  // String completionDate;
  // String description;
  // String projectImage;
  // String projectLink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Portfolio'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Attach the form key
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //PROJECT TITLE
                TextFormField(
                  decoration: InputDecoration(labelText: 'Project Title'),
                  autofillHints: [AutofillHints.name],
                  onChanged: (value) => {newPortfolio.projectTitle = value},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your peroject title!';
                    }

                    return null;
                  },
                ),

                //CATEGORY
                DropdownButtonFormField<String>(
                  value: newPortfolio.category,
                  decoration: InputDecoration(labelText: 'Category'),
                  items: ['Web App', 'Mobile App']
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,

                          child: Text(category),
                        ),
                      )
                      .toList(),

                  onChanged: (value) => newPortfolio.category = value,
                  validator: (value) =>
                      value == null ? 'Please select a category!' : null,
                ),

                //DATE
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Completion Date'),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your project completion date!';
                    }

                    return null;
                  },
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (picked != null) {
                      newPortfolio.completionDate = picked.toString();
                      _dateController.text = DateFormat(
                        'd MMMM y',
                      ).format(picked); // yyyy-MM-dd
                    }
                  },
                ),

                //DESCRIPTION
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    alignLabelWithHint: true,
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your project description!';
                    }

                    return null;
                  },
                ),

                //PROJECT LINK
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Project Link',
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your project link!';
                    }

                    return null;
                  },
                ),

                //IMAGE
                Column(
                  spacing: 6,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _image != null
                        ? Image.file(_image!, height: 140)
                        : Text("No image selected"),

                    ElevatedButton.icon(
                      icon: Icon(Icons.image),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                      ),
                      onPressed: pickImage,
                      label: Text("Pick Image"),
                    ),
                  ],
                ),

                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[50],
                          foregroundColor: Colors.red,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                        ),

                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: Text("Cancel"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                        ),

                        onPressed: () {
                          print(newPortfolio.toString());
                          if (_formKey.currentState!.validate()) {
                            // if valid =
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text('Form is valid')),
                            // );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red[50],
                                content: Text(
                                  'Oops! Please fill out all required fields correctly.',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          }
                        },

                        child: Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
