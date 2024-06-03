import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:muapp/screens/widget/lc_card.dart';

class LcCardPage extends StatefulWidget {
  const LcCardPage({super.key});

  @override
  State<LcCardPage> createState() => _LcCardPageState();
}

class _LcCardPageState extends State<LcCardPage> {
  @override
  Widget build(BuildContext context) {
    final CardSwiperController controller = CardSwiperController();
    List<LcCard> cards = const [
      LcCard(
        txt: '1',
        clr: Colors.blue,
      ),
      LcCard(
        txt: '2',
        clr: Colors.yellow,
      ),
      LcCard(
        txt: '3',
        clr: Colors.green,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('LC Lists'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                isLoop: false,
                allowedSwipeDirection:
                    const AllowedSwipeDirection.symmetric(horizontal: true),
                maxAngle: 30,
                cardsCount: cards.length,
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) =>
                        cards[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () => controller.swipe(CardSwiperDirection.left),
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),
                  FloatingActionButton(
                    onPressed: controller.undo,
                    child: const Icon(Icons.rotate_left),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        controller.swipe(CardSwiperDirection.right),
                    child: const Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
