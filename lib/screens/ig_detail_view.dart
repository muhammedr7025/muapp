import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:muapp/constants/ig_list.dart';

class IgDetailPage extends StatelessWidget {
  final int id;
  const IgDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IG Details'),
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
                  Text(
                    igList[id]['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      igList[id]['description'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
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
                await Future.delayed(const Duration(seconds: 2));
                controller.success(); //starts success animation
                await Haptics.vibrate(HapticsType.success);

                await Future.delayed(const Duration(seconds: 1));

                controller.reset(); //resets the slider
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 38.0),
                child: Text(
                  'Slide to explore Learning circle',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
