import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:microzaim/src/presentation/welcome/views/bank_view.dart';
import 'package:microzaim/src/presentation/welcome/views/book_view.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.onCloseWelcomePage})
      : super(key: key);

  final void Function() onCloseWelcomePage;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  late List<Widget> _listOfViews;

  int _currentIndex = 0;

  @override
  void initState() {
    _listOfViews = [
      BankView(
        onContinue: () {
          _currentIndex = 1;
          _pageController.animateToPage(_currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        },
      ),
      BookView(
        onContinue: () {
          AutoRouter.of(context).replaceNamed("/home-page");
        },
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex == 0
                      ? const SizedBox.shrink()
                      : GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: const SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xFF0F3F15),
                            ),
                          ),
                        ),
                  const SizedBox.shrink(),
                  GestureDetector(
                    onTap: () {
                      widget.onCloseWelcomePage();
                    },
                    child: const SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.close,
                        size: 30,
                        color: Color(0xFF0F3F15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                _listOfViews.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: InkWell(
                        onTap: () {
                          _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Card(
                          color: _currentIndex == index
                              ? const Color(0xFF0F3F15)
                              : const Color(0xFFD9D9D9),
                          child: const SizedBox(
                            width: 40,
                            height: 3,
                          ),
                        ),
                      ),
                    )),
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              controller: _pageController,
              itemCount: _listOfViews.length,
              itemBuilder: (BuildContext context, int index) {
                return _listOfViews[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
