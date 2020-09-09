import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NestedScrollModal extends StatelessWidget {
  final ScrollController scrollController;

  const NestedScrollModal({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: ScrollController(),
      physics: ScrollPhysics(parent: PageScrollPhysics()),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(height: 300, color: Colors.blue),
              ],
            ),
          ),
        ];
      },
      body: ListView.builder(
        physics: BottomModalScrollPhysics(),
        controller: scrollController,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            color: index.isOdd ? Colors.green : Colors.orange,
          );
        },
        itemCount: 12,
      ),
    );
  }
}
