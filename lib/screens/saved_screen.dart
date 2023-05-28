import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../consts/global_colors.dart';
import '../widgets/feeds_widget.dart';
import 'package:group_list_view/group_list_view.dart';

Map<String, List> _elements = {
  'Danh sach 1 ': ['Mojito', 'Old Fashioned', 'Long Island Tea'],
  'Danh sach 2': ['Negroni', 'Whiskey Sour'],
  'Danh sach 3': [
    'Cocktail Horse’s Neck',
    'Farrah Parkes',
    'Fay Lawson',
    'Asif Mckay'
  ],
  'Danh sach 4': [
    'Casey Zuniga',
    'Ayisha Burn',
    'Josie Hayden',
    'Kenan Walls',
    'Mario Powers'
  ],
  'Danh sach 5': ['Toyah Downs', 'Tyla Kane', 'Toyah Downs'],
};

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Saved',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Saved'),
          centerTitle: true,
        ),
        body: GroupListView(
          sectionsCount: _elements.keys.toList().length,
          countOfItemInSection: (int section) {
            return _elements.values.toList()[section].length;
          },
          itemBuilder: _itemBuilder,
          groupHeaderBuilder: (BuildContext context, int section) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                _elements.keys.toList()[section],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, IndexPath index) {
    String user = _elements.values.toList()[index.section][index.index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 8,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
          leading: CircleAvatar(
            child: Text(
              _getInitials(user),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            // backgroundColor: _getAvatarColor(user),
          ),
          title: Text(
            _elements.values.toList()[index.section][index.index],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          trailing: Icon(Icons.delete),
        ),
      ),
    );
  }

  String _getInitials(String user) {
    var buffer = StringBuffer();
    var split = user.split(" ");
    for (var s in split) buffer.write(s[0]);

    return buffer.toString().substring(0, split.length);
  }

  // Color _getAvatarColor(String user) {
  //   return AppColors
  //       .avatarColors[user.hashCode % AppColors.avatarColors.length];
  // }
}
