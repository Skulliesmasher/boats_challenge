import 'package:boats_challenge/models/boat.dart';
import 'package:boats_challenge/ui/widgets/boat_card.dart';
import 'package:flutter/material.dart';

import 'boat_specs_page.dart';

class BoatListPage extends StatefulWidget {
  @override
  _BoatListPageState createState() => _BoatListPageState();
}

class _BoatListPageState extends State<BoatListPage> {
  PageController _pageController;
  double _page;
  bool _hideAppBar;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: .7);
    _pageController.addListener(_pageListener);
    _page = 0.0;
    _hideAppBar = false;
    super.initState();
  }

  void _pageListener() {
    _page = _pageController.page;
    setState(() {});
  }

  void _openSpecsPage(BuildContext context, Boat boat) async {
    setState(() {
      _hideAppBar = true;
    });
    await Navigator.push(
        context,
        PageRouteBuilder(
          reverseTransitionDuration: const Duration(milliseconds: 800),
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: BoatSpecsPage(boat: boat),
            );
          },
        ));
    setState(() {
      _hideAppBar = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 600),
              transform:
                  Matrix4.translationValues(0, _hideAppBar ? -100 : 0, 0),
              child: AnimatedOpacity(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 600),
                opacity: _hideAppBar ? 0 : 1,
                child: const _CustomAppBar(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          //------------------------------------
          // Boat Page View
          //------------------------------------
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: Boat.listBoats.length,
              itemBuilder: (context, index) {
                final boat = Boat.listBoats[index];
                final factorChange = (_page - index).abs();
                return BoatCard(
                  boat: boat,
                  onTapSpec: () => _openSpecsPage(context, boat),
                  factorChange: factorChange,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Boats",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.grey[800],
              iconSize: 40,
            )
          ],
        ),
      ),
    );
  }
}
