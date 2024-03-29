import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/add_business/controller/AddBusinessController.dart';

final AddBusinessController addBusinessController =
    Get.put(AddBusinessController());
final CustomTheme theme = CustomTheme();

class AddBusiness extends StatelessWidget {
  const AddBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Add your business"),
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Spacer(),
                        const Text(
                          "Add your business",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Adding your business allows us to \n customize your experience",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Business name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        Obx(
                          () => TextField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: theme.orange)),
                                errorText: addBusinessController
                                        .businessNameError.isNotEmpty
                                    ? addBusinessController
                                        .businessNameError.value
                                    : null),
                            cursorColor: theme.orange,
                            keyboardType: TextInputType.name,
                            controller:
                                addBusinessController.businessNameController,
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Category",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        Obx(() => DropdownButtonFormField(
                            decoration: InputDecoration(
                              errorText: addBusinessController
                                      .dropDownError.isNotEmpty
                                  ? addBusinessController.dropDownError.value
                                  : null,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: theme.orange)),
                            ),
                            value: addBusinessController.dropDownValue.value,
                            items:
                                addBusinessController.items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              addBusinessController.onChanged(newValue!);
                            })),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Location",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                        Obx(
                          () => TextField(
                            decoration: InputDecoration(
                              errorText: addBusinessController
                                      .locationError.isNotEmpty
                                  ? addBusinessController.locationError.value
                                  : null,
                              suffixIconColor: theme.orange,
                              suffixIcon:
                                  const Icon(Icons.add_location_outlined),
                              hintText: "Pin",
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: theme.orange)),
                            ),
                            cursorColor: theme.orange,
                            keyboardType: TextInputType.name,
                            controller:
                                addBusinessController.locationController,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "Open in maps",
                              style: TextStyle(
                                  color: theme.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() => CustomButton(
                            isLoading: addBusinessController.isLoading.value,
                            title: "Add",
                            onClick: () {
                              addBusinessController.addBusiness();
                            })),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
