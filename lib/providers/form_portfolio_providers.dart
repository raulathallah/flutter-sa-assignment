import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_portofolio_app/models/portfolio.dart';

class FormPortfolioProviders with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  Portfolio formData = Portfolio();

  // Controllers
  final projectTitleController = TextEditingController();
  final descriptionController = TextEditingController();
  final projectLinkController = TextEditingController();
  final completionDateStringController = TextEditingController();

  void setProjectTitle(String value) {
    formData.projectTitle = value;
    notifyListeners();
  }

  void setCategory(String? value) {
    formData.category = value;
    notifyListeners();
  }

  void setCompletionDate(DateTime? date) {
    formData.completionDate = date;
    notifyListeners();
  }

  void setCompletionDateString(String? value) {
    formData.completionDateString = value;
    notifyListeners();
  }

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,

      initialDate: formData.completionDate ?? DateTime.now(),

      firstDate: DateTime(2000),

      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setCompletionDate(picked);
      completionDateStringController.text = DateFormat(
        'd MMMM y',
      ).format(picked);
    }
  }

  void setDescription(String value) {
    formData.description = value;
    notifyListeners();
  }

  void setProjectImage(String? value) {
    formData.projectImage = value;
    notifyListeners();
  }

  void setProjectLink(String value) {
    formData.projectLink = value;
    notifyListeners();
  }

  bool validateForm() {
    return formKey.currentState!.validate();
  }

  void saveForm() {
    formData.projectTitle = projectTitleController.text;
    formData.description = descriptionController.text;
    formData.projectLink = projectLinkController.text;
  }

  void resetForm() {
    formData = Portfolio();
    projectTitleController.clear();
    descriptionController.clear();
    projectLinkController.clear();
    notifyListeners();
  }
}
