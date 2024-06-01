// all_product_list.dart
import 'package:e_commerce_flutter/screen/product_details_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../binding/product_details_binding.dart';
import '../controller/product_controller.dart';
import '../core/app_color.dart';
import '../core/skeleton_screen.dart';

class AllProductList extends StatefulWidget {
  const AllProductList({Key? key, required this.controller}) : super(key: key);
  final ProductController controller;

  @override
  _AllProductListState createState() => _AllProductListState();
}

class _AllProductListState extends State<AllProductList> {
  late ProductController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    controller.loadHomeData(); // Load data on init
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isJobDataProcessing.value) {
        return buildSkeleton1(context);
      } else if (controller.lstProduct.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Products Found"),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: controller.lstProduct.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                                () => ProductDetailsScreen(),
                            arguments: controller.lstProduct[index].id,
                            binding: ProductDetailsBinding(),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(controller.lstProduct[index].id.toString())
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              controller.lstProduct[index].title,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.schedule,
                                      size: 16,
                                      color: AppColor.darkGrey,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      controller.lstProduct[index].title,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColor.darkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.lstProduct[index].category.toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: AppColor.darkGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 16,
                                        color: AppColor.darkGrey,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        controller.lstProduct[index].description,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColor.darkGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Obx(() => controller.isMoreDataAvailable.value
                  ? const CircularProgressIndicator()
                  : const SizedBox())
            ],
          ),
        );
      } else {
        return const Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text("No products found"),
            ],
          ),
        );
      }
    });
  }

  Widget buildSkeleton1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 8, right: 8, bottom: 8),
      child: ListView.builder(
        physics: const ScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return const Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                children: [
                  SkeletonContainer.square(
                    width: 50,
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: SkeletonContainer.square(
                            width: 250,
                            height: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    SkeletonContainer.square(
                      width: 90,
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: SkeletonContainer.square(
                        width: 90,
                        height: 10,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: SkeletonContainer.square(
                        width: 90,
                        height: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SkeletonContainer.square(
                    width: 200,
                    height: 10,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SkeletonContainer.square(
                    width: 100,
                    height: 10,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SkeletonContainer.square(
                    width: 120,
                    height: 10,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SkeletonContainer.square(
                    width: 60,
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 270.0),
                    child: SkeletonContainer.square(
                      width: 15,
                      height: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
