import 'dart:io';
import 'dart:typed_data';
import 'package:excelapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:open_file/open_file.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //OpenFile.open("images/example.pdf");
  }
  final f = new DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now());

  TextEditingController usernameController=TextEditingController();
  TextEditingController placeDescController=TextEditingController(text: "شقة");
  TextEditingController activityController=TextEditingController(text: "منزلى");
  TextEditingController codeController=TextEditingController();
  TextEditingController meterNumberController=TextEditingController();
  TextEditingController fineController=TextEditingController(text: "0.00");
  TextEditingController dofaatController=TextEditingController(text: "0.00");
  TextEditingController madioniaController=TextEditingController(text: "0.00");
  TextEditingController cleaningController=TextEditingController(text: "0.00");
  TextEditingController damgatController=TextEditingController(text: "0.00");
  TextEditingController paidController=TextEditingController();
  TextEditingController exactChargeController=TextEditingController();
  TextEditingController clientController=TextEditingController();
  TextEditingController clientAdress1Controller=TextEditingController();
  TextEditingController clientAdress2Controller=TextEditingController();
  TextEditingController clientAdress3Controller=TextEditingController();

  generatePdf()async{
    final pdf = pw.Document();
    final font = await rootBundle.load("fonts/arial.ttf");
    final ttf = pw.Font.ttf(font);
    var assetImage = pw.MemoryImage(
      (await rootBundle.load('images/aquaview.png'))
          .buffer
          .asUint8List(),
    );
    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.SizedBox(width: 100),
                    pw.Column(
                      children: [
                        pw.Text("إيصال شحن كهرباء",
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(fontSize: 15, font: ttf)),
                        pw.Row(children: [
                          pw.Text("5235447568578",
                              style: pw.TextStyle(fontSize: 12)),
                          pw.Text(" رقم: ",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(fontSize: 12, font: ttf))
                        ])
                      ],
                    ),
                    pw.Container(
                        height: 100,width: 100, child: pw.Image(assetImage)),
                  ],
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: pw.Row(
                    children: [
                      pw.Column(
                        children: [
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.grey500,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "اسم المستخدم",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  font: ttf,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.white,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "${usernameController.text}",
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      pw.Column(
                        children: [
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.grey500,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "وصف المكان",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  font: ttf,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.white,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "${placeDescController.text}",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  font: ttf,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      pw.Column(
                        children: [
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.grey500,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "نوع النشاط",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  font: ttf,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.white,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "${activityController.text}",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  font: ttf,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      pw.Column(
                        children: [
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 80,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.grey500,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "تاريخ الشحن",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  font: ttf,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 80,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.white,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "${ DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now()).toString()}",
                              // "15/01/2021 12:55AM",
                              style: pw.TextStyle(
                                  fontSize: 7,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      pw.Column(
                        children: [
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.grey500,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "رقم العداد",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  font: ttf,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.white,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "${meterNumberController.text}",
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      pw.Column(
                        children: [
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.grey500,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "كود المشترك",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  font: ttf,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.white,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "${codeController.text}",
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                          flex: 1,
                          child: pw.Row(
                            children: [
                              pw.Column(
                                children: [
                                  pw.Container(
                                    alignment: pw.Alignment.center,
                                    width: 70,
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                        color: PdfColors.grey500,
                                        border: pw.Border.all(
                                            color: PdfColors.black, width: 1)),
                                    child: pw.Text(
                                      "الغرامات",
                                      textDirection: pw.TextDirection.rtl,
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          color: PdfColors.black,
                                          font: ttf,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                  ),
                                  pw.Container(
                                    alignment: pw.Alignment.center,
                                    width: 70,
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                        color: PdfColors.white,
                                        border: pw.Border.all(
                                            color: PdfColors.black, width: 1)),
                                    child: pw.Text(
                                      "${fineController.text}",
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          color: PdfColors.black,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              pw.Column(
                                children: [
                                  pw.Container(
                                    alignment: pw.Alignment.center,
                                    width: 70,
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                        color: PdfColors.grey500,
                                        border: pw.Border.all(
                                            color: PdfColors.black, width: 1)),
                                    child: pw.Text(
                                      "الدفعات",
                                      textDirection: pw.TextDirection.rtl,
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          color: PdfColors.black,
                                          font: ttf,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                  ),
                                  pw.Container(
                                    alignment: pw.Alignment.center,
                                    width: 70,
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                        color: PdfColors.white,
                                        border: pw.Border.all(
                                            color: PdfColors.black, width: 1)),
                                    child: pw.Text(
                                      "${dofaatController.text}",
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          color: PdfColors.black,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text("السيد / ${clientController.text}",
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(font: ttf)),
                      )
                    ],
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                          flex: 1,
                          child: pw.Row(
                            children: [pw.Column(
                              children: [
                                pw.Container(
                                  alignment: pw.Alignment.center,
                                  width: 70,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColors.grey500,
                                      border: pw.Border.all(
                                          color: PdfColors.black, width: 1)),
                                  child: pw.Text(
                                    "المديونية",
                                    textDirection: pw.TextDirection.rtl,
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        color: PdfColors.black,
                                        font: ttf,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                ),
                                pw.Container(
                                  alignment: pw.Alignment.center,
                                  width: 70,
                                  height: 20,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColors.white,
                                      border: pw.Border.all(
                                          color: PdfColors.black, width: 1)),
                                  child: pw.Text(
                                    "${madioniaController.text}",
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        color: PdfColors.black,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                              pw.Column(
                                children: [
                                  pw.Container(
                                    alignment: pw.Alignment.center,
                                    width: 70,
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                        color: PdfColors.grey500,
                                        border: pw.Border.all(
                                            color: PdfColors.black, width: 1)),
                                    child: pw.Text(
                                      "رسوم النظافة",
                                      textDirection: pw.TextDirection.rtl,
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          color: PdfColors.black,
                                          font: ttf,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                  ),
                                  pw.Container(
                                    alignment: pw.Alignment.center,
                                    width: 70,
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                        color: PdfColors.white,
                                        border: pw.Border.all(
                                            color: PdfColors.black, width: 1)),
                                    child: pw.Text(
                                      "${cleaningController.text}",
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          color: PdfColors.black,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),

                            ],
                          )),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [pw.Text("${clientAdress3Controller.text}",),
                            pw.Text(" / ",),
                            pw.Text("${clientAdress2Controller.text}",),
                            pw.Text("الطابق",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(font: ttf)),
                            pw.Text(" / ",),
                            pw.Text("${clientAdress1Controller.text}",),
                            pw.Text(" عمارة",
                                textDirection: pw.TextDirection.rtl,
                                style: pw.TextStyle(font: ttf)),
                            pw.Text("العنوان/ ",
                                textDirection: pw.TextDirection.rtl,
                                style: pw.TextStyle(font: ttf)),



                            // pw.Text("${clientAdress2Controller.text}/${clientAdress1Controller.text}",
                            //     textDirection: pw.TextDirection.rtl,
                            //     style: pw.TextStyle(font: ttf)),
                            // pw.Text("${clientAdress3Controller.text}",),
                          ]
                        )
                      )
                    ],
                  ),
                ),
                pw.Padding(
                    padding: const pw.EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                    child:pw.Row(
                        children: [
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Container(
                                alignment: pw.Alignment.center,
                                width: 70,
                                height: 20,
                                decoration: pw.BoxDecoration(
                                    color: PdfColors.grey500,
                                    border: pw.Border.all(
                                        color: PdfColors.black, width: 1)),
                                child: pw.Text(
                                  "رسوم ودمغات",
                                  textDirection: pw.TextDirection.rtl,
                                  style: pw.TextStyle(
                                      fontSize: 10,
                                      font: ttf,
                                      color: PdfColors.black,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ),
                              pw.Container(
                                alignment: pw.Alignment.center,
                                width: 70,
                                height: 20,
                                decoration: pw.BoxDecoration(
                                    color: PdfColors.white,
                                    border: pw.Border.all(
                                        color: PdfColors.black, width: 1)),
                                child: pw.Text(
                                  "${damgatController.text}",
                                  style: pw.TextStyle(
                                      fontSize: 10,
                                      color: PdfColors.black,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ]
                    )

                ),
                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Container(
                          alignment: pw.Alignment.center,
                          width: 70,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              color: PdfColors.white,
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 1)),
                          child: pw.Text(
                            "${paidController.text}",
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(
                                fontSize: 10,
                                color: PdfColors.black,
                                fontWeight: pw.FontWeight.bold),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.center,
                          width: 70,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              color: PdfColors.white,
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 1)),
                          child: pw.Text(
                            "${exactChargeController.text}",
                            style: pw.TextStyle(
                                fontSize: 10,
                                color: PdfColors.black,
                                fontWeight: pw.FontWeight.bold),
                          ),
                        ),
                        pw.Container(
                          alignment: pw.Alignment.center,
                          width: 300,
                          height: 20,
                          decoration: pw.BoxDecoration(
                              color: PdfColors.white,
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 1)),
                          child: pw.Text(
                            "",
                            style: pw.TextStyle(
                                fontSize: 10,
                                color: PdfColors.black,
                                fontWeight: pw.FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                      pw.Column(
                        children: [
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.grey500,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "المبلغ المدفوع",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  font: ttf,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.grey500,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "قيمة الشحن الفعلية",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  font: ttf,
                                  fontSize: 10,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            width: 70,
                            height: 20,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.grey500,
                                border: pw.Border.all(
                                    color: PdfColors.black, width: 1)),
                            child: pw.Text(
                              "ملاحظات",
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  font: ttf,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          )
                        ],
                      ),

                    ]
                )
              ],
            );
          }),
    );
    final file = File('images/example.pdf');
    await file.writeAsBytes(await pdf.save());
    OpenFile.open("images/example.pdf");
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Receipt print"),),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: usernameController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                Username',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("اسم المستخدم")),
                  ],
                ),
                SizedBox(height: 50,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        controller:clientController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                اسم العميل',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,
                        child: Text("اسم العميل")),
                  ],
                ),
                SizedBox(height: 50,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(

                        controller:clientAdress1Controller,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          hintText: '                عمارة',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller:clientAdress2Controller,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          hintText: '                الطابق',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(

                        keyboardType: TextInputType.number,
                        controller:clientAdress3Controller,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          hintText: '                شالية',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("عنوان العميل")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: placeDescController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                وصف المكان',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("وصف المكان")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: activityController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                نوع النشاط',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("نوع النشاط")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: meterNumberController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                رقم العداد',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("رقم العداد")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: codeController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                كود المشترك',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("كود المشترك")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: fineController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          
                          hintText: '                الغرامات',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("الغرامات")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: dofaatController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                الدفعات',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("الدفعات")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: madioniaController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                المديونية',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("المديونية")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: cleaningController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                رسوم النظافة',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("رسوم النظافة")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: damgatController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                رسوم ودمغات',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("رسوم ودمغات")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: paidController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '                المبلغ المدفوع',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("المبلغ المدفوع")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(

                      alignment: Alignment.center,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      width: 260,
                      child: TextField(
                        
                        controller: exactChargeController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),

                          hintText: '        قيمة الشحن الفعلية',
                          hintStyle: kHintTextStyle,
                          
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Container(
                        width: 200,
                        alignment: Alignment.center,child: Text("قيمة الشحن الفعلية")),
                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60.0,
                    width: 260,
                    child: ElevatedButton(onPressed: (){generatePdf();}, child: Text("generate Pdf",style: TextStyle(fontSize: 20),),style: ButtonStyle(
                      alignment: Alignment.center,
                    ),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
Scaffold(

        )
 */

/*
Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  child: Row(
                    children: [
                      Text("اسم المستخدم"),
                      SizedBox(width: 10),
                      Divider(),
                      SizedBox(width: 10),
                      Text("وصف المكان"),
                      SizedBox(width: 10),
                      Divider(),
                      SizedBox(width: 10),
                      Text("نوع النشاط"),
                      SizedBox(width: 10),
                      Divider(),
                      SizedBox(width: 10),
                      Text("تاريخ الشحن"),
                      Divider(),
                      Text("رقم العداد"),
                      Divider(),
                      Text("كود المشترك"),
                      Divider(),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  child: Row(
                    children: [
                      Text("Admin"),
                      Divider(),
                      Text("شقة"),
                      Divider(),
                      Text("منزلي"),
                      Divider(),
                      Text("15/10/2021 1:55AM"),
                      Divider(),
                      Text("1005256"),
                      Divider(),
                      Text("40"),
                      Divider(),

                    ],
                  ),
                ),
              )
 */
