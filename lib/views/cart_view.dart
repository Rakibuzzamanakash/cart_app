import 'package:cart_app/model_view/cart_model_view.dart';
import 'package:cart_app/resources/app_assets/app_assets.dart';
import 'package:cart_app/resources/app_collors/app_colors.dart';
import 'package:cart_app/resources/app_strings/app_strings.dart';
import 'package:cart_app/resources/dimension/app_dimension.dart';
import 'package:cart_app/utils/style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/response/status.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    final appHeight = AppDimension(context).height;
    final appWidth = AppDimension(context).width;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          width: double.infinity,
          height: appHeight * .22,
          decoration: const BoxDecoration(
              color: AppColors.appOrangeGrayColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              )),
          child: Obx(() {
            switch (itemController.rxRequestStatus.value) {
              case Status.loading:
                return const Center(
                  child: Center(child: CircularProgressIndicator()),
                );
              case Status.error:
                return Text(itemController.error.toString());

              case Status.completed:
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.subtotal,
                          style: TextStyles.fontStyle10,
                        ),
                        Text(
                          "\$${itemController.totalPrice}",
                          style: TextStyles.fontStyle9,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.servIncluded,
                            style: TextStyles.fontStyle11,
                          ),
                          Text(
                            "\$${itemController.totalVAT}",
                            style: TextStyles.fontStyle8,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Divider(
                        height: 3,
                        color: AppColors.appOrangeColor1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.total,
                          style: TextStyles.fontStyle10,
                        ),
                        Text(
                          "\$${itemController.totalPriceWithVAT}",
                          style: TextStyles.fontStyle9,
                        ),
                      ],
                    ),
                  ],
                );
            }
          }),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.appGrayColor2,
                      border: Border.all(
                          color: AppColors.appOrangeGrayColor, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Container(
                        height: AppDimension(context).height * .07,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                AppColors.appOrangeColor1,
                                AppColors.appOrangeColor2
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.breakfast,
                                    style: TextStyles.fontStyle1,
                                  ),
                                  Image.asset(AppAssets.arrowUpIcon)
                                ],
                              ),
                              Text(
                                AppStrings.vat5,
                                style: TextStyles.fontStyle2,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(() {
                        switch (itemController.rxRequestStatus.value) {
                          case Status.loading:
                            return const Center(
                              child: Center(child: CircularProgressIndicator()),
                            );
                          case Status.error:
                            return Text(itemController.error.toString());

                          case Status.completed:
                            return ListView.builder(
                                itemCount:
                                    itemController.itemList.value.menu!.length,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final value = itemController
                                      .itemList.value.menu![index];

                                  final item = MenuItems(
                                    id: value.id,
                                    name: value.name,
                                    description: value.description,
                                    image: value.image,
                                    discountPrice: value.discountPrice,
                                    price: value.price,
                                  );

                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 10),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: AppDimension(context).height *
                                              .09,
                                          // color: Colors.green,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              DottedBorder(
                                                borderType: BorderType.RRect,
                                                radius:
                                                    const Radius.circular(8),
                                                strokeWidth: 1,
                                                dashPattern: const [4, 2],
                                                color:
                                                    AppColors.appOrangeColor2,
                                                child: Container(
                                                  width: appWidth * .19,
                                                  height: appHeight * .09,
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .appOrangeGrayColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Center(
                                                    child: CircleAvatar(
                                                      radius: 27,
                                                      backgroundImage:
                                                          NetworkImage(value
                                                              .image
                                                              .toString()),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: appWidth * .41,
                                                // color: Colors.orange,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0,
                                                              bottom: 5),
                                                      child: Text(
                                                        value.name.toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyles
                                                            .fontStyle4,
                                                      ),
                                                    ),
                                                    Text(
                                                      value.description
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style:
                                                          TextStyles.fontStyle3,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Obx(() {
                                                bool isInCart = itemController
                                                    .isItemInCart(item);
                                                return SizedBox(
                                                  width: appWidth * .16,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 8.0,
                                                                bottom: 5),
                                                        child: Text(
                                                          value.price
                                                              .toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyles
                                                              .fontStyle7,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      isInCart
                                                          ? InkWell(
                                                              onTap: () {},
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            2),
                                                                    border: Border.all(
                                                                        color: AppColors
                                                                            .appOrangeColor1)),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15,
                                                                      vertical:
                                                                          2),
                                                                  child: Text(
                                                                    "- 9 +",
                                                                    style: TextStyles
                                                                        .fontStyle6,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : InkWell(
                                                              onTap: () {
                                                                //print(itemController.cartItems[0].id);
                                                                itemController.addToCart(MenuItems(
                                                                    price: value
                                                                        .price,
                                                                    id: value
                                                                        .id!
                                                                        .toInt()));
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            2),
                                                                    border: Border.all(
                                                                        color: AppColors
                                                                            .appOrangeColor1)),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15,
                                                                      vertical:
                                                                          2),
                                                                  child: Text(
                                                                    AppStrings
                                                                        .add,
                                                                    style: TextStyles
                                                                        .fontStyle6,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                    ],
                                                  ),
                                                );
                                              }),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          children: [
                                            Transform.rotate(
                                              angle: 45 *
                                                  (3.141592653589793238 / 180),
                                              child: Container(
                                                height: 5,
                                                width: 5,
                                                color:
                                                    AppColors.appOrangeColor2,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Flexible(
                                              child: DottedLine(
                                                lineThickness: 1.0,
                                                lineLength: double.infinity,
                                                dashLength: 3,
                                                dashGradient: const [
                                                  AppColors.appOrangeColor1,
                                                  AppColors.appOrangeColor2
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Transform.rotate(
                                              angle: 45 *
                                                  (3.141592653589793238 / 180),
                                              child: Container(
                                                height: 5,
                                                width: 5,
                                                color:
                                                    AppColors.appOrangeColor2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                        }
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
