class Category {
  final String name;

  final String image;

  Category(this.name, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(
          item['name'] as String,
          item['image'] as String,
        ))
    .toList();

var categoriesData = [
  {"name": "Video", 'image': "assets/images/marketing.png"},
  {"name": "Article", 'image': "assets/images/ux_design.png"},
  {
    "name": "Quiz",
    'image': "assets/images/photography.png"
  },
  {"name": "Lapor", 'image': "assets/images/business.png"},
];
