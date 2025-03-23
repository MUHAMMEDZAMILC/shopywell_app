// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';
import '../../model/idvalue.dart';
import '../../view/components/apptext.dart';
import '../../view/components/apptextfeild.dart';
import '../utils/theme/colors.dart';
import '../utils/theme/dimensions.dart';
import 'pagenavigator.dart';

Future getDropDownData(
  BuildContext context, {
  required TextEditingController controller,
  required String title,
  bool isMultiselect = false,
  bool searchbar = false,
  List<IdValue>? list,
  Function(IdValue selectedOption)? onOptionSelected,
  Function(String selectedIds)? onMultipleOptionSelected,
}) async {
 
  showOptionsSheet(context,
      searchbar: searchbar,
      title: title,
      list: list??[],
      isMultiselect: isMultiselect, onTap: (option) {
    controller.text = option.value!;
    if (onOptionSelected != null) {
      onOptionSelected(option);
    }
  }, onMultiSelect: (option, selectedIds) {
    controller.text = option;
    onMultipleOptionSelected!(selectedIds);
  });
}




List<IdValue> _foundUsers = [];
TextEditingController searchCtrl = TextEditingController();
void showOptionsSheet(BuildContext context,
    {required List<IdValue> list,
    bool isMultiselect = false,
    bool isMandatory = false,
    bool searchbar = false,
    required void Function(IdValue option) onTap,
    required void Function(String option, String selectedIds) onMultiSelect,
    required String title}) {
  showModalBottomSheet(
      enableDrag: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
      backgroundColor: ColorResources.WHITE,
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (_) {
        return StatefulBuilder(builder: (context, setState) {
          void runFilter(String enteredKeyword) {
            _foundUsers.clear();
            if (enteredKeyword.isEmpty) {
              setState(() {});
              return;
            }

            for (var userDetail in list) {
              if (userDetail.value!
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase())) {
                setState(() {
                  _foundUsers.add(userDetail);
                });
              }
            }

            setState(() {});
          }

          return Column(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: title, size: 20,color: ColorResources.WHITE,weight: FontWeight.w600,letterspace: 0.5,),
                    IconButton(
                        onPressed: () {
                          _foundUsers.length = 0;
                          runFilter('');
                          Screen.closeDialog(context);
                        },
                        icon: const Icon(Icons.close))
                  ]),
            ),
            (searchbar == true)
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding),
                  child: AppTextFeild(controller: searchCtrl,hinttext: 'Search',suffix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:  8.0),
                    child: Icon(CupertinoIcons.search,color: ColorResources.ICONCOLOR,),
                  ),onChanged: (value) => runFilter(value),),
                )
                : 0.hBox,
            // Expanded(
            //   child: ListView.separated(
            //     itemBuilder: (context, index) {
            //       final option = list[index];
            //       return isMultiselect
            //           ? CheckboxListTile(
            //               controlAffinity: ListTileControlAffinity.leading,
            //               value: option.isSelected,
            //               onChanged: (value) {
            //                 setState(() {
            //                   option.isSelected = value ?? false;
            //                 });
            //               },
            //               title: AppText(text: option.value ?? ''),
            //             )
            //           : ListTile(
            //               title: AppText(text: option.value ?? ''),
            //               onTap: () {
            //                 onTap(option);
            //                 Screen.closeDialog(context);
            //               });
            //     },
            //     itemCount: list.length,
            //     separatorBuilder: (BuildContext context, int index) =>
            //         Divider(color: Colors.black),
            //   ),
            // ),
            Expanded(
              child: (_foundUsers.isEmpty)
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        final option = list[index];
                        return isMultiselect
                            ? CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: option.selected,
                                onChanged: (value) {
                                  setState(() {
                                    option.selected = value ?? false;
                                  });
                                },
                                title: AppText(
                                  text: option.value ?? '',
                                  weight: FontWeight.w500,
                                  color: ColorResources.WHITE,
                                ),
                              )
                            : ListTile(
                                title: AppText(
                                    text: option.value ?? '',
                                    color: ColorResources.WHITE,
                                    weight: FontWeight.w500),
                                onTap: () {
                                  onTap(option);
                                  _foundUsers.length = 0;
                                  runFilter('');
                                  Screen.closeDialog(context);
                                });
                      },
                      itemCount: list.length,
                      separatorBuilder: (BuildContext context, int index) =>
                           Divider(height: 0, color: ColorResources.ICONCOLOR.withOpacity(0.3)),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        final option = _foundUsers[index];
                        return isMultiselect
                            ? CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: option.selected,
                                onChanged: (value) {
                                  setState(() {
                                    option.selected = value ?? false;
                                  });
                                },
                                title: AppText(
                                    text: option.value ?? '',
                                    color: ColorResources.WHITE,
                                    weight: FontWeight.w500),
                              )
                            : ListTile(
                                title: AppText(
                                    text: option.value ?? '',
                                    color: ColorResources.WHITE,
                                    weight: FontWeight.w500),
                                onTap: () {
                                  onTap(option);
                                  _foundUsers.length = 0;
                                  runFilter('');
                                  Screen.closeDialog(context);
                                });
                      },
                      itemCount: _foundUsers.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(height: 0, color: Color(0x692E2D2D)),
                    ),
            ),
            //Button
            isMultiselect
                ? Padding(
                  padding: const EdgeInsets.only(bottom:15.0),
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                        onPressed: () {
                          String selectedValue = "";
                          String passingValue = "";
                          _foundUsers.length = 0;
                          runFilter('');
                          for (var element in list) {
                            if (element.selected == true) {
                              passingValue = passingValue.isEmpty
                                  ? element.id!
                                  : "$passingValue,${element.id!}";
                              selectedValue = selectedValue.isEmpty
                                  ? element.value!
                                  : "$selectedValue,${element.value!}";
                            }
                          }
                    
                          onMultiSelect(selectedValue, passingValue);
                          Screen.closeDialog(context);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                const WidgetStatePropertyAll(ColorResources.PRIMARYCOLOR),
                            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            )),
                            padding: const WidgetStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 8.0))),
                        child: AppText(
                          text: "OK",
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                  ),
                )
                : 0.wBox
          ]);
        });
      });
}
