import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_portofolio_app/models/portfolio.dart';
import 'package:intl/intl.dart';
import 'package:my_portofolio_app/providers/form_portfolio_providers.dart';
import 'package:my_portofolio_app/providers/portfolio_providers.dart';
import 'package:provider/provider.dart';

class MyPortfolioFormScreen extends StatefulWidget {
  @override
  _MyPortfolioFormScreenState createState() => _MyPortfolioFormScreenState();
}

class _MyPortfolioFormScreenState extends State<MyPortfolioFormScreen> {
  File? _image;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final formProviderTemp = Provider.of<FormPortfolioProviders>(
        context,
        listen: false,
      );
      setState(() {
        _image = File(pickedFile.path);
      });
      formProviderTemp.setProjectImage(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormPortfolioProviders>(context);
    final portfolioProvider = Provider.of<PortfolioProviders>(context);
    bool isUrlValid = true;
    // final dateMaskFormatter = MaskTextInputFormatter(
    //   mask: '##/####', // MM/YYYY
    //   filter: {"#": RegExp(r'[0-9]')},
    //   type: MaskAutoCompletionType.lazy,
    // );

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
            key: formProvider.formKey,
            child: Column(
              spacing: 25,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //PROJECT TITLE
                TextFormField(
                  controller: formProvider.projectTitleController,
                  decoration: InputDecoration(labelText: 'Project Title'),
                  autofillHints: [AutofillHints.name],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your peroject title!';
                    }

                    return null;
                  },
                ),

                //CATEGORY
                DropdownButtonFormField<String>(
                  value: formProvider.formData.category,
                  decoration: InputDecoration(labelText: 'Category'),
                  items: ['Web App', 'Mobile App']
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => formProvider.setCategory(value),
                  validator: (value) =>
                      value == null ? 'Please select a category!' : null,
                ),

                //DATE
                TextFormField(
                  controller: formProvider.completionDateStringController,
                  decoration: InputDecoration(
                    labelText: 'Completion Date (MM/YYYY)',
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your project completion date!';
                    }

                    return null;
                  },
                  onTap: () {
                    formProvider.pickDate(context);
                  },
                ),

                //DESCRIPTION
                TextFormField(
                  controller: formProvider.descriptionController,
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
                  controller: formProvider.projectLinkController,
                  decoration: InputDecoration(
                    labelText: 'Project Link',
                    alignLabelWithHint: true,
                  ),
                  autofillHints: [AutofillHints.url],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your project link!';
                    }

                    final urlPattern =
                        r'^(https?:\/\/)?([\w\-])+\.{1}([a-zA-Z]{2,63})([\/\w\-]*)*\/?$';
                    final result = RegExp(urlPattern).hasMatch(value);

                    if (!result) {
                      return 'Please enter a valid URL!';
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
                      onPressed: () {
                        pickImage();
                      },
                      label: Text("Pick Image"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Row(
          spacing: 12,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                ),

                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: const Text("Are you sure you want to cancel?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              Navigator.of(context).pop();
                            },
                            child: const Text("Yes"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text("No"),
                          ),
                        ],
                      );
                    },
                  );
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
                    borderRadius: BorderRadius.circular(12),
                  ),

                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                ),

                onPressed: () {
                  if (formProvider.validateForm()) {
                    formProvider.saveForm();

                    portfolioProvider.addPortfolio(formProvider.formData);

                    Navigator.pop(context);

                    formProvider.resetForm();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green[50],
                        content: Text(
                          'Portfolio item added successfully',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    );
                    //print(formProvider.formData.toString());
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
      ),
    );
  }
}
