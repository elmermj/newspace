import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspace/views/welcome/welcome_controller.dart';
import 'package:rive/rive.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  final String title = "Welcome";
  final String appTitle = "Porto Space";

  @override
  final WelcomeController controller = Get.put(WelcomeController());

  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Get.isDarkMode? const RiveAnimation.asset(
                      'assets/animation/tristructure - white.riv',
                    ):const RiveAnimation.asset(
                      'assets/animation/tristructure.riv',
                    ),
                  ),
                  const Text("News|Space"),
                ],
              ),
            ),
            PageView(
              scrollDirection: Axis.horizontal,
              reverse: false,
              onPageChanged: (index){
                controller.changePage(index);
              },
              controller: PageController(
                initialPage: 0,
                keepPage: false,
                viewportFraction: 1,
              ),
              pageSnapping: true,
              physics: const ClampingScrollPhysics(),
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center( child:Text('Welcome to Newspace')),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child:Text('''
                                  Here you can get any news from around the the world.
                                  Be it from where you live, or anywhere in the world.
                              ''')),
                ),
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack( 
                    children:[
                      const Center(
                        child: Text('We hope you enjoy our app')
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          child: const Text("Get Started"),
                          onPressed: ()=>controller.toEntryView(),
                        ),
                      )
                    ]),
                )
              ],
            ),
            
          ],        
        )
      ),
      bottomNavigationBar: Obx(() => Container(
        height: Get.height*0.1,
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: DotsIndicator(
            position: controller.state.index.value.toDouble(),
            dotsCount: 3,
            reversed: false,
            mainAxisAlignment: MainAxisAlignment.center,
            decorator: DotsDecorator(
              size: const Size(13.5, 9),
              activeSize: const Size(36, 9),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
          ),
        ),
      ),)
    );
  }
}