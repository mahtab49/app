import "package:flutter/material.dart";

class RippleScreen extends StatefulWidget {
  @override
  _RippleScreenState createState() => _RippleScreenState();
}

class _RippleScreenState extends State<RippleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rippleAnimation;
  bool showText = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _rippleAnimation = Tween<double>(begin: 100, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Show text after ripple animation is completed
          Future.delayed(Duration(milliseconds: 200), () {
            setState(() {
              showText = true;
            });
          });
        } else if (status == AnimationStatus.dismissed) {
          // Reset the text visibility when animation reverses
          setState(() {
            showText = false;
          });
        }
      });
  }

  void _startRippleEffect() {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(child: Text('RIPPLES',
        style: TextStyle(fontSize: 24,
        fontWeight: FontWeight.bold
        
        ),
        
        
        )),
        elevation: 0,
        
      ),
      endDrawer: Drawer(),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showText = false;
                });
                _startRippleEffect();
              },
              child: AnimatedBuilder(
                animation: _rippleAnimation,
                builder: (context, child) {
                  return Container(
                    width: _rippleAnimation.value,
                    height: _rippleAnimation.value,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 50,
                          blurRadius: 80,
                        ),
                      ],
                    ),
                    child: Center(
                      child: showText
                          ? Text(
                              'Go',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Container(), // Empty container to hide the text during animation
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


