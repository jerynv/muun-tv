import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hse_apps/pages/pages/home.dart';
import 'package:hse_apps/pages/pages/list.dart';
import 'package:hse_apps/pages/pages/search.dart';
import 'package:hse_apps/pages/pages/settings.dart';

class Land extends StatefulWidget {
  const Land({super.key});

  @override
  State<Land> createState() => _LandState();
}

class _LandState extends State<Land> {
  List<bool> _isSelected = [false, false, true, false, false];

  List<Widget> _pages = [
    Container(
      color: Colors.red,
    ),
    Search(),
    Home(),
    ListTab(),
    Settings(),
  ];

  void navUp() {
    setState(() {
      //index where _isSelected is true -1 and if 0 then lenth -1
      int index = _isSelected.indexOf(true);
      if (index == 0) {
        _isSelected = [false, false, false, false, false];
        _isSelected[_isSelected.length - 1] = true;
      } else {
        _isSelected = [false, false, false, false, false];
        _isSelected[index - 1] = true;
      }
    });
  }

  void navDown() {
    setState(() {
      //index where _isSelected is true +1 and if last then 0
      int index = _isSelected.indexOf(true);
      if (index == _isSelected.length - 1) {
        _isSelected = [false, false, false, false, false];
        _isSelected[0] = true;
      } else {
        _isSelected = [false, false, false, false, false];
        _isSelected[index + 1] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = _isSelected.indexOf(true);
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Focus(
                autofocus: true, // Automatically capture focus
                onKey: (FocusNode node, RawKeyEvent event) {
                  if (event is RawKeyDownEvent) {
                    debugPrint(event.logicalKey.keyId.toString());
                    if (event.logicalKey.keyId == 4294968065) {
                      debugPrint('down');
                      navDown();
                    } else if (event.logicalKey.keyId == 4294968068) {
                      debugPrint('up');
                      navUp();
                    }
                  }
                  return KeyEventResult.handled;
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
            
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _bsBox(Icons.person, isSelected: _isSelected[0],
                          onFocus: () {
                        setState(() {
                          _isSelected = [true, false, false, false, false];
                        });
                      }),
                      Column(
                        children: [
                          _bsBox(Icons.search, isSelected: _isSelected[1],
                              onFocus: () {
                            setState(() {
                              _isSelected = [false, true, false, false, false];
                            });
                          }),
                          SizedBox(height: 10),
                          _bsBox(Icons.home, isSelected: _isSelected[2],
                              onFocus: () {
                            setState(() {
                              _isSelected = [false, false, true, false, false];
                            });
                          }),
                          SizedBox(height: 10),
                          _bsBox(Icons.star, isSelected: _isSelected[3],
                              onFocus: () {
                            setState(() {
                              _isSelected = [false, false, false, true, false];
                            });
                          }),
                        ],
                      ),
                      _bsBox(Icons.settings, isSelected: _isSelected[4],
                          onFocus: () {
                        setState(() {
                          _isSelected = [false, false, false, false, true];
                        });
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: [_pages[index]],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _bsBox(IconData icon,
    {bool isSelected = false, required Function onFocus}) {
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? Colors.white : Colors.transparent,
      borderRadius: BorderRadius.circular(25),

      ///thin white border
      border: isSelected
          ? Border.all(color: Colors.white, width: 1)
          : Border.all(color: Colors.white.withOpacity(.3), width: 1),
    ),
    height: 20,
    width: 20,
    child: Icon(
      icon,
      color: isSelected ? Colors.black : Colors.white,
      size: 10,
    ),
  );
}
