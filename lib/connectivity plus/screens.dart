import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.blue.shade700,
        title: const Text(
          "Good Thought",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: .5,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var result = snapshot.data!;
              if (result.contains(ConnectivityResult.mobile) ||
                  result.contains(ConnectivityResult.wifi)) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: goodThoughtList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.blue.shade50,
                        child: ListTile(
                          title: Text(
                            goodThoughtList[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: .2,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/image/internet_not_working-removebg-preview.png',
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Icon(Icons.error_outline),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Future<List<ConnectivityResult>> getList() async {
  return await Connectivity().checkConnectivity();
}

List goodThoughtList = [
  "સફળતા - સફળ થવા માટે મહેનત, ધીરજ અને નિષ્ઠા જરૂરી છે.",
  "પ્રેરણા - જીવનમાં પ્રગતિ માટે નાની-નાની પ્રેરણાઓને પણ વાછવી અને અપનાવવી જોઈએ.",
  "સમય - સમય એ સૌથી મોટું સંપત્તિ છે, તેને વ્યર્થ ન ગુમાવો.",
  "વિશ્વાસ - સ્વનિર્ભર થવા માટે આત્મવિશ્વાસ ખૂબ જ જરૂરી છે.",
  "સહનશીલતા - જીવનમાં મુશ્કેલીઓ આવવી નક્કી છે, તેને ધીરજથી પાર કરો.",
  "શિક્ષણ - સારા વિચારો અને જ્ઞાન એજીવનને સાચા માર્ગે લઈ જાય છે.",
  "મહેનત - મહેનત એ એક એવું શસ્ત્ર છે જેનાથી કોઈપણ લક્ષ્ય હાંસલ કરી શકાય.",
  "સંયમ - ઉગ્ર ભાવનાઓ પર કાબૂ રાખીને શાંત અને સંતુલિત જીવન જીવવું જોઈએ.",
  "દયા - માનવતા એ સૌથી મહાન ગુણ છે, બધાં સાથે પ્રેમ અને દયા રાખવી જોઈએ.",
  "આભાર - જીવનમાં જે પણ છે, તે માટે કૃતજ્ઞતા વ્યક્ત કરવી જોઈએ.",
  "સફળતા અને નિષ્ફળતા - નિષ્ફળતા એ સફળતા તરફનો પહેલો પગથિયો છે.",
  "સંતોષ - સંતોષ એ સાચા સુખનું મૂળ છે.",
  "સુંદર જીવન - એક સરસ જીવન જીવવા માટે સકારાત્મકતા અપનાવો.",
  "હાસ્ય - હસતા રહો અને જીવનની દરેક પરિસ્થિતિમાં આનંદ શોધો.",
  "શાંતિ - શાંતિથી ભરેલું હૃદય જીવનને વધુ સુંદર બનાવે છે."
];
