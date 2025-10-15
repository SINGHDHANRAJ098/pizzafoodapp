import 'package:flutter/material.dart';
import 'package:food_pizza_hot/screen/googlemap.dart';

class Accessloction extends StatefulWidget {
  const Accessloction({super.key});

  @override
  State<Accessloction> createState() => _AccessloctionState();
}

class _AccessloctionState extends State<Accessloction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 50),
                  child: Image.asset("images/allowlocation.png"),
                ),
                SizedBox(height: 10),
        
        
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Googlemap()),
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
        
                        child: Center(
                          child: Text(
                            " ALLOW LOCATION",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "DFOOD WILL ACCESS YOUR LOCATION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,

                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Center(
                  child: Text(
                    "ONLY WHILE USING THE APP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,

                    ),
                  ),
                ),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
