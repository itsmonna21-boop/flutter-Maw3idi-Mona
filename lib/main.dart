import 'package:flutter/material.dart';

void main() {
  runApp(const Maw3idiApp());
}

class Maw3idiApp extends StatelessWidget {
  const Maw3idiApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF1565C0);
    const softBlue = Color(0xFFE3F2FD);

    return MaterialApp(
      title: 'موعدي | Maw3idi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
          primary: primaryBlue,
          secondary: const Color(0xFF0288D1),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: softBlue.withValues(alpha: 0.35),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: primaryBlue, width: 1.8),
          ),
        ),
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const SplashScreen(),
    );
  }
}

/// بيانات مشتركة في الذاكرة أثناء التشغيل فقط (دون قاعدة بيانات)
class AppMemoryStore {
  // حفظ الحسابات: اسم المستخدم -> كلمة المرور
  static final Map<String, String> registeredUsers = {
    'mona': '123456',
  };

  // حفظ المواعيد المؤكدة
  static final List<AppointmentItem> bookedAppointments = [];
}

class MedicalService {
  final String id;
  final String titleAr;
  final String titleEn;
  final String description;
  final IconData icon;
  final String duration;

  const MedicalService({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.description,
    required this.icon,
    required this.duration,
  });
}

class DoctorInfo {
  final String name;
  final String specialty;
  final String serviceId;
  final String clinicRoom;
  final double rating;

  const DoctorInfo({
    required this.name,
    required this.specialty,
    required this.serviceId,
    required this.clinicRoom,
    required this.rating,
  });
}

class AppointmentItem {
  final String id;
  final String patientUsername;
  final MedicalService service;
  final DoctorInfo doctor;
  final String dateLabel;
  final String timeSlot;

  AppointmentItem({
    required this.id,
    required this.patientUsername,
    required this.service,
    required this.doctor,
    required this.dateLabel,
    required this.timeSlot,
  });
}

const List<MedicalService> kServices = [
  MedicalService(
    id: 'dental',
    titleAr: 'طب وتجميل الأسنان',
    titleEn: 'Dental Care',
    description: 'فحص شامل، تنظيف وتلميع، وعلاج التسوس بأجهزة حديثة.',
    icon: Icons.medical_services_outlined,
    duration: '30 دقيقة',
  ),
  MedicalService(
    id: 'derma',
    titleAr: 'الجلدية والعناية بالبشرة',
    titleEn: 'Dermatology',
    description: 'استشارات الجلدية، علاج التصبغات، ومتابعة صحة البشرة.',
    icon: Icons.spa_outlined,
    duration: '25 دقيقة',
  ),
  MedicalService(
    id: 'general',
    titleAr: 'الطب العام والباطنية',
    titleEn: 'General Medicine',
    description: 'الكشف الدوري، متابعة التحاليل، وتقييم الأعراض العامة.',
    icon: Icons.favorite_border,
    duration: '20 دقيقة',
  ),
  MedicalService(
    id: 'vision',
    titleAr: 'العيون وفحص النظر',
    titleEn: 'Ophthalmology',
    description: 'قياس النظر، فحص ضغط العين، واستشارات صحة العيون.',
    icon: Icons.visibility_outlined,
    duration: '25 دقيقة',
  ),
];

const List<DoctorInfo> kDoctors = [
  DoctorInfo(
    name: 'د. سارة المنصور',
    specialty: 'استشارية طب الأسنان',
    serviceId: 'dental',
    clinicRoom: 'عيادة 101',
    rating: 4.9,
  ),
  DoctorInfo(
    name: 'د. ريم الحربي',
    specialty: 'أخصائية طب الأسنان التجميلي',
    serviceId: 'dental',
    clinicRoom: 'عيادة 102',
    rating: 4.8,
  ),
  DoctorInfo(
    name: 'د. نورة العتيبي',
    specialty: 'استشارية الجلدية والليزر',
    serviceId: 'derma',
    clinicRoom: 'عيادة 201',
    rating: 4.9,
  ),
  DoctorInfo(
    name: 'د. لمى القحطاني',
    specialty: 'استشارية الطب العام',
    serviceId: 'general',
    clinicRoom: 'عيادة 301',
    rating: 4.7,
  ),
  DoctorInfo(
    name: 'د. دانة الشمري',
    specialty: 'أخصائية العيون والبصريات',
    serviceId: 'vision',
    clinicRoom: 'عيادة 401',
    rating: 4.8,
  ),
];

/// الشاشة الافتتاحية: تعرض اسم التطبيق واسم الطالبة بالعربي والإنجليزي
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF1976D2), Color(0xFF42A5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.calendar_month_rounded,
                    size: 72,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'موعدي',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Maw3idi',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'تطبيق حجز المواعيد الطبية بسهولة وسرعة',
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'إعداد الطالبة: منى',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Student: Mona',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const CircularProgressIndicator(color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// شاشة 1: تسجيل الدخول
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'يرجى تعبئة جميع الحقول المطلوبة (حقل فارغ).';
      });
      return;
    }

    final savedPassword = AppMemoryStore.registeredUsers[username];
    if (savedPassword == null || savedPassword != password) {
      setState(() {
        _errorMessage = 'بيانات الدخول غير صحيحة، تأكدي من اسم المستخدم وكلمة المرور.';
      });
      return;
    }

    setState(() => _errorMessage = null);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ServicesHomeScreen(currentUsername: username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Icon(Icons.health_and_safety, size: 64, color: Color(0xFF1565C0)),
            const SizedBox(height: 12),
            const Text(
              'أهلاً بك في موعدي',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            const Text(
              'سجّلي الدخول لحجز ومتابعة مواعيدك الطبية',
              style: TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'اسم المستخدم',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.w500),
                ),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: const Text('تسجيل الدخول', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpScreen()),
                );
              },
              child: const Text('ليس لديك حساب؟ إنشاء حساب جديد'),
            ),
          ],
        ),
      ),
    );
  }
}

/// شاشة 2: إنشاء حساب جديد
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;
    final confirm = _confirmController.text;

    if (username.isEmpty || password.isEmpty || confirm.isEmpty) {
      setState(() {
        _errorMessage = 'يرجى تعبئة جميع الحقول المطلوبة (حقل فارغ).';
      });
      return;
    }

    if (AppMemoryStore.registeredUsers.containsKey(username)) {
      setState(() {
        _errorMessage = 'اسم المستخدم مسجّل مسبقاً، يرجى اختيار اسم آخر.';
      });
      return;
    }

    if (password != confirm) {
      setState(() {
        _errorMessage = 'كلمة المرور وتأكيدها غير متطابقين.';
      });
      return;
    }

    AppMemoryStore.registeredUsers[username] = password;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم إنشاء الحساب بنجاح، يمكنك الآن تسجيل الدخول.')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء حساب جديد')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'حساب جديد في موعدي',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'اسم المستخدم',
                prefixIcon: Icon(Icons.person_add_alt_1_outlined),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _confirmController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'تأكيد كلمة المرور',
                prefixIcon: Icon(Icons.lock_reset),
              ),
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.w500),
                ),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSignUp,
              child: const Text('إنشاء الحساب', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

/// شاشة 3: الرئيسية — عرض الخدمات الطبية + بحث سريع + زر حجوزاتي
class ServicesHomeScreen extends StatefulWidget {
  final String currentUsername;
  const ServicesHomeScreen({super.key, required this.currentUsername});

  @override
  State<ServicesHomeScreen> createState() => _ServicesHomeScreenState();
}

class _ServicesHomeScreenState extends State<ServicesHomeScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredServices = kServices.where((service) {
      final q = _searchQuery.trim().toLowerCase();
      if (q.isEmpty) return true;
      return service.titleAr.toLowerCase().contains(q) ||
          service.titleEn.toLowerCase().contains(q) ||
          service.description.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('الخدمات الطبية'),
        actions: [
          IconButton(
            tooltip: 'حجوزاتي',
            icon: const Icon(Icons.event_available),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MyAppointmentsScreen(currentUsername: widget.currentUsername),
                ),
              ).then((_) => setState(() {}));
            },
          ),
          IconButton(
            tooltip: 'تسجيل الخروج',
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'مرحباً، ${widget.currentUsername}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'اختاري الخدمة الطبية المناسبة للانتقال إلى الأطباء:',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 12),
            TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: const InputDecoration(
                hintText: 'ابحثي عن خدمة طبية (مثل: أسنان، جلدية)...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListView.separated(
                itemCount: filteredServices.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final service = filteredServices[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 1.5,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(14),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color(0xFFE3F2FD),
                        child: Icon(service.icon, color: const Color(0xFF1565C0)),
                      ),
                      title: Text(
                        service.titleAr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text('${service.description}\nمدة الجلسة: ${service.duration}'),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorSelectionScreen(
                              currentUsername: widget.currentUsername,
                              selectedService: service,
                            ),
                          ),
                        );
                      },
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

/// شاشة 4: اختيار الطبيب وعرض التخصصات
class DoctorSelectionScreen extends StatelessWidget {
  final String currentUsername;
  final MedicalService selectedService;

  const DoctorSelectionScreen({
    super.key,
    required this.currentUsername,
    required this.selectedService,
  });

  @override
  Widget build(BuildContext context) {
    final matchingDoctors =
        kDoctors.where((doc) => doc.serviceId == selectedService.id).toList();
    final doctorsToShow = matchingDoctors.isNotEmpty ? matchingDoctors : kDoctors;

    return Scaffold(
      appBar: AppBar(title: Text('أطباء ${selectedService.titleAr}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'الخدمة المختارة: ${selectedService.titleAr} — ${selectedService.duration}',
                style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF0D47A1)),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListView.separated(
                itemCount: doctorsToShow.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final doctor = doctorsToShow[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(14),
                      leading: const CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xFF1565C0),
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(
                        doctor.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        '${doctor.specialty} • ${doctor.clinicRoom}\nالتقييم: ⭐ ${doctor.rating}',
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookAppointmentScreen(
                              currentUsername: currentUsername,
                              selectedService: selectedService,
                              selectedDoctor: doctor,
                            ),
                          ),
                        );
                      },
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

/// شاشة 5: حجز الموعد — اختيار اليوم والوقت
class BookAppointmentScreen extends StatefulWidget {
  final String currentUsername;
  final MedicalService selectedService;
  final DoctorInfo selectedDoctor;

  const BookAppointmentScreen({
    super.key,
    required this.currentUsername,
    required this.selectedService,
    required this.selectedDoctor,
  });

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final List<String> _days = const [
    'الأحد 29 نوفمبر',
    'الإثنين 30 نوفمبر',
    'الثلاثاء 1 ديسمبر',
    'الأربعاء 2 ديسمبر',
  ];
  final List<String> _times = const [
    '09:30 ص',
    '11:00 ص',
    '01:30 م',
    '04:00 م',
    '06:30 م',
  ];

  late String _selectedDay;
  late String _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDay = _days.first;
    _selectedTime = _times.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اختيار موعد الحجز')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'الطبيب: ${widget.selectedDoctor.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'الخدمة: ${widget.selectedService.titleAr} (${widget.selectedDoctor.clinicRoom})',
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
            const Text('اختر اليوم:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _days.map((day) {
                final isSelected = day == _selectedDay;
                return ChoiceChip(
                  label: Text(day),
                  selected: isSelected,
                  onSelected: (_) => setState(() => _selectedDay = day),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('اختر الوقت المتاح:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _times.map((time) {
                final isSelected = time == _selectedTime;
                return ChoiceChip(
                  label: Text(time),
                  selected: isSelected,
                  onSelected: (_) => setState(() => _selectedTime = time),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ConfirmBookingScreen(
                      currentUsername: widget.currentUsername,
                      selectedService: widget.selectedService,
                      selectedDoctor: widget.selectedDoctor,
                      dateLabel: _selectedDay,
                      timeSlot: _selectedTime,
                    ),
                  ),
                );
              },
              child: const Text('متابعة إلى تأكيد الحجز', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

/// شاشة 6: تأكيد الحجز وعرض تفاصيل الموعد المحجوز
class ConfirmBookingScreen extends StatelessWidget {
  final String currentUsername;
  final MedicalService selectedService;
  final DoctorInfo selectedDoctor;
  final String dateLabel;
  final String timeSlot;

  const ConfirmBookingScreen({
    super.key,
    required this.currentUsername,
    required this.selectedService,
    required this.selectedDoctor,
    required this.dateLabel,
    required this.timeSlot,
  });

  void _confirmAndSave(BuildContext context) {
    final newAppointment = AppointmentItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      patientUsername: currentUsername,
      service: selectedService,
      doctor: selectedDoctor,
      dateLabel: dateLabel,
      timeSlot: timeSlot,
    );

    AppMemoryStore.bookedAppointments.add(newAppointment);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم تأكيد حجز الموعد بنجاح!')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MyAppointmentsScreen(currentUsername: currentUsername),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تأكيد تفاصيل الموعد')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ملخص الموعد الطبي',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Divider(height: 24),
                    _infoRow('المراجع:', currentUsername),
                    _infoRow('الخدمة الطبية:', selectedService.titleAr),
                    _infoRow('الطبيب:', selectedDoctor.name),
                    _infoRow('التخصص:', selectedDoctor.specialty),
                    _infoRow('العيادة:', selectedDoctor.clinicRoom),
                    _infoRow('اليوم:', dateLabel),
                    _infoRow('الوقت:', timeSlot),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _confirmAndSave(context),
              child: const Text('تأكيد وحفظ الموعد', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

/// شاشة الميزة الإضافية: حجوزاتي وإلغاء الموعد مع رسالة تأكيد
class MyAppointmentsScreen extends StatefulWidget {
  final String currentUsername;
  const MyAppointmentsScreen({super.key, required this.currentUsername});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen> {
  Future<void> _confirmCancel(AppointmentItem item) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('تأكيد إلغاء الموعد'),
        content: Text(
          'هل أنتِ متأكدة من إلغاء موعدك مع ${item.doctor.name} يوم ${item.dateLabel} الساعة ${item.timeSlot}؟',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('تراجع'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('إلغاء الموعد'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        AppMemoryStore.bookedAppointments.removeWhere((a) => a.id == item.id);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إلغاء الموعد بنجاح.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAppointments = AppMemoryStore.bookedAppointments
        .where((a) => a.patientUsername == widget.currentUsername)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('حجوزاتي')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: userAppointments.isEmpty
            ? const Center(
                child: Text(
                  'لا توجد مواعيد محجوزة حالياً.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              )
            : ListView.separated(
                itemCount: userAppointments.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final appt = userAppointments[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${appt.service.titleAr} — ${appt.doctor.name}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text('العيادة: ${appt.doctor.clinicRoom}'),
                          Text('الموعد: ${appt.dateLabel} | ${appt.timeSlot}'),
                          const SizedBox(height: 10),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                              onPressed: () => _confirmCancel(appt),
                              icon: const Icon(Icons.cancel_outlined),
                              label: const Text('إلغاء الموعد'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}