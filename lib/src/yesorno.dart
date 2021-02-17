import 'package:flutter/material.dart';

import 'applicationstate.dart';
import 'widgets.dart';

class YesOrNoSelection extends StatelessWidget {
  const YesOrNoSelection({required this.state, required this.onSelection});

  final Attending state;
  final void Function(Attending selection) onSelection;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case Attending.yes:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () => onSelection(Attending.yes),
                child: Text('YES'),
                style: ElevatedButton.styleFrom(
                  elevation: 8.0,
                ),
              ),
              SizedBox(width: 8),
              TextButton(
                child: Text('NO'),
                onPressed: () => onSelection(Attending.no),
              ),
            ],
          ),
        );
      case Attending.no:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(
                child: Text('YES'),
                onPressed: () => onSelection(Attending.yes),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                child: Text('NO'),
                onPressed: () => onSelection(Attending.no),
              ),
            ],
          ),
        );
      default:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              StyledButton(
                child: Text('YES'),
                onPressed: () => onSelection(Attending.yes),
              ),
              SizedBox(width: 8),
              StyledButton(
                child: Text('NO'),
                onPressed: () => onSelection(Attending.no),
              ),
            ],
          ),
        );
    }
  }
}
