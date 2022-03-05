import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BmiCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}


class _BmiCalculatorState extends State<BmiCalculator> {
  late int slidervalue1 = 160;
  late int slidervalue2 = 95;
  late int selectedcard =0 ;


  String Calculatebmi(int height, int weight) {
    height = slidervalue1;
    weight = slidervalue2;
    return ((weight / (height * height)) * 10000).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        title: const Text(
          ("Bmi Calculator"),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),

      //we have in our body one column widget  & 5 row widgets

      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedcard = 0;
                      });
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      padding: const EdgeInsets.all(12),
                      color:selectedcard== 0 ? Colors.grey[350] : Colors.indigoAccent,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/male_symbol.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedcard = 1;
                      });
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      padding: const EdgeInsets.all(12),
                      color: selectedcard== 1? Colors.grey[350] : Colors.indigoAccent,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/female_symbol.png',
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 20),

          //here we are going to implement another row widget for height input
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      width: 400,
                      height: 145,
                      padding: const EdgeInsets.all(12),
                      color:Colors.indigoAccent,
                      child: Column(
                        children: [
                          const Text('your height in cm',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black87)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(slidervalue1.toString(),
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40)),
                              const Text('cm',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Slider(
                            activeColor: Colors.black,
                            inactiveColor: Colors.white60,
                            value: slidervalue1.toDouble(),
                            min: 120.0,
                            max: 225.0,
                            onChanged: (value) {
                              setState(() {
                                slidervalue1 = value.toInt();
                              });
                            },
                          )
                        ],
                      )),
                ),
              ),
              const SizedBox(width: 10)
            ],
          ),
          const SizedBox(height: 20),

          //here we are going to implement another row widget for weight input

          Row(
            children: [
              const SizedBox(width: 12),
              Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 400,
                  height: 145,
                  padding: const EdgeInsets.all(12),
                  color: Colors.indigoAccent,
                  child: Column(
                    children: [
                      const Text('your weight in kg',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black87)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(slidervalue2.toString(),
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40)),
                          const Text(
                            'kg',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Slider(
                        activeColor: Colors.black,
                        inactiveColor: Colors.white60,
                        value: slidervalue2.toDouble(),
                        min: 60.0,
                        max: 225.0,
                        onChanged: (value) {
                          setState(() {
                            slidervalue2 = value.toInt();
                          });
                        },
                      )
                    ],
                  ),
                ),
              )),
              const SizedBox(width: 10),
            ],
          ),

          const SizedBox(
            height: 20,
          ),

          //here we will implement the bmi indicator text place

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(width: 12),
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      width: 40,
                      height: 80,
                      padding: const EdgeInsets.all(12),
                      color: Colors.indigoAccent,
                      child: Column(children: [
                        const Text(
                          'your BMI is',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                            Calculatebmi(slidervalue1, slidervalue2).toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22))
                      ]))),
            ),
            const SizedBox(width: 10),
          ]),
        ],
      ),
    );
  }
}

