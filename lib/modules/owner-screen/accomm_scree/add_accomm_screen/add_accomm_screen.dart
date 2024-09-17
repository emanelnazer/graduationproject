import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';

import '../../../../shared/component/components.dart';

class AddAccommindationScreen extends StatelessWidget {
  const AddAccommindationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit,OwnerState>(
        builder: (context,state){
          var productionFarmController = TextEditingController();
          var addressController       = TextEditingController();
          var locationController       = TextEditingController();
            var phoneController       = TextEditingController();
          var priceController       = TextEditingController();
          var cubit=OwnerCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [


                      Card(
                        elevation: 22.0,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(

                          children: [


                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image(
                                  image: NetworkImage(
                                    'https://thumbs.dreamstime.com/b/add-photo-line-icon-image-thumbnail-sign-picture-placeholder-symbol-quality-design-element-linear-style-editable-stroke-vector-219079541.jpg',
                                  ),
                                  width: double.infinity,
                                  height: 250.0,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'أضف صورة للايواء',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      BuildDropBottom(
                        dropdownButtonTitle: 'اختر',
                        function: (newValue)
                        {
                          cubit.dropDownButtonType(newValue);
                        },
                        items: ['بوكس فاضي', 'البوكس +الرعايه الطبيه', 'البوكس + الرعاية +الاكل', 'الحوافر و قص الشعر',].map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                        value: cubit.valueChooseType,
                      ),
                      SizedBox(height: 20.0,),
                      defaultFormField(
                          controller: priceController,
                          type: TextInputType.number,
                          validator: (value){
                            if(value.isEmpty){
                              return 'السعر مطلوب';
                            }
                            return null;
                          },
                          label: 'من فضلك ادخل السعر',
                          prefixIcon: Icons.price_check),
                      SizedBox(height: 20.0,),
                      defaultFormField(
                          controller: productionFarmController,
                          type: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'يرجي ادخال البيانات  ';
                            }
                            return null;
                          },
                          label: 'معلومات عامة عن المزرعة و خدمات الايواء ',
                          prefixIcon: Icons.info),


                      SizedBox(height: 20.0,),

                      defaultFormField(
                          controller: addressController,
                          type: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'يرجي ادخال البيانات  ';
                            }
                            return null;
                          },
                          label: 'العنوان ',
                          prefixIcon: Icons.location_on),

                      SizedBox(height: 20.0,),

                      defaultFormField(
                          controller: locationController,
                          type: TextInputType.url,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'يرجي ادخال البيانات  ';
                            }
                            return null;
                          },
                          label: 'الموقع الجغرافي ( location ) ',
                          prefixIcon: Icons.location_on),


                      SizedBox(height: 20.0,),

                      defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'يرجي ادخال البيانات  ';
                            }
                            return null;
                          },
                          label: ' رقم الهاتف ',
                          prefixIcon: Icons.phone),

                      SizedBox(height: 20.0,),

                      defaultButton(
                          function: (){},
                          text: 'Add')




                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context,state){});
  }
}
