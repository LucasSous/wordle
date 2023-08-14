import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Chart extends StatefulWidget {
  final List<int> values;

  const Chart({super.key, required this.values});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.35,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: widget.values.map((e) => column(e)).toList()),
        ),
        Container(
          width: double.infinity,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                widget.values.length,
                (index) => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.09,
                    child: Text(
                      '${index + 1}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ))),
          ),
        ),
        const Text(
          'TENTATIVAS',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 2,
          ),
        )
      ],
    );
  }

  Widget column(int value) {
    return Container(
      decoration: BoxDecoration(
          color: value == 0 ? Colors.grey[400] : const Color(0xff85DF7D),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      width: MediaQuery.of(context).size.width * 0.09,
      height: columnHeight(value),
      alignment: Alignment.topCenter,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ).animate().scaleY(
          duration: 1500.ms,
          curve: Curves.bounceOut,
          begin: 0,
          end: 1,
          alignment: Alignment.bottomCenter,
        );
  }

  double columnHeight(int value) {
    double maxHeight = MediaQuery.of(context).size.height * 0.3;
    double minHeight = MediaQuery.of(context).size.height * 0.05;
    int higherValue = returnHigherValue();
    var expressionValue = (maxHeight / higherValue) * value + minHeight;
    return expressionValue.isNaN ? minHeight : expressionValue;
  }

  int returnHigherValue() {
    int value = 0;
    for (var element in widget.values) {
      if (element > value) value = element;
    }
    return value;
  }
}
