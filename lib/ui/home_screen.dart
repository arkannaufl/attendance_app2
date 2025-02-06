import 'package:attendance_app2/ui/absent/absent_screen.dart';
import 'package:attendance_app2/ui/attendance_history/attendance_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'attendance/attendance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // disable back button
      onPopInvoked: (bool didPop) async {
        final shouldPop = await _onWillPop(context);
        if (shouldPop) {
          Navigator.of(context).pop(true);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo[800]!,
                  Colors.indigo[600]!,
                ],
              )
          ),
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello, Andrianaa", style: GoogleFonts.onest(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffF1FAEE),
                          height: 1.3
                      ),
                    ),),
                    Text("What do you want to do?", style: GoogleFonts.onest(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffF1FAEE),
                            height: 1.3
                        )
                    ),),
                    const SizedBox(height: 24,),
                    Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,// Lebar per panjang
                          children: [
                            _itemsAttendanceApp(context, iconLer: Icons.camera_alt, title: "Attendance", color: Colors.amberAccent, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendScreen()))),
                            _itemsAttendanceApp(context, iconLer: Icons.beach_access_sharp, title: "Leave", color: Colors.purple, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AbsentScreen()))),
                            _itemsAttendanceApp(context, iconLer: Icons.history, title: "History", color: Colors.blueAccent, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendanceHistoryScreen()))),
                            _itemsAttendanceApp(context, iconLer: Icons.exit_to_app, title: "Exit", color: Colors.red, onTap: () async { final shouldPop = await _onWillPop(context); if (shouldPop) {Navigator.of(context).pop(true);}}),
                          ],
                        )
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  Widget _itemsAttendanceApp(BuildContext context,{
    required IconData iconLer,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }){ return Material(
    borderRadius: BorderRadius.circular(20),
    elevation: 6,
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.indigo[400],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color
              ),
              child: Icon(
                iconLer,
                size: 40,
                color: Color(0xffF1FAEE),
              ),
            ),
            const SizedBox(height: 15,),
            Text(title, style: GoogleFonts.plusJakartaSans(
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF1FAEE),
                  letterSpacing: 0.8
              ),
            ),)
          ],
        ),
      ),
    ),
  );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
            title: Text('Confirm Exit'),
            content: Text('Are you sure you want to exit?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ]
        )
    ) ?? false;
  }
}