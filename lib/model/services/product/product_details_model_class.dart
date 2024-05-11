class ProductData {
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  String name;
  bool offer;
  int offerprice;
  bool instock;
  int price;
  List<String> field; 
  String category; 
  List<String> color; 
  String description;
  int stock;
  String brand; 
  List<String> size;

  ProductData({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.name,
    required this.offer,
    required this.offerprice,
    required this.instock,
    required this.price,
    required this.field,
    required this.category,
    required this.color,
    required this.description,
    required this.stock,
    required this.brand,
    required this.size,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: DateTime.parse(json['created']),
      updated: DateTime.parse(json['updated']),
      name: json['name'],
      offer: json['offer'],
      offerprice: json['offerprice'],
      instock: json['instock'],
      price: json['price'],
      field: List<String>.from(json['field']),
      category: json['category'],
      color: List<String>.from(json['color']),
      description: json['description'],
      stock: json['stock'],
      brand: json['brand'],
      size: List<String>.from(json['size']),
    );
  }
}
