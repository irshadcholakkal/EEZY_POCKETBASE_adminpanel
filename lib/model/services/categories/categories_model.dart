



class Categories {
  final String id;
  final String field;

  Categories({
    required this.id,
    required this.field,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      field: json['field'],
    );
  }
}

class Sizes {
  final String id;
  final String size;
  final List<dynamic> field;

  Sizes({
    required this.id,
        required this.size,
                required this.field,


  });

  factory Sizes.fromJson(Map<String, dynamic> json) {
    return Sizes(
      id: json['id'],
      size: json['SIZES'],
      field: json['field']
    );
  }
}

class Brands {
  final String id;
  final String name;
  final List<dynamic> field;

  Brands({
    required this.id,
        required this.name,
                required this.field,


  });

  factory Brands.fromJson(Map<String, dynamic> json) {
    return Brands(
      id: json['id'],
      name: json['brand_name'],
      field: json['field']
    );
  }
}