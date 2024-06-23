import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:muapp/screens/widget/lc_card.dart';
import 'package:provider/provider.dart';

import '../core/notifier/ig_list_notifier.dart';

class LcCardPage extends StatefulWidget {
  const LcCardPage({super.key});

  @override
  State<LcCardPage> createState() => _LcCardPageState();
}

class _LcCardPageState extends State<LcCardPage> {
  @override
  Widget build(BuildContext context) {
    final CardSwiperController controller = CardSwiperController();

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
            Consumer<ICNotifier>(
              builder: (context, snapshot,_) {
                return snapshot.getIsLoading ?  const Flexible(child: CircularProgressIndicator()) : Flexible(
                  child: CardSwiper(
                    controller: controller,
                    onSwipe: (previousIndex,currentIndex,direction){
                      return onSwipe(previousIndex, currentIndex, direction,snapshot);
                    },
                    onUndo: _onUndo,
                    isLoop: false,
                    allowedSwipeDirection: const AllowedSwipeDirection.symmetric(horizontal: true),
                    maxAngle: 30,
                    cardsCount: snapshot.getIcModel?.response.data.length ?? 0,
                    cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
                          final data =  snapshot.getIcModel?.response.data[index];
                          return LcCard(karma: (data?.karma ?? 0).toString() ,title: data?.igName ?? "",memberCount: (data?.memberCount ?? 0).toString() ,);
                        },
                  ),
                );
              }
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () => controller.swipe(CardSwiperDirection.left),
                    child: const Text('Reject'),
                  ),
                  FloatingActionButton(
                    onPressed: controller.undo,
                    child: const Icon(Icons.rotate_left),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        controller.swipe(CardSwiperDirection.right),
                    child: const Text('Accept'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
    ICNotifier snapshot
  ) {
    if (currentIndex == (snapshot.getIcModel?.response.data.length ?? 0) - 1 && snapshot.getIcModel?.response.pagination.isNext == true) {
     snapshot.igList(context: context, ig: snapshot.getIG ?? "", district: snapshot.getDistrict ?? "",pageIndex: snapshot.getIcModel?.response.pagination.nextPage??1);
      print("next page");
    }
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
