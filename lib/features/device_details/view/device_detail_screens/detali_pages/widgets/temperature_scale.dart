import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TemperatureScale extends StatelessWidget {
  const TemperatureScale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      minimum: 0,
      maximum: 100,
      animateRange: true,
      animateAxis: true,
      showLabels: false, // Hide the scale values (labels)
      showTicks: false,  // Hide the scale pointers (ticks)
      barPointers: [
        LinearBarPointer(
          value: 100, // Set the value for the pointer
          thickness: 10, // Adjust the thickness of the bar
          edgeStyle: LinearEdgeStyle.bothCurve, // Apply curved edges if needed
          shaderCallback: (bounds) {
            return  const LinearGradient(
              colors: [
                Colors.red,
                Colors.yellow,
                Colors.green,
              ],
            ).createShader(bounds);
          },
        ),
      ],
      markerPointers: [
        LinearShapePointer(
          value: 70, // Position of the marker
          shapeType: LinearShapePointerType.rectangle, // Shape of the marker
          color: Colors.green[300], // Color of the marker
          elevation: 50,
          width: 2.w,
          height: 20.h,// Adds shadow to the marker
          // Size of the marker
        ),
      ],
    );
  }
}