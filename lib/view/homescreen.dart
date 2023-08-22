import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_app/controller/quotesres_controller.dart';
import 'package:quote_app/controller/themes.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final QuotesController quotecontroler = Get.put(QuotesController());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        quotecontroler.gettodayquote();
        quotecontroler.getallquote();
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quotes 4 u',
          style: TextStyle(
              fontFamily: 'Barriecito',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color.fromARGB(255, 225, 157, 68)),
        ),
        actions: [
          GetBuilder<ThemeController>(
            init: ThemeController(),
            builder: (controler) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Transform.scale(
                  scale: .8,
                  child: Switch(
                    activeColor: const Color.fromARGB(255, 225, 157, 68),
                    thumbIcon:
                        MaterialStateProperty.all(const Icon(Icons.dark_mode)),
                    value: controler.isdark,
                    onChanged: (value) {
                      controler.changetheme(value);
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: GetBuilder<QuotesController>(
        init: QuotesController(),
        builder: (controller) {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("Today's quote",
                          style: TextStyle(
                            fontFamily: 'Barriecito',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                    ),
                    controller.todayquoteload
                        ? getshimmerloading1()
                        : Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 225, 157, 68),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text(
                                    controller.todayquote![0].q!,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        '-- ${controller.todayquote![0].a}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ))
                                ],
                              ),
                            ),
                          ),
                  ],
                )),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'All quotes',
                          style: TextStyle(
                              fontFamily: 'Barriecito',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      controller.allquotesload
                          ? Column(
                              children: [
                                getshimmerloading2(),
                                const SizedBox(
                                  height: 10,
                                ),
                                getshimmerloading2(),
                                const SizedBox(
                                  height: 10,
                                ),
                                getshimmerloading2(),
                                const SizedBox(
                                  height: 10,
                                ),
                                getshimmerloading2(),
                                const SizedBox(
                                  height: 10,
                                ),
                                getshimmerloading2()
                              ],
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: controller.allquotes!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(top: 14),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 249, 242),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(25),
                                              topRight: Radius.circular(25)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              Text(
                                                  controller
                                                      .allquotes![index].q!,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Text(
                                                      '-- ${controller.allquotes![index].a} ',
                                                      style: const TextStyle(
                                                          color: Colors.black)))
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              ),
                            ),
                    ],
                  ),
                )
              ],
            ),
          ));
        },
      ),
    );
  }

  getshimmerloading1() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 213, 213, 213),
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ));
  }

  getshimmerloading2() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 213, 213, 213),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
        ));
  }
}
