import "package:flutter/material.dart";



class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ripples')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  
                  width: 100,
                  height: 400,
                  color: Colors.black,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.red],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                          colors: [Colors.green, Colors.yellow],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey.shade400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                          colors: [Colors.purple, Colors.pink],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}