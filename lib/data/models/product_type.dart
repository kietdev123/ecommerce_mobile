class ProductTypeModel {
  List<String>? genders;
  List<String>? masterCategorys;
  List<String>? subCategorys;
  List<String>? menUrls;
  List<String>? womenUrls;
  List<String>? boysUrls;
  List<String>? girlsUrls;
  List<String>? unisexUrls;

  ProductTypeModel(
      {this.genders,
      this.masterCategorys,
      this.subCategorys,
      this.menUrls,
      this.womenUrls,
      this.boysUrls,
      this.girlsUrls,
      this.unisexUrls});

  ProductTypeModel.fromJson(Map<String, dynamic> json) {
    genders = json['genders'].cast<String>();
    masterCategorys = json['masterCategorys'].cast<String>();
    subCategorys = json['subCategorys'].cast<String>();
    menUrls = json['MenUrls'].cast<String>();
    womenUrls = json['WomenUrls'].cast<String>();
    boysUrls = json['BoysUrls'].cast<String>();
    girlsUrls = json['GirlsUrls'].cast<String>();
    unisexUrls = json['UnisexUrls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genders'] = this.genders;
    data['masterCategorys'] = this.masterCategorys;
    data['subCategorys'] = this.subCategorys;
    data['MenUrls'] = this.menUrls;
    data['WomenUrls'] = this.womenUrls;
    data['BoysUrls'] = this.boysUrls;
    data['GirlsUrls'] = this.girlsUrls;
    data['UnisexUrls'] = this.unisexUrls;
    return data;
  }
}
