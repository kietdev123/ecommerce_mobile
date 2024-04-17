class ProductTypeModel {
  List<String>? genders;
  List<String>? masterCategorys;
  List<String>? subCategorys;

  ProductTypeModel({this.genders, this.masterCategorys, this.subCategorys});

  ProductTypeModel.fromJson(Map<String, dynamic> json) {
    genders = json['genders'].cast<String>();
    masterCategorys = json['masterCategorys'].cast<String>();
    subCategorys = json['subCategorys'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genders'] = this.genders;
    data['masterCategorys'] = this.masterCategorys;
    data['subCategorys'] = this.subCategorys;
    return data;
  }
}
