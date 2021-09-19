import 'package:azlistview/azlistview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/az_list_view/widgets/az_items_model.dart';

class AlphabetScrollList extends StatefulWidget {
  const AlphabetScrollList(
      {Key? key, required this.items, required this.onClickItem})
      : super(key: key);

  final List<String> items;
  final ValueChanged<String> onClickItem;

  @override
  _AlphabetScrollListState createState() => _AlphabetScrollListState();
}

class _AlphabetScrollListState extends State<AlphabetScrollList> {
  List<AZItemModel> items = [];

  @override
  void initState() {
    super.initState();
    initList(widget.items);
  }

  void initList(List<String> items) {
    this.items =
        items.map((item) => AZItemModel(title: item, tag: item[0])).toList();

    //Sorting the unsorted list item
    SuspensionUtil.sortListBySuspensionTag(this.items);
    // item tag only one time top of the items
    SuspensionUtil.setShowSuspensionStatus(this.items);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AzListView(
      padding: EdgeInsets.all(16),
      data: items,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildListItem(items[index]);
      },
      indexBarOptions: IndexBarOptions(
        needRebuild: true,
        indexHintAlignment: Alignment.centerRight,
        indexHintOffset: Offset(-20, 0),
        selectTextStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        selectItemDecoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      ),
      indexBarMargin: EdgeInsets.only(right: 10),
      indexBarItemHeight: 20,
      indexHintBuilder: (context, tag) => Container(
        alignment: Alignment.center,
        height: 60,
        width: 60,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: Text(
          tag,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  Widget _buildListItem(AZItemModel item) {
    final tag = item.getSuspensionTag();

    // item tag only one time top of the items
    final offstage = !item.isShowSuspension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Offstage(offstage: offstage, child: buildHeader(tag)),
        ListTile(
          title: Text(item.title),
          onTap: () => widget.onClickItem(item.title),
        ),
      ],
    );
  }

  Widget buildHeader(String tag) {
    return Container(
      height: 40,
      width: 40,
      color: Colors.grey[200],
      alignment: Alignment.centerLeft,
      child: Center(
        child: Text(
          tag,
          softWrap: false,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
