import 'package:flutter/material.dart';
import 'package:flutter_application_1/telas/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    var _textButton = "Next";
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children: <Widget>[
              _buildPage(
                  imagePath: '../assets/tela1.png',
                  title: 'Start your journey towards a more active lifestyle',
                  icon: Icons.restaurant_menu),
              _buildPage(
                  imagePath: '../assets/tela2.png',
                  title: 'Find nutrition tips that fit your lifestyle',
                  icon: Icons.accessibility_new),
              _buildPage(
                  imagePath: '../assets/tela3.png',
                  title: 'A community for you, challenge yourself',
                  icon: Icons.fitness_center),
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
                      builder: (context) => LoginPage(), // Nova página
                    ),
                  );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.yellowAccent,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.3,
            left: 0,
            right: 0,
            child: Column(
              children: [
                TabPageSelector(
                  controller: _tabController,
                  color: Colors.grey.shade400,
                  selectedColor: Colors.white,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPageIndex == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(), // Nova página
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
                    ),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                  ),
                  child: Text(_currentPageIndex == 2 ? "Get Started" : "Next",
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
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
            width: MediaQuery.of(context).size.width * 1, // 80% da largura da tela
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Ajuste o padding conforme necessário
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.7), // Cor de fundo roxa
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: Colors.yellowAccent,
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
                  softWrap: true, // Quebra o texto em várias linhas automaticamente
                  overflow: TextOverflow.visible, // Evita o corte de texto
                ),
              ],
            ),
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
