import 'package:coba_login/pages/home_page.dart';
import 'package:coba_login/pages/inbox_page.dart';
import 'package:coba_login/pages/profile_page.dart';
import 'package:coba_login/pages/today_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0; // 0 = Home, 1 = Today, 2 = Inbox, 3 = Profil

  final pages = const [HomePage(), TodayPage(), InboxPage(), ProfilePage()];

  // Modal "Tambah Todo" - dipanggil saat tombol + ditekan
  void showAddTodo() {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    Color selectedColor = const Color(0xFFE5484D); // warna lingkaran yang dipilih
    TimeOfDay? startTime;
    TimeOfDay? endTime;
    bool reminder = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // supaya modal ikut naik saat keyboard muncul
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (modalContext) {
        // StatefulBuilder membuat isi modal bisa berubah (pilih warna, switch, dll.)
        return StatefulBuilder(
          builder: (modalContext, setModalState) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                16,
                20,
                MediaQuery.of(modalContext).viewInsets.bottom + 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Garis kecil di atas modal
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Add Todo',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 16),

                    // Judul
                    TextField(
                      controller: titleController,
                      onChanged: (value) => setModalState(() {}), // supaya tombol Save ikut berubah
                      decoration: InputDecoration(
                        hintText: 'Title',
                        filled: true,
                        fillColor: const Color(0xFFF7F8F9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: Color(0xFFE8EAED)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Deskripsi
                    TextField(
                      controller: descController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Description (optional)',
                        filled: true,
                        fillColor: const Color(0xFFF7F8F9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: Color(0xFFE8EAED)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Pilih warna
                    const Text('Color', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        for (final c in [
                          const Color(0xFFE5484D), // merah
                          const Color(0xFF3B6FE0), // biru
                          const Color(0xFF3FB950), // hijau
                          const Color(0xFF9B51E0), // ungu
                        ])
                          GestureDetector(
                            onTap: () => setModalState(() => selectedColor = c),
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: c,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedColor == c ? Colors.black87 : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              // tanda centang pada warna yang dipilih
                              child: selectedColor == c
                                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                                  : null,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Jam mulai & selesai
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              final picked = await showTimePicker(
                                context: modalContext,
                                initialTime: TimeOfDay.now(),
                              );
                              if (picked != null) setModalState(() => startTime = picked);
                            },
                            icon: const Icon(Icons.access_time, size: 16),
                            label: Text(
                              startTime == null ? 'Start' : startTime!.format(modalContext),
                              style: const TextStyle(fontSize: 13),
                            ),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size.fromHeight(46),
                              foregroundColor: Colors.black87,
                              side: const BorderSide(color: Color(0xFFE5E7EB)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              final picked = await showTimePicker(
                                context: modalContext,
                                initialTime: TimeOfDay.now(),
                              );
                              if (picked != null) setModalState(() => endTime = picked);
                            },
                            icon: const Icon(Icons.access_time, size: 16),
                            label: Text(
                              endTime == null ? 'End' : endTime!.format(modalContext),
                              style: const TextStyle(fontSize: 13),
                            ),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size.fromHeight(46),
                              foregroundColor: Colors.black87,
                              side: const BorderSide(color: Color(0xFFE5E7EB)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Pengingat (ikon alarm)
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Reminder', style: TextStyle(fontSize: 13)),
                      value: reminder,
                      onChanged: (value) => setModalState(() => reminder = value),
                    ),
                    const SizedBox(height: 8),

                    // Tombol Save: nonaktif selama judul masih kosong
                    ElevatedButton(
                      onPressed: titleController.text.trim().isEmpty
                          ? null
                          : () {
                              // Nanti di sini data dikirim ke API (POST /todos)
                              Navigator.pop(modalContext);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Todo berhasil ditambahkan')),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA8F57C),
                        foregroundColor: Colors.black87,
                        disabledBackgroundColor: const Color(0xFFEDEFF1),
                        elevation: 0,
                        minimumSize: const Size.fromHeight(48),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Profil berlatar putih, halaman lain abu-abu muda
      backgroundColor: index == 3 ? Colors.white : const Color(0xFFF6F6F3),

      body: SafeArea(
        child: Column(
          children: [
            // Bar atas (avatar, lonceng, titik tiga). Tidak tampil di Profil.
            if (index != 3)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFD9E6B8)),
                      ),
                      child: const Text('FR', style: TextStyle(fontSize: 10)),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Lonceng dengan titik merah
                          Stack(
                            children: [
                              const Icon(Icons.notifications_none, size: 20),
                              Positioned(
                                right: 2,
                                top: 2,
                                child: Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.more_horiz, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            // Isi halaman sesuai menu yang dipilih
            Expanded(child: pages[index]),
          ],
        ),
      ),

      // Tombol + ungu (hanya di Home dan Today)
      floatingActionButton: index <= 1
          ? GestureDetector(
              onTap: showAddTodo, // buka modal tambah todo
              child: Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFC7B8FF), Color(0xFF8B79F2)],
                  ),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            )
          : null,

      // Menu bawah
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF2F5BEA),
        unselectedItemColor: const Color(0xFFA9B4D0),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event_available_outlined), label: 'Today'),
          BottomNavigationBarItem(icon: Icon(Icons.inbox_outlined), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}