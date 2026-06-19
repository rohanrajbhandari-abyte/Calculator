import 'package:flutter/material.dart';

import 'botton_values.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          //output
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
             child: Container(
               alignment: Alignment.bottomRight,
               padding: const EdgeInsets.all(16),
               child: const Text("0",style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
               ),
                 textAlign: TextAlign.end,
               ),
              ),
            ),
          ),

        
          //buttons
          Wrap(
            children:
            Btn.buttonValues
                .map(
                  (value) => SizedBox(
                    width: value==Btn.n0
                        ? screenSize.width/2
                        :(screenSize.width/4),
                   height: screenSize.width/5,
                   child: buildBotton(value),
                  ),
            )
                .toList(),
          )
        ],
        ),
      )
    );
  }

  Widget buildBotton(value){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: [Btn.del,Btn.clr].contains(value)
            ?Colors.grey
            :[
              Btn.per,
              Btn.multiply,
              Btn.add,
              Btn.subtract,
              Btn.divide,
              Btn.calculate,
             ].contains(value)
            ?Colors.orange
            : Colors.blueGrey,
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(200),
        ),
        child: InkWell(
          onTap: () {},
          child: Center(
              child: Text(value,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:30
              ),
              ),
          ),
        ),
      ),
    );
  }
}
