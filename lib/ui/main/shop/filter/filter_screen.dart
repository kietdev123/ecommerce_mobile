import 'package:ecommerce_mobile/res/resources.dart';
import 'package:ecommerce_mobile/ui/main/shop/filter/widgets/filter_item_card.dart';
import 'package:ecommerce_mobile/ui/main/shop/filter/widgets/filter_item_title.dart';
import 'package:ecommerce_mobile/ui/widgets/custom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class FilterScreen extends StatefulWidget {
  static const String id = "filter_screen";
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomAppBarDelegate(title: 'Filters'),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilterItemTitle(title: 'Price range'),
              FilterItemCard(
                child: RangeSlider(
                  activeColor: resource.color.colorPrimary,
                  // inactiveColor: resource.color.colorPrimary,
                  values: _currentRangeValues,
                  max: 100,
                  // divisions: 5,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
              ),
              const FilterItemTitle(title: 'Colors'),
              FilterItemCard(
                child: GroupButton(
                  options: GroupButtonOptions(
                      mainGroupAlignment: MainGroupAlignment.spaceBetween),
                  isRadio: false,
                  onSelected: (index, isSelected, value) {
                    print('$index button is selected');
                  },
                  buttons: ["black", "grey", "red", "grey", "brown", "blue"],
                  buttonBuilder: (isSelect, value, context) {
                    Color color = Colors.white;
                    if (value == "black") color = Colors.black;
                    if (value == "grey") color = Colors.grey;
                    if (value == "red") color = Colors.red;
                    if (value == "grey") color = Colors.grey;
                    if (value == "brown") color = Colors.brown;
                    if (value == "blue") color = Colors.blue;
                    return Container(
                      decoration: (isSelect)
                          ? BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                  width: 1, //
                                  color: Colors.red),
                            )
                          : null,
                      child: Container(
                        width: 32,
                        height: 32,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    );
                  },
                ),
              ),
              const FilterItemTitle(title: 'Sizes'),
              FilterItemCard(
                child: GroupButton(
                  options: GroupButtonOptions(
                    selectedShadow: const [],
                    selectedTextStyle: TextStyle(
                      // fontSize: 20,
                      color: Colors.white,
                    ),
                    selectedColor: Colors.amber,
                    unselectedShadow: const [],
                    unselectedColor: Colors.white,
                    unselectedTextStyle: TextStyle(
                      // fontSize: 20,
                      color: Colors.black,
                    ),
                    // selectedBorderColor: Colors.amber,
                    unselectedBorderColor: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    spacing: 10,
                    runSpacing: 10,
                    groupingType: GroupingType.wrap,
                    direction: Axis.horizontal,
                    buttonHeight: 36,
                    buttonWidth: 36,
                    mainGroupAlignment: MainGroupAlignment.start,
                    crossGroupAlignment: CrossGroupAlignment.start,
                    groupRunAlignment: GroupRunAlignment.start,
                    textAlign: TextAlign.center,
                    textPadding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    // elevation: 0,
                  ),
                  isRadio: false,
                  onSelected: (index, isSelected, value) {
                    print('$index button is selected');
                  },
                  buttons: ["XS", "S", "M", "L", "XL"],
                ),
              ),
              const FilterItemTitle(title: 'Category'),
              FilterItemCard(
                child: GroupButton(
                  options: GroupButtonOptions(
                    selectedShadow: const [],
                    selectedTextStyle: TextStyle(
                      // fontSize: 20,
                      color: Colors.white,
                    ),
                    selectedColor: Colors.amber,
                    unselectedShadow: const [],
                    unselectedColor: Colors.white,
                    unselectedTextStyle: TextStyle(
                      // fontSize: 20,
                      color: Colors.black,
                    ),
                    // selectedBorderColor: Colors.amber,
                    unselectedBorderColor: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    spacing: 10,
                    runSpacing: 10,
                    groupingType: GroupingType.wrap,
                    direction: Axis.horizontal,
                    buttonHeight: 36,
                    buttonWidth: 100,
                    mainGroupAlignment: MainGroupAlignment.spaceBetween,
                    crossGroupAlignment: CrossGroupAlignment.start,
                    groupRunAlignment: GroupRunAlignment.start,
                    textAlign: TextAlign.center,
                    textPadding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    // elevation: 0,
                  ),
                  isRadio: false,
                  onSelected: (index, isSelected, value) {
                    print('$index button is selected');
                  },
                  buttons: ["All", "Women", "Men", "Boys", "Girls"],
                ),
              ),
              const FilterItemTitle(title: 'Brand'),
              FilterItemCard(
                child: Text(';'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          width: double.infinity,
          height: 100,
          padding: EdgeInsets.only(left: 24, right: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Discard')),
              ElevatedButton(onPressed: () {}, child: Text('Apply')),
            ],
          )),
    );
  }
}
