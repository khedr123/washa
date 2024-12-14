

// File: lib/model/item_model.dart
class ItemModel {
  final String title;
  final String description;

  ItemModel({required this.title, required this.description});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

