import 'package:flutter/material.dart';

class SessionDetailPage extends StatefulWidget {
  @override
  _SessionDetailPageState createState() => _SessionDetailPageState();
}

class _SessionDetailPageState extends State<SessionDetailPage> {
  int selectedIndex = -1;

  void _onCardTap(int index) {
    setState(() {
      selectedIndex = selectedIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> titles = List.generate(5, (index) => 'Card Title $index');
    final List<String> subtitles = List.generate(5, (index) => 'Subtitle $index');

    return Scaffold(
      appBar: AppBar(
        title: Text('Session Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: List.generate(titles.length, (index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _onCardTap(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 30.0),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? Colors.blue : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(color: selectedIndex == index ? Colors.blue : Colors.grey),
                    ),
                  ),
                ),
                SizedBox(width: 16.0), // Space between point and card
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 16.0), // Margin between each card
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ExpansionPanelList(
                        elevation: 0, // Remove the default elevation
                        expandedHeaderPadding: EdgeInsets.all(0),
                        expansionCallback: (int itemIndex, bool isExpanded) {
                          _onCardTap(index);
                        },
                        children: [
                          ExpansionPanel(
                            backgroundColor: Colors.transparent,
                            isExpanded: selectedIndex == index,
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text(titles[index]),
                              );
                            },
                            body: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subtitles[index],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 16.0),
                                  CheckboxListTile(
                                    title: Text('Option 1'),
                                    value: false,
                                    onChanged: (bool? value) {},
                                  ),
                                  CheckboxListTile(
                                    title: Text('Option 2'),
                                    value: false,
                                    onChanged: (bool? value) {},
                                  ),
                                  CheckboxListTile(
                                    title: Text('Option 3'),
                                    value: false,
                                    onChanged: (bool? value) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

