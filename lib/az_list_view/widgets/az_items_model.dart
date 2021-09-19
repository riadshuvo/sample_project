
import 'package:azlistview/azlistview.dart';

class AZItemModel extends ISuspensionBean{
  final String title;
  final String tag;

  AZItemModel({required this.title, required this.tag});

  @override
  String getSuspensionTag() => tag;
}