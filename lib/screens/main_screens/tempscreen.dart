import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:stock_math_final/services/stocks/stocks.dart';
import 'package:stock_math_final/services/stocks/templist.dart';
class Tempscreen extends StatefulWidget {
  const Tempscreen({super.key});

  @override
  State<Tempscreen> createState() => _TempscreenState();
}

class _TempscreenState extends State<Tempscreen> {
  String? _string;
  TextEditingController controller = TextEditingController();
  TextEditingController search = TextEditingController();
  List<String> names = stockList.map((e) => e['stock'] ?? '').toList();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text('Hello'),
              items: names.map((String item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              )).toList(),
              value: _string,
              onChanged: (String? value){
                setState(() {
                  _string = value;
                });
              },
              buttonStyleData: ButtonStyleData(
                height: 0.045 * screenHeight,

              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 300,
                width: 0.9 * screenWidth,
                scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(30),
                    thickness: WidgetStateProperty.all(3),
                    thumbVisibility: WidgetStateProperty.all(true)
                ),
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: search,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: search,
                    decoration: InputDecoration(
                      hintText: 'Search'
                    ),
                  ),
                ),
                searchMatchFn: (item,searchValue){
                  return item.value.toString().contains(searchValue);
                }
              ),
              onMenuStateChange: (isOpen){
                if(!isOpen){
                  search.clear();
                }
              },

            ),
          )
        ),
      ),
    );
  }
}
