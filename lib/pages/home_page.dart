import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> todoData = [];
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'Morning, Ralph',
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 4),
          Center(
            child: Text('April 27, 2026', style: TextStyle(fontSize: 11)),
          ),
          SizedBox(height: 16),
      
          // Kolom search
          TextField(
            style: TextStyle(fontSize: 13),
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, size: 18),
              isDense: true,
              filled: true,
              fillColor: Color(0xFFEBEBE6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 12),
      
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.circle_outlined,
                  size: 18,
                  color: Colors.black87,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title Todo',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(height: 4),
                        Text(
                          '20-08-2026',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF9A6B1E),
                          ),
                        ),
                        Text(
                          "Deskripsi todo",
                          style: TextStyle(fontSize: 12),
                        ),
                    ],
                  ),
                ),
                  Icon(Icons.alarm, size: 14, color: Color(0xFF9A6B1E)),
              ],
            ),
          )
      
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemCount: 1,
          //   itemBuilder: (context, index) {
          //     final todo = todoData[index];
      
          //     return Container(
          //       margin: EdgeInsets.only(bottom: 10),
          //       padding: EdgeInsets.all(14),
          //       decoration: BoxDecoration(
          //         color: todo['type'] == 'note'
          //             ? Color(0xFFF0E7FF)
          //             : Colors.white,
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Icon(
          //             todo['type'] == 'note'
          //                 ? Icons.description_outlined
          //                 : Icons.circle_outlined,
          //             size: 18,
          //             color: Colors.black87,
          //           ),
          //           SizedBox(width: 10),
          //           Expanded(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   todo['title']?.toString() ?? 'Tanpa judul',
          //                   style: TextStyle(fontSize: 13),
          //                 ),
          //                 SizedBox(height: 4),
          //                 if (todo['start_at'] != null)
          //                   Text(
          //                     todo['start_at'].toString(),
          //                     style: TextStyle(
          //                       fontSize: 11,
          //                       color: Color(0xFF9A6B1E),
          //                     ),
          //                   ),
          //                 if (todo['description'] != null)
          //                   Text(
          //                     todo['description'].toString(),
          //                     style: TextStyle(fontSize: 12),
          //                   ),
          //               ],
          //             ),
          //           ),
          //           if (todo['reminder'] == true)
          //             Icon(Icons.alarm, size: 14, color: Color(0xFF9A6B1E)),
          //         ],
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
