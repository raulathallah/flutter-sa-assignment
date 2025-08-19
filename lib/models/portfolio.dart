class Portfolio {
  String projectTitle;
  String? category;
  String completionDate;
  String description;
  String projectImage;
  String projectLink;

  Portfolio({
    required this.projectTitle,
    required this.category,
    required this.completionDate,
    required this.description,
    required this.projectImage,
    required this.projectLink,
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
