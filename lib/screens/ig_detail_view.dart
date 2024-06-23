import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:muapp/constants/ig_list.dart';
import 'package:muapp/core/notifier/ig_list_notifier.dart';
import 'package:provider/provider.dart';

class IgDetailPage extends StatelessWidget {
  final int id;
  const IgDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    void navNextPage() {
      Navigator.pushNamed(
        context,
        '/lccard',
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('IG Details',
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins-Bold')),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Center(
                        child: Image.asset(igList[id]
                            ['image']), // Ensure the image path is correct
                      ),
                    ),
                  ),
                  Text(igList[id]['title'],
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins-Bold')),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      igList[id]['description'],
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ActionSlider.standard(
              sliderBehavior: SliderBehavior.stretch,
              width: 350.0,
              height: 75,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 25,
              ),
              backgroundColor: Colors.white,
              toggleColor: const Color(0xFFD5C6E7),
              action: (controller) async {
                controller.loading(); //starts loading animation
                await context.read<ICNotifier>().igList(context: context, ig: igList[id]['apiid'], district: "thiruvanthapuram");
                controller.success(); //starts success animation
                await Haptics.vibrate(HapticsType.success);
                navNextPage();
                await Future.delayed(const Duration(seconds: 1));
                controller.reset(); //resets the slider
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 38.0, top: 3),
                child: Text('Slide to explore Learning circle',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'Poppins')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
