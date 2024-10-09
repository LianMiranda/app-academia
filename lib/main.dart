import 'package:flutter/material.dart';
import 'package:flutter_application_1/telas/login.dart';
import 'package:flutter_application_1/telas/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App academia',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),  
        '/home': (context) => MyHomePage(title: 'Home Page'),  
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children: <Widget>[
              _buildPage(
                  imagePath: '../assets/images/tela1.png',
                  title: 'Start your journey towards a more active lifestyle',
                  icon: Icons.directions_run_sharp),
              _buildPage(
                  imagePath: '../assets/images/tela2.png',
                  title: 'Find nutrition tips that fit your lifestyle',
                  icon: Icons.breakfast_dining),
              _buildPage(
                  imagePath: '../assets/images/tela3.png',
                  title: 'A community for you, challenge yourself',
                  icon: Icons.group),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: (){
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(), 
                    ),
                  );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(
                      color: Color.fromRGBO(226, 241, 99, 1),
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Color.fromRGBO(226, 241, 99, 1),
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ]
      )
    );
        
  }

 Widget _buildPage({required String imagePath, required String title, required IconData icon}) {
  return Stack(
    fit: StackFit.expand,
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1, 
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(179, 160, 255, 1), 
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: Color.fromRGBO(226, 241, 99, 1),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true, 
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 20),
                TabPageSelector(
                      controller: _tabController,
                      color: Colors.grey.shade400,
                      selectedColor: Colors.white,
                ),
              ],
            ),
          ),
             SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPageIndex == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(), 
                        ),
                      );
                    } else {
                      _nextPage();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.white, width: 1)
                    ),
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.09),

                  ),
                  child: Text(_currentPageIndex == 2 ? "Get Started" : "Next",
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
        ],
      ),
    ],
  );
}
  void _nextPage() {
    _pageViewController.animateToPage(
      (_currentPageIndex + 1) % 3,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    setState(() {
      _currentPageIndex = currentPageIndex;
      _tabController.index = currentPageIndex % 3;
    });
  }
}
