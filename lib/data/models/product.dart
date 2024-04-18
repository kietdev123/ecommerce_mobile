class ProductModel {
  String? articleType;
  String? baseColour;
  String? brand;
  String? gender;
  String? id;
  String? masterCategory;
  int? price;
  String? productDisplayName;
  int? saleNumber;
  String? season;
  String? size;
  int? star;
  String? subCategory;
  String? usage;
  String? year;
  List<String>? imgUrls;

  ProductModel(
      {this.articleType,
      this.baseColour,
      this.brand,
      this.gender,
      this.id,
      this.masterCategory,
      this.price,
      this.productDisplayName,
      this.saleNumber,
      this.season,
      this.size,
      this.star,
      this.subCategory,
      this.usage,
      this.year,
      this.imgUrls});

  ProductModel.fromJson(Map<String, dynamic> json) {
    articleType = json['articleType'];
    baseColour = json['baseColour'];
    brand = json['brand'];
    gender = json['gender'];
    id = json['id'];
    masterCategory = json['masterCategory'];
    price = json['price'];
    productDisplayName = json['productDisplayName'];
    saleNumber = json['saleNumber'];
    season = json['season'];
    size = json['size'];
    star = json['star'];
    subCategory = json['subCategory'];
    usage = json['usage'];
    year = json['year'];
    imgUrls = json['imgUrls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['articleType'] = this.articleType;
    data['baseColour'] = this.baseColour;
    data['brand'] = this.brand;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['masterCategory'] = this.masterCategory;
    data['price'] = this.price;
    data['productDisplayName'] = this.productDisplayName;
    data['saleNumber'] = this.saleNumber;
    data['season'] = this.season;
    data['size'] = this.size;
    data['star'] = this.star;
    data['subCategory'] = this.subCategory;
    data['usage'] = this.usage;
    data['year'] = this.year;
    data['imgUrls'] = this.imgUrls;
    return data;
  }
}
