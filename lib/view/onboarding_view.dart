import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_chat/view/chat_view.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  ValueNotifier<int> pageIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (_, __, ___) {
            return LiquidSwipe(
              enableLoop: false,
              onPageChangeCallback: (activePageIndex) {
                pageIndex.value = activePageIndex;
              },
              pages: [
                OnboardingItem(
                    index: pageIndex.value,
                    color: Colors.deepPurple,
                    path: '1',
                    itemText:
                        "Get some useful advice on how to improve your life."),
                OnboardingItem(
                    index: pageIndex.value,
                    color: Colors.deepPurpleAccent,
                    path: '2',
                    itemText: "Discuss your problems and get some help."),
                OnboardingItem(
                    index: pageIndex.value,
                    color: Colors.blue[900]!,
                    path: '3',
                    itemText:
                        "Get some help for your mental health and well-being."),
              ],
            );
          }),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String itemText;
  final String path;
  final Color? color;
  final int index;
  const OnboardingItem({
    super.key,
    required this.itemText,
    required this.path,
    required this.index,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: color,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(height: 300, 'asset/image/$path.svg'),
              const SizedBox(height: 16),
              Text(
                textAlign: TextAlign.center,
                itemText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (i) => Container(
                  height: index == i ? 15 : 10,
                  width: index == i ? 15 : 10,
                  margin: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ChatView();
              }));
            },
            icon: const Icon(
              size: 50,
              color: Colors.white,
              Icons.arrow_circle_right,
            ),
          ),
        ),
      ],
    );
  }
}
