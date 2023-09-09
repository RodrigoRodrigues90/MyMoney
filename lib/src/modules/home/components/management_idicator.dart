import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class ManegementIndicator extends StatelessWidget {
  final double value;
  final String subtitle;
  final double minValueAxis;
  final double maxValueAxis;
  final bool? isMoney;
  final bool? isASC;

  const ManegementIndicator(
      {super.key,
      required this.value,
      required this.subtitle,
      required this.maxValueAxis,
      required this.minValueAxis,
      this.isMoney = true,
      this.isASC = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //classe da lib de graficos
        AnimatedRadialGauge(
          duration: const Duration(seconds: 3),
          value: value,
          curve: Curves.decelerate,
          radius: 80,
          axis: GaugeAxis(
              min: minValueAxis,
              max: maxValueAxis,
              degrees: 180,
              style: const GaugeAxisStyle(
                thickness: 20,
                background: Colors.white,
                segmentSpacing: 4,
              ),
              pointer: const GaugePointer.triangle(
                  borderRadius: 15,
                  width: 8,
                  height: 130,
                  color: Colors.blueGrey),
              progressBar: const GaugeProgressBar.rounded(
                color: Colors.white12,
              ),
              segments: [
                GaugeSegment(
                    from: 0,
                    to: maxValueAxis * 0.33,
                    color: isASC! ? Colors.greenAccent : Colors.redAccent,
                    cornerRadius: Radius.zero),
                GaugeSegment(
                    from: maxValueAxis * 0.33,
                    to: maxValueAxis * 0.66,
                    color: Colors.orangeAccent,
                    cornerRadius: Radius.zero),
                GaugeSegment(
                    from: maxValueAxis * 0.66,
                    to: maxValueAxis,
                    color: isASC! ? Colors.redAccent : Colors.greenAccent,
                    cornerRadius: Radius.zero),
              ]),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Column(children: [
              Text(
                isMoney!
                    ? 'R\$ ${value.toString()}'
                    : diaOuDias(value),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: value < 0 ? Colors.redAccent : Colors.black,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13),
              )
            ]),
          ),
        )
      ],
    );
  }

  String diaOuDias(valor){
    if(valor < 2){
      return '${valor.toStringAsFixed(0)} dia';
    }
    else{
      return '${valor.toStringAsFixed(0)} dias';
    }
  }
}