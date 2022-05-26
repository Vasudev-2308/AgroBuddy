import 'package:flutter/material.dart';

class PHandRainfallRow extends StatelessWidget {
  const PHandRainfallRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              const Text(
                "PH Value",
                style: TextStyle(fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true, signed: false),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "pH",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              const Text(
                "Rainfall ",
                style: TextStyle(fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true, signed: false),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "In mm",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
