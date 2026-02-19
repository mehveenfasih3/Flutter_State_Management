import 'package:flutter/material.dart';

class IPAdress extends InheritedWidget {
  final String ipAdress;
  const IPAdress({super.key, required this.ipAdress, required Widget child})
    : super(child: child);

  static IPAdress of(BuildContext context) {
    final ipAdress = context.dependOnInheritedWidgetOfExactType<IPAdress>();
    if (ipAdress == null) {
      throw Exception('No IPAdress found in context');
    }
    return ipAdress;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget is IPAdress && oldWidget.ipAdress != ipAdress;
  }
}

class LoginScreen extends StatelessWidget {
 
   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final serverurl = IPAdress.of(context).ipAdress;
          
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
       
          child: Text('login server  url $serverurl '),
        
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});
@override
  Widget build(BuildContext context) {
     final serverurl = IPAdress.of(context).ipAdress;
          
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Screen')),
      body: Center(
       
          child: Text('Setting server  url $serverurl '),
        
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
          
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
       
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text('Go to Login Screen'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                },
                child: const Text('Go to Settings Screen'),
              ),
            ],
          ),
        
      ),
    );
  }
}
