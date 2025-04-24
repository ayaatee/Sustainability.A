// استيراد مكتبات Flutter الأساسية
import 'package:flutter/material.dart';
// استيراد مكتبة مؤقت لتتبع الوقت
import 'dart:async';
// استيراد مكتبة تشغيل الصوت
import 'package:audioplayers/audioplayers.dart';
// استيراد مكتبة تشغيل الفيديو
import 'package:video_player/video_player.dart';

// دالة التشغيل الرئيسية لتشغيل التطبيق
void main() {
  runApp(EnvironmentQuizApp());
}

// تطبيق رئيسي يمثل بداية التطبيق
class EnvironmentQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // بناء واجهة التطبيق
    return MaterialApp(
      debugShowCheckedModeBanner: false, // إخفاء شريط التصحيح
      theme: ThemeData(
        primarySwatch: Colors.green, // استخدام لون أساسي أخضر
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 18, // حجم الخط المتوسط
            fontWeight: FontWeight.w500, // سمك الخط
            color: const Color.fromARGB(255, 3, 3, 3), // لون الخط
          ),
        ),
      ),
      home: WelcomeScreen(), // شاشة الترحيب كواجهة رئيسية
    );
  }
}
// تعريف كلاس شاشة الترحيب كوريث لـ StatelessWidget لعدم الحاجة إلى إدارة حالة متغيرة
class WelcomeScreen extends StatelessWidget {
  @override // يقوم بإعادة تعريف دالة build لتحديد واجهة المستخدم الخاصة بالشاشة
  Widget build(BuildContext context) {
    return Scaffold(   // إرجاع (return) عنصر Scaffold، وهو الهيكل الأساسي لواجهة المستخدم

      // شريط علوي يحتوي على عنوان التطبيق
      appBar: AppBar(title: Text("🌍 اختبار البيئة")),

      // محتوى الشاشة الرئيسي
      body: Container(
        // تحديد خلفية الشاشة
        decoration: BoxDecoration(
          image: DecorationImage(
            // تعيين صورة الخلفية من مجلد الأصول
            image: AssetImage('assets/ii.png'),

            // ضبط الصورة لتغطية كامل الشاشة
            fit: BoxFit.cover,
          ),
        ),

        // جعل المحتوى في وسط الشاشة
        child: Center(
          child: Column(
            // محاذاة العناصر عمودياً في المنتصف
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // يمكن إضافة المزيد من عناصر الواجهة هنا
              // نص ترحيبي رئيسي
              Text(
                "مرحبًا بك! \n هل أنت مستعد لاختبار معرفتك حول البيئة؟ 🌱",
                style: TextStyle(
                  fontSize: 24, // حجم الخط
                  fontWeight: FontWeight.bold, // خط عريض
                  color: Colors.white, // لون الخط أبيض
                ),
                textAlign: TextAlign.center, // توسيط النص
              ),
              SizedBox(height: 40), // مساحة فارغة
              // نص إضافي حول الاستدامة
              Padding(
                padding: const EdgeInsets.all(16.0), // حواف داخلية
                child: Text(
                  "الاستدامة تعني الحفاظ على موارد كوكبنا للأجيال القادمة.\n دعونا نكتشف معًا مدى معرفتك بالبيئة!",
                  style: TextStyle(
                    fontSize: 18, // حجم الخط
                    fontWeight: FontWeight.w400, // سمك الخط
                    color: Colors.black, // لون الخط أسود
                  ),
                  textAlign: TextAlign.center, // توسيط النص
                ),
              ),
              SizedBox(height: 40), // مساحة فارغة
              // زر بدء الاختبار
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), // حجم الزر
                  backgroundColor: Colors.green, // لون الخلفية
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // حواف دائرية
                  ),
                ),
                onPressed: () {  
                  // عند الضغط على الزر، يتم التنقل إلى شاشة الاختبار
                  Navigator.pushReplacement( // استبدال الشاشة الحالية بشاشة الاختبار دون إمكانية الرجوع إليها
                    context,  
                    MaterialPageRoute(builder: (context) => EnvironmentQuizScreen()), // إنشاء مسار جديد يؤدي إلى شاشة الاختبار
                  );  
                },  
                child: Text("ابدأ الاختبار",  
                    style: TextStyle(fontSize: 20, color: Colors.white)), // نص الزر مع تنسيق الخط باللون الأبيض وحجم 20
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// شاشة الاختبار التي تحتوي على الأسئلة والإجابات
class EnvironmentQuizScreen extends StatefulWidget {
  @override
  _EnvironmentQuizScreenState createState() => _EnvironmentQuizScreenState();
}

// الحالة المرتبطة بشاشة الاختبار
class _EnvironmentQuizScreenState extends State<EnvironmentQuizScreen> {
  // قائمة تحتوي على الأسئلة والإجابات الممكنة والإجابة الصحيحة
  final List<Map<String, dynamic>> questions = [
    {
      "question": "ما هو أفضل مصدر للطاقة المتجددة؟",
      "options": ["الفحم", "النفط", "الطاقة الشمسية", "الغاز الطبيعي"],
      "answer": "الطاقة الشمسية",
    },
    {
      "question": "أي من هذه الطرق تساعد في تقليل التلوث؟",
      "options": [
        "إعادة التدوير",
        "حرق النفايات",
        "إلقاء القمامة في الشارع",
        "استخدام البلاستيك"
      ],
      "answer": "إعادة التدوير",
    },
    {
      "question": "ما هو الغرض من زراعة الأشجار؟",
      "options": [
        "توفير الظل فقط",
        "تنقية الهواء",
        "توفير الخشب فقط",
        "تجميل البيئة فقط"
      ],
      "answer": "تنقية الهواء",
    },
    {
      "question": "ماذا يجب أن نفعل للحفاظ على المياه؟",
      "options": [
        "ترك الصنبور مفتوحًا",
        "إصلاح التسريبات",
        "غسل السيارة يوميًا",
        "ري النباتات بكمية كبيرة من الماء"
      ],
      "answer": "إصلاح التسريبات",
    },
    {
      "question": "ما هي الطريقة المثلى للتخلص من النفايات البلاستيكية؟",
      "options": [
        "حرقها",
        "دفنها في الأرض",
        "إعادة تدويرها",
        "رميها في الأنهار"
      ],
      "answer": "إعادة تدويرها",
    },
    {
      "question": "ما هي أكبر مشكلة بيئية يواجهها العالم حاليًا؟",
      "options": ["التصحر", "تلوث المياه", "التغير المناخي", "تلوث الهواء"],
      "answer": "التغير المناخي",
    },
    {
      "question": "ما هي أهمية الحفاظ على التنوع البيولوجي؟",
      "options": [
        "للحفاظ على الطعام فقط",
        "لتوفير الطاقة",
        "لتوازن النظام البيئي",
        "لزيادة الإنتاج الزراعي"
      ],
      "answer": "لتوازن النظام البيئي",
    },
    {
      "question": "ماذا يعني مصطلح 'التنمية المستدامة'؟",
      "options": [
        "استهلاك الموارد الطبيعية بشكل مفرط",
        "استخدام الطاقة المتجددة فقط",
        "تلبية احتياجات الحاضر دون التأثير على المستقبل",
        "زيادة الإنتاج الصناعي"
      ],
      "answer": "تلبية احتياجات الحاضر دون التأثير على المستقبل",
    },
    {
      "question": "ما هي الآثار السلبية لاستخدام المواد الكيميائية في الزراعة؟",
      "options": [
        "تحسين نمو المحاصيل",
        "تلوث المياه والتربة",
        "زيادة عدد المحاصيل",
        "تحسين التنوع البيولوجي"
      ],
      "answer": "تلوث المياه والتربة",
    },
    {
      "question": "كيف يمكن تقليل استخدام البلاستيك في حياتنا اليومية؟",
      "options": [
        "استخدام البلاستيك القابل للتحلل",
        "استخدام المنتجات البلاستيكية ذات الاستخدام الواحد",
        "إعادة استخدام المواد البلاستيكية",
        "التخلص من البلاستيك في المحيطات"
      ],
      "answer": "إعادة استخدام المواد البلاستيكية",
    } 
    // المزيد من الأسئلة بنفس التنسيق
  ];

  int currentQuestionIndex = 0; // فهرس السؤال الحالي
  int score = 0; // عدد النقاط
  int timeLeft = 20; // الوقت المتبقي لكل سؤال
  Timer? timer; // كائن المؤقت
  final AudioPlayer audioPlayer = AudioPlayer(); // كائن لتشغيل الصوت
  bool questionAnswered = false; // حالة السؤال (تمت الإجابة أم لا)
  String selectedAnswer = ''; // الإجابة المحددة

  @override
  void initState() {
    super.initState();
    audioPlayer.setSource(AssetSource('clep.mp3')); // تعيين مصدر الصوت
    startTimer(); // بدء المؤقت
  }

  // بدء المؤقت للسؤال الحالي
  void startTimer() {
    timer?.cancel(); // إلغاء أي مؤقت سابق
    setState(() {
      timeLeft = 20; // إعادة ضبط الوقت
      questionAnswered = false; // إعادة حالة الإجابة
      selectedAnswer = ''; // مسح الإجابة المحددة
    });
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (timeLeft > 0) {
        setState(() => timeLeft--); // تقليل الوقت
      } else {
        if (!questionAnswered) {
          questionAnswered = true;
          nextQuestion(); // الانتقال إلى السؤال التالي
        }
      }
    });
  }

  // الانتقال إلى السؤال التالي
  void nextQuestion() {
    timer?.cancel(); // إيقاف المؤقت الحالي
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++; // تحديث فهرس السؤال
        selectedAnswer = ''; // مسح الإجابة المحددة
      });
      startTimer(); // بدء مؤقت جديد
    } else {
      showResult(); // عرض النتيجة عند الانتهاء
    }
  }

  // التحقق من صحة الإجابة المحددة
  Future<void> checkAnswer(String selected) async {
    if (questionAnswered) return; // منع الإجابة المكررة
    setState(() {
      selectedAnswer = selected; // تحديث الإجابة المحددة
      questionAnswered = true; // تحديث حالة الإجابة
    });

    if (selected == questions[currentQuestionIndex]["answer"]) {
      setState(() => score++); // زيادة النقاط إذا كانت الإجابة صحيحة
      await _playSuccessSound(); // تشغيل صوت النجاح
    }

    nextQuestion(); // الانتقال إلى السؤال التالي
  }

  // تشغيل صوت النجاح عند الإجابة الصحيحة
  Future<void> _playSuccessSound() async {
    try {
      await audioPlayer.play(AssetSource('clep.mp3')); // تشغيل الصوت
      await Future.delayed(Duration(milliseconds: 300)); // انتظار لمدة قصيرة
    } catch (e) {
      print("Error playing sound: $e"); // طباعة خطأ إذا حدث
    }
  }

  // عرض النتيجة النهائية في نافذة منبثقة
  void showResult() {
    showDialog(
      context: context,
      barrierDismissible: false, // منع إغلاق النافذة عند النقر خارجها
      builder: (BuildContext context) => AlertDialog(
        title: Text("نتيجة الاختبار"), // عنوان النافذة
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("لقد حصلت على $score من ${questions.length}."), // عرض النتيجة
            SizedBox(height: 10), // مساحة بين النصوص
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayerScreen()), // فتح شاشة الفيديو
                );
              },
              child: Text(
                "تعرف اكثر عن الاستدامة",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline, // خط أسفل النص
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // إغلاق النافذة
              restartGame(); // إعادة تشغيل اللعبة
            },
            child: Text("إعادة اللعبة"), // نص الزر
          ),
        ],
      ),
    );
  }

  // إعادة تشغيل اللعبة من البداية
  void restartGame() {
    setState(() {
      currentQuestionIndex = 0; // إعادة فهرس السؤال
      score = 0; // إعادة النقاط
    });
    startTimer(); // بدء المؤقت من جديد
  }

  @override
  void dispose() {
    timer?.cancel(); // إلغاء المؤقت
    audioPlayer.dispose(); // تحرير الموارد المرتبطة بالصوت
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex]; // السؤال الحالي
    return Scaffold(
      appBar: AppBar(title: Text("اختبار البيئة - النقاط: $score")), // عرض النقاط في الشريط العلوي
      body: Padding(
        padding: const EdgeInsets.all(16.0), // مسافة حول المحتوى
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // توسيط العمود
          children: [
            SizedBox(height: 20),
            Text(
              currentQuestion["question"], // نص السؤال
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), // تنسيق النص
              textAlign: TextAlign.center, // توسيط النص
            ),
            SizedBox(height: 20),
            // عرض خيارات الإجابة
            ...currentQuestion["options"].map<Widget>((option) {
              // تحديد لون الزر بناءً على الحالة
              Color buttonColor = questionAnswered
                  ? (option == currentQuestion["answer"]
                      ? Colors.green
                      : (option == selectedAnswer ? Colors.red : Colors.black))
                  : Color.fromARGB(255, 84, 208, 206);

              return ElevatedButton(
                onPressed: questionAnswered ? null : () => checkAnswer(option), // تفعيل الزر
                style: ElevatedButton.styleFrom(backgroundColor: buttonColor), // لون الزر
                child: Text(option, style: TextStyle(fontSize: 18)), // نص الخيار
              );
            }).toList(),
            SizedBox(height: 20),
            // عرض الوقت المتبقي
            Text("الوقت المتبقي: $timeLeft",
                style: TextStyle(fontSize: 18, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
// شاشة لعرض فيديو عن الاستدامة
class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

// الحالة المرتبطة بشاشة الفيديو
class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller; // كائن للتحكم في مشغل الفيديو

  @override
  void initState() {
    super.initState();
    // تهيئة مشغل الفيديو مع ملف الفيديو من مجلد الأصول
    _controller = VideoPlayerController.asset('assets/eee.mp4')
      ..initialize().then((_) {
        setState(() {}); // إعادة بناء الواجهة بعد التهيئة
        _controller.play(); // بدء تشغيل الفيديو تلقائيًا
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // تحرير موارد الفيديو عند الإغلاق
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("مشاهدة الفيديو")), // شريط علوي بعنوان
      body: Center(
        // عرض الفيديو أو مؤشر التحميل إذا لم يكتمل التهيئة
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio, // نسبة العرض إلى الارتفاع
                child: VideoPlayer(_controller), // مشغل الفيديو
              )
            : CircularProgressIndicator(), // مؤشر تحميل الفيديو
      ),
    );
  }
}
