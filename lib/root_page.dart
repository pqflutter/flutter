import 'package:flutter/material.dart';
import 'package:pq_flutter/routes.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Item> panelList = [];

  @override
  void initState() {
    _buildPanelList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Demo")),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expandedHeaderPadding: const EdgeInsets.symmetric(horizontal: 10),
          expansionCallback: (index, isOpen) {
            setState(() {
              panelList[index].isExpanded = !isOpen;
            });
          },
          children: panelList.map((e) {
            return ExpansionPanel(
              headerBuilder: (context, isOpen) => e.title,
              isExpanded: e.isExpanded,
              canTapOnHeader: true,
              body: Column(
                children: e.children,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _buildPanelList() {
    _item(String text, VoidCallback onTap) {
      return ListTile(
        onTap: onTap,
        title: Text(text),
      );
    }

    final animatedItem = Item(
        const ExpansionPanelHeader(
          title: 'Animation',
        ),
        [
          _item('Animated Container',
              () => AppRouter.push(context, AppRouter.animatedContainer)),
        ]);

    panelList.add(animatedItem);
  }
}

class Item {
  Item(this.title, this.children, [this.isExpanded = false]);

  Widget title;
  List<Widget> children;
  bool isExpanded;
}

class ExpansionPanelHeader extends StatelessWidget {
  const ExpansionPanelHeader({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft, child: Text(title));
  }
}
