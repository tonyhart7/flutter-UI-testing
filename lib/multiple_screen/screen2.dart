import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) => Container(
          color: Colors.red,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('$index'),
            ),
          )),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
