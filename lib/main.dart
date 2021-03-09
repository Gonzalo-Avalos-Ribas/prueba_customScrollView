import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'componente_scroll.dart';

void main() {
  runApp(MaterialApp(home: ExampleApp()));
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: CustomScrollView(
            primary: true,
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildListDelegate(
                  [
                    Stack(
                      children: [
                        BackdropFilter(
                          filter: ui.ImageFilter.blur(
                            sigmaX: 10.0,
                            sigmaY: 10.0,
                          ),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          color: Colors.purple,
                          child: Center(
                            child: Text(
                              'texto',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                    minheight: 60,
                    maxheight: 60,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          color: Colors.red[200],
                          child: Text('Search Bar',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0)),
                        ),
                      ),
                    )),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minheight: 100,
                  maxheight: 150,
                  child: Container(
                    color: Colors.white,
                    child: ComponenteScroll(),
                    width: double.infinity,
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 200.0,
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        itemExtent: 300,
                        children: [
                          Container(color: Colors.red[100]),
                          Container(color: Colors.green[100]),
                          Container(color: Colors.orange[100]),
                          Container(color: Colors.yellow[100]),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        itemExtent: 300,
                        children: [
                          Container(color: Colors.red),
                          Container(color: Colors.green),
                          Container(color: Colors.orange),
                          Container(color: Colors.yellow),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        itemExtent: 300,
                        children: [
                          Container(color: Colors.red[800]),
                          Container(color: Colors.green[800]),
                          Container(color: Colors.orange[800]),
                          Container(color: Colors.yellow[800]),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        itemExtent: 300,
                        children: [
                          Container(color: Colors.red[800]),
                          Container(color: Colors.green[800]),
                          Container(color: Colors.orange[800]),
                          Container(color: Colors.yellow[800]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minheight;
  final double maxheight;

  _SliverAppBarDelegate(
      {@required this.minheight,
      @required this.maxheight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build

    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => max(maxheight, minheight);

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}
