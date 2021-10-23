import 'package:ecommerce_admin/widgets/overlayContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';




class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i=0;
  bool _dropdownShown = false;

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Overlay Container Demo Page'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (ctx,i){
          return MyDropdownButton(
            label: "Bottom Dropdown",
            position: DropdownPosition.BELOW,
          );
        },
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

enum DropdownPosition {
  BELOW,
  RIGHT,
}

class MyDropdownButton extends StatefulWidget {
  final String label;
  final DropdownPosition position;

  MyDropdownButton({

    required this.label,
    this.position = DropdownPosition.BELOW,
  }) ;

  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  // Need to maintain a "show" state either locally or inside
  // a bloc.
  bool _dropdownShown = false;

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            onPressed: _toggleDropdown,
            child: Column(
              children: <Widget>[
                Text(widget.label),
              ],
            ),
          ),
          // By default the overlay will
          // be added right below the raised button
          // but outside the widget tree.
          // We can change that by supplying a "position".
          OverlayContainer(
            show: _dropdownShown,
            position: widget.position == DropdownPosition.RIGHT
                ? OverlayContainerPosition(
                    150,
                    45,
                  )
                : OverlayContainerPosition(
                    0,
                    0,
                  ),
            child: Container(
              height: 70,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 5),
              decoration:
                  BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey[300]!,
                  blurRadius: 3,
                  spreadRadius: 6,
                )
              ]),
              child: Text("I render outside the \nwidget hierarchy."),
            ),
          ),
        ],
      ),
    );
  }
}
