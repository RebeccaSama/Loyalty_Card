import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircularGauge extends StatelessWidget {
  const CircularGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150, // Taille du widget
        height: 150,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              startAngle: 270,
              endAngle: 270,
              showLabels: false,
              showTicks: false,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.1,
                color: Color(0xFFE0E0E0),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: const <GaugePointer>[
                RangePointer(
                  value: 70,
                  width: 0.1,
                  color: AppTheme.kPrimaryColor,
                  sizeUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve,
                ),
              ],
              annotations: const <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    '70%',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.kPrimaryColor,
                    ),
                  ),
                  positionFactor: 0.1,
                  angle: 0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
