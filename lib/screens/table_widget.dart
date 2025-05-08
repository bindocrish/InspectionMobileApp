import 'package:flutter/material.dart';

class WorkOrderTable extends StatelessWidget {
  const WorkOrderTable({super.key});

  Widget cell(String text, {double width = 100, double height = 40, bool isHeader = false}) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isHeader ? const Color(0xFFFFF2E5) : Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Work Order – EN.2025.00094',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Header Row 1
              Row(
                children: [
                  cell('Equipment', width: 100, isHeader: true),
                  cell('WO Qty', width: 100, isHeader: true),
                  cell('Inspected Qty', width: 200, isHeader: true),
                  cell('Pending Qty', width: 100, isHeader: true),
                ],
              ),
              // Header Row 2 (under Inspected Qty)
              Row(
                children: [
                  cell('', width: 100, height: 40),
                  cell('', width: 100, height: 40),
                  Column(
                    children: [
                      Row(
                        children: [
                          cell('Passed Qty', width: 100, height: 40, isHeader: true),
                          cell('Failed Qty', width: 100, height: 40, isHeader: true),
                        ],
                      ),
                    ],
                  ),
                  cell('', width: 100, height: 40),
                ],
              ),
              // Data Row
              Row(
                children: [
                  cell('Pat', width: 100),
                  cell('4', width: 100),
                  cell('0', width: 100),
                  cell('0', width: 100),
                  cell('4', width: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
