import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:health_hub/screen/pie_chart_page.dart';
import 'package:health_hub/widget/pie_chart_section.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();
  late bool isShowingMainData;
  final _formKey = GlobalKey<FormState>();
  String selectedValue = 'Option 1';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();
  final TextEditingController _villageIdController = TextEditingController();
  final List<String> cardData = [
    'Card 1',
    'Card 2',
    'Card 3',
    'Card 4',
    'Card 5',
  ];

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'Manage',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Color(0xFF04BADE),
              ),
              child: Text(
                'Invest',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 76)),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.format_align_right),
                ),
              ],
            ),
          ],
        ),
      ),
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        children:[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/one.png'),
                        ),
                    title: Text("Hello,Rosine"),
                    subtitle: Text("Hiiii",style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF0F52BA),
                              Color(0xFF45B6FE),

                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                ListTile(
                                  title: Text("Hello",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                  subtitle: Text("Welcome",style: TextStyle(
                                      color: Colors.white
                                  ),),
                                ),
                                ListTile(
                                  title: DropdownButton<String>(
                                    value: selectedValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedValue = newValue!;
                                      });
                                    },
                                    items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                                        .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                  trailing: Text('Selected Value: $selectedValue'),
                                ),
                              ],
                            ),
                            _LineChart(isShowingMainData: isShowingMainData),
                            Positioned(
                              left: 30,
                              right: 30,
                              bottom: -100, // Adjust this value as needed
                              child: Container(
                                height: 150, // Adjust the height as needed
                                child: Card(
                                  color: Colors.white,
                                  elevation: 4,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Text("Row 1"),
                                              Text("Row 1"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text("Row 2"),
                                              Text("Row 2"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text("Row 3"),
                                              Text("Row 3"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ListTile(
                        leading: Text("Transactions",style: TextStyle(
                          fontSize: 16
                        ),),
                        trailing: DropdownButton<String>(
                          value: selectedValue,
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                              .map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.access_time),
                              title: Text("One"),
                              subtitle: Text("Two"),
                              trailing: Icon(Icons.add),
                            ),
                            ListTile(
                              leading: Icon(Icons.access_time),
                              title: Text("One"),
                              subtitle: Text("Two"),
                              trailing: Icon(Icons.add),
                            ),
                            ListTile(
                              leading: Icon(Icons.access_time),
                              title: Text("One"),
                              subtitle: Text("Two"),
                              trailing: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                  ListTile(
                    leading: Text("Monthly Budget",style: TextStyle(
                        fontSize: 16
                    ),),
                  ),
                  Container(
                    height: 150, // Set the height as needed
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        // Add your horizontally scrolling items here
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFF5F5F5),
                            ),
                            width: 200,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.add),
                                  title: Text("wertr"),
                                  subtitle: Text("kjhjk"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                    child: LinearProgressIndicator(
                                      value: 0.7,
                                      minHeight: 10,
                                      color: Colors.greenAccent,
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.add),
                                  title: Text("cvbnm,kjtr"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFF5F5F5),
                            ),
                            width: 200,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.add),
                                  title: Text("wertr"),
                                  subtitle: Text("kjhjk"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                    child: LinearProgressIndicator(
                                      value: 0.7,
                                      minHeight: 10,
                                      color: Colors.greenAccent,
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.add),
                                  title: Text("cvbnm,kjtr"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFF5F5F5),
                            ),
                            width: 200,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.add),
                                  title: Text("wertr"),
                                  subtitle: Text("kjhjk"),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                                    child: LinearProgressIndicator(
                                      value: 0.7,
                                      minHeight: 10,
                                      color: Colors.greenAccent,
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.add),
                                  title: Text("cvbnm,kjtr"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: PageView(
                            children: [
                              PieChartPage(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

    ]
                  ),
              ),
              ),
              ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                // Customize your bottom sheet content here
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Make a Request',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart), label: "Stats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        onTap: (index) {
          _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        },
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowingMainData ? sampleData1 : sampleData2,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
    lineTouchData: lineTouchData1,
    gridData: gridData,
    titlesData: titlesData1,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    minX: 0,
    maxX: 14,
    maxY: 4,
    minY: 0,
  );

  LineChartData get sampleData2 => LineChartData(
    lineTouchData: lineTouchData2,
    gridData: gridData,
    titlesData: titlesData2,
    borderData: borderData,
    lineBarsData: lineBarsData2,
    minX: 0,
    maxX: 14,
    maxY: 6,
    minY: 0,
  );

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
    ),
  );

  FlTitlesData get titlesData1 => FlTitlesData(
    // bottomTitles: AxisTitles(
    //   sideTitles: bottomTitles,
    // ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    bottomTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    // leftTitles: AxisTitles(
    //   sideTitles: leftTitles(),
    // ),
  );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
    lineChartBarData1_2,
    lineChartBarData1_3,
  ];

  LineTouchData get lineTouchData2 => const LineTouchData(
    enabled: false,
  );

  FlTitlesData get titlesData2 => FlTitlesData(
    // bottomTitles: AxisTitles(
    //   sideTitles: bottomTitles,
    // ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    bottomTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    // leftTitles: AxisTitles(
    //   sideTitles: leftTitles(),
    // ),
  );

  List<LineChartBarData> get lineBarsData2 => [
    lineChartBarData2_1,
    lineChartBarData2_2,
    lineChartBarData2_3,
  ];


  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border(
      bottom:
      BorderSide(color: Colors.white, width: 4),
      left: const BorderSide(color: Colors.transparent),
      right: const BorderSide(color: Colors.transparent),
      top: const BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    color: Color(0xFFE2E5DE),
    barWidth: 1,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
  );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    isCurved: true,
    color: Color(0xFFF5F5F5),
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: false,
      color: Color(0xFFF5F5F5),
    ),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(10, 2.8),
      FlSpot(12, 2.6),
      FlSpot(13, 3.9),
    ],
  );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
    isCurved: true,
    color: Color(0xFFE2E5DE),
    barWidth: 1,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 2.8),
      FlSpot(3, 1.9),
      FlSpot(6, 3),
      FlSpot(10, 1.3),
      FlSpot(13, 2.5),
    ],
  );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
    isCurved: true,
    curveSmoothness: 0,
    color: Color(0xFFE2E5DE),
    barWidth: 1,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 4),
      FlSpot(5, 1.8),
      FlSpot(7, 5),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
  );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
    isCurved: true,
    color: Color(0xFFE2E5DE),
    barWidth: 1,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: true,
      color: Color(0xFFE2E5DE),
    ),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(10, 2.8),
      FlSpot(12, 2.6),
      FlSpot(13, 3.9),
    ],
  );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
    isCurved: true,
    curveSmoothness: 0,
    color: Color(0xFFE2E5DE),
    barWidth: 1,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: true),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 3.8),
      FlSpot(3, 1.9),
      FlSpot(6, 5),
      FlSpot(10, 3.3),
      FlSpot(13, 4.5),
    ],
  );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 37,
              ),
              const Text(
                'Monthly Sales',
                style: TextStyle(
                  color: Color(0xFFE2E5DE),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 37,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 6),
                  child: _LineChart(isShowingMainData: isShowingMainData),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
            ),
            onPressed: () {
              setState(() {
                isShowingMainData = !isShowingMainData;
              });
            },
          )
        ],
      ),
    );
  }
}



