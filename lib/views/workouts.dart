import 'package:flutter/material.dart';
import 'package:workouts_app/utils/big_app_text.dart';

class Workouts extends StatefulWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> with TickerProviderStateMixin {
  List weeks = [
    "WEEK 1",
    "WEEK 2",
    "WEEK 3",
  ];

  List<Widget> myTabs = [];
  List<Widget> myTabsContent = [];

  late TabController myTabController;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < weeks.length; i++) {
      myTabs.add(Text(weeks[i]));
      myTabsContent.add(Text(weeks[i]));
    }
    var lastIndex = myTabs.length - 1;
    myTabController = TabController(
        vsync: this, length: myTabs.length, initialIndex: lastIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 70,
            ),
            child: Row(
              children: [
                const Icon(Icons.music_note_sharp,
                    size: 30, color: Color.fromARGB(136, 21, 207, 182)),
                Expanded(child: Container()),
                const Text("M",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 247, 190, 2),
                    )),
                Expanded(child: Container()),
                const Icon(Icons.circle_outlined,
                    size: 30, color: Color.fromARGB(136, 21, 207, 182)),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                controller: myTabController,
                labelColor: const Color.fromARGB(255, 247, 190, 2),
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                indicatorColor: const Color.fromARGB(255, 247, 190, 2),
                tabs: myTabs.toList()),
          ),
          SizedBox(
            width: double.maxFinite,
            height: 300,
            child: TabBarView(
                controller: myTabController, children: myTabsContent.toList()),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
