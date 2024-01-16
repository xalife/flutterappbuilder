import 'package:flutter/material.dart';

class DraggablePlace extends StatefulWidget {
  final Widget child;
  Function(DragTargetDetails) onAdded;
  DraggablePlace({
    super.key,
    required this.child,
    required this.onAdded,
  });

  @override
  State<DraggablePlace> createState() => _DraggablePlaceState();
}

class _DraggablePlaceState extends State<DraggablePlace> {
  bool isIn = false;
  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onAcceptWithDetails: (details) {
        widget.onAdded(details);
        setState(() {
          isIn = false;
        });
      },

      onWillAccept: (val) {
        if (val != null) {
          setState(() {
            isIn = true;
          });
          return true;
        } else {
          return false;
        }
      },
      onLeave: (details) {
        setState(() {
          isIn = false;
        });
      },

      // onAccept: widget.onAdded,
      builder: (
        context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: isIn
                ? Border.all(
                    color: Colors.blue,
                    width: 4,
                  )
                : Border.all(
                    color: Colors.transparent,
                    width: 4,
                  ),
          ),
          child: Center(
            child: widget.child,
          ),
        );
      },
    );
  }
}
