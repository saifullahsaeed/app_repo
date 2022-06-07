import 'dart:io';

class Complain {
  String? id;
  final String catagory;
  final String subCatagory;
  final String date;
  final String description;
  final String complaintNature;
  final File imageUrl;
  final bool isSolved = false;
  final int status = 0;

  Complain(
      {required this.catagory,
      required this.subCatagory,
      required this.date,
      required this.description,
      required this.complaintNature,
      required this.imageUrl});

  factory Complain.fromJson(Map<String, dynamic> json) {
    return Complain(
      catagory: json['catagory'],
      subCatagory: json['subCatagory'],
      date: json['date'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      complaintNature: json['complaintNature'],
    );
  }

  get image => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'catagory': catagory,
      'subCatagory': subCatagory,
      'date': date,
      'description': description,
      'complaintNature': complaintNature,
      'imageUrl': imageUrl,
      'isSolved': isSolved,
      'status': status,
    };
  }
}

class Catagory {
  final String name;
  final String description;

  Catagory({required this.name, required this.description});

  factory Catagory.fromJson(Map<String, dynamic> json) {
    return Catagory(
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }
}

class SubCatagory {
  final String name;
  final String description;
  final String categoryId;

  SubCatagory(
      {required this.name,
      required this.description,
      required this.categoryId});

  factory SubCatagory.fromJson(Map<String, dynamic> json) {
    return SubCatagory(
      name: json['name'],
      description: json['description'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'categoryId': categoryId,
    };
  }
}
