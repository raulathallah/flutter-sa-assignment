import 'dart:io';

import 'package:flutter/material.dart';

class Portfolio {
  String projectTitle;
  String? category;
  DateTime? completionDate;
  String? completionDateString;
  String description;
  String? projectImage;
  String projectLink;

  Portfolio({
    this.projectTitle = '',
    this.category,
    this.completionDate,
    this.completionDateString = '',
    this.description = '',
    this.projectImage,
    this.projectLink = '',
  });

  @override
  String toString() {
    return 'Portfolio('
        'projectTitle: >>>$projectTitle, '
        'category: >>>$category, '
        'completionDate: >>>$completionDate, '
        'description: >>>$description, '
        'projectImage: >>>$projectImage, '
        'projectLink: >>>$projectLink'
        ')';
  }
}
