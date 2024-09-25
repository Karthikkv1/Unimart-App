//File created on 26-05-2024 4:20PM


import 'package:flutter/material.dart';
import 'package:unimart/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key,this.child
  });

  final Widget?  child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
    clipper: TCustomCurvedEdges(),
    child: child,
    );
  }
}