import 'dart:io';

class Complain {
  final Catagory catagory;
  final SubCatagory subCatagory;
  final String date;
  final String description;
  final String complaintNature;
  final File imageUrl;
  final bool isSolved;
  final int status = 0;

  Complain(
      {required this.catagory,
      required this.subCatagory,
      required this.date,
      required this.description,
      required this.complaintNature,
      required this.imageUrl,
      required this.isSolved});

  factory Complain.fromJson(Map<String, dynamic> json) {
    return Complain(
      catagory: Catagory.fromJson(json['catagory']),
      subCatagory: SubCatagory.fromJson(json['subCatagory']),
      date: json['date'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      isSolved: json['isSolved'],
      complaintNature: json['complaintNature'],
    );
  }

  get image => null;

  Map<String, dynamic> toJson() {
    return {
      'catagory': catagory.toJson(),
      'subCatagory': subCatagory.toJson(),
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
