
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:tractivity_app/utils/app_colors/app_colors.dart';
import 'package:tractivity_app/view/components/custom_royel_appbar/custom_royel_appbar.dart';
import 'package:tractivity_app/view/components/custom_text/custom_text.dart';
import 'package:tractivity_app/view/screens/organizer_home_screen/organizer_controller/organizer_controller.dart';

class AdminstratorOrganizationReportScreen extends StatefulWidget {
  const AdminstratorOrganizationReportScreen({super.key});

  @override
  State<AdminstratorOrganizationReportScreen> createState() => _AdminstratorOrganizationReportScreenState();
}

class _AdminstratorOrganizationReportScreenState extends State<AdminstratorOrganizationReportScreen> {

  final _searchController = TextEditingController();

  final  organizerController = Get.find<OrganizerController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){

      final isTablet = constraints.maxWidth > 600;

      return Scaffold(

        floatingActionButton: FloatingActionButton.extended(onPressed: ()async{

          await requestPermissions();
          await generateAndDownloadPDF();
        },
          backgroundColor: Colors.amber,
          label: Row(
            children: [

              CustomText(
                textAlign: TextAlign.start,
                text: "Download",
                fontSize:isTablet?6.sp: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
                bottom: 5,
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(Icons.arrow_circle_down_outlined,color: Colors.white,),
            ],
          ),),
        appBar: CustomRoyelAppbar(
          leftIcon: true,
          titleName: "Organization Report",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CustomText(
                  textAlign: TextAlign.start,
                  text: "Organization",
                  fontSize:isTablet?6.sp: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                  bottom: 5,
                ),

                CustomText(
                  text: "Donation Organization",
                  fontSize:isTablet?6.sp: 16.sp,
                  color: AppColors.black_80,
                  fontWeight: FontWeight.w600,
                  bottom: 6.h,
                ),

                CustomText(
                  text: "Empowering communities  worldwide  through education, healthcare,  and sustainable development initiatives.",
                  fontSize: 12,
                  color: AppColors.black_02,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                  bottom: 4.h,// Add ellipsis at the end if the text overflows.
                ),

                const Divider(
                  color: Colors.black54,
                ),

                SizedBox(
                  height: 12.h,
                ),
                CustomText(
                  textAlign: TextAlign.start,
                  text: "Mission",
                  fontSize:isTablet?6.sp: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                  bottom: 8.h,
                ),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'search name..',
                      hintStyle: TextStyle(fontSize: 14.0),
                      filled: true,
                      fillColor:AppColors.grey_3.withOpacity(0.5),
                      prefixIcon: Icon(Icons.search, color: Colors.black54),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.black54),
                        onPressed: (){},
                      )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    onChanged: (query) {
                      // Handle search query change (e.g., filtering data)
                    },
                  ),
                ),

                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: TextFormField(
                    showCursor: false,
                    readOnly: true,
                    textAlign: TextAlign.center,
                    onTap: (){
                      organizerController.eventSearchDate();
                    },
                    controller: organizerController.eventSearchDateController.value,
                    decoration: InputDecoration(
                      hintText: "00/00/0000",
                      hintStyle: TextStyle(fontSize: 12.0),
                      filled: true,
                      fillColor:AppColors.grey_3.withOpacity(0.5),
                      ///prefixIcon: Icon(Icons.search, color: Colors.black54),
                      suffixIcon: organizerController.eventSearchDateController.value.text.isNotEmpty
                          ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.black54),
                        onPressed: (){
                          organizerController.eventSearchDateController.value.clear();
                          FocusScope.of(context).unfocus();
                        },
                      ) : IconButton(onPressed: (){
                        organizerController.eventSearchDate();
                      }, icon: Icon(Icons.calendar_month)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(4),
                    ),
                    onChanged: (query) {
                      // Handle search query change (e.g., filtering data)
                    },
                  ),
                ),


              ],
            ),

                SizedBox(
                  height: 8.h,
                ),
                Column(children: List.generate(6, (index) {

                  return Card(
                    color: Colors.white,
                    elevation: 0.2,
                    child: ExpansionTile(
                      shape: Border(),
                      title: Text("Mission Horizons Foundation"),

                      children: [

                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: AppColors.grey_3.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                CustomText(
                                  textAlign: TextAlign.start,
                                  text: "Hours 3.5 ",
                                  maxLines: 3,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),

                                SizedBox(
                                  height: 4.h,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    CustomText(
                                      textAlign: TextAlign.start,
                                      text: "Mileage: 186.9 ",
                                      maxLines: 3,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      bottom: 5,
                                    ),

                                    FloatingActionButton.small(onPressed: (){},
                                      backgroundColor: Colors.amber,
                                      child: Icon(Icons.arrow_circle_down_outlined,color: Colors.white,),)
                                  ],
                                ),

                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  );
                })
                )
              ],
            ),
          ),
        ),

      );
    });
  }



  Future<void> requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      // You can now use storage
    } else {
      // Handle permission denial
    }
  }


  Future<void> generateAndDownloadPDF() async {
    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [

              pw.Text(
                "Organization:",
                style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold, color: PdfColors.blue),
              ),

              pw.SizedBox(height: 8),
              pw.Text(
                "Donation Organization",
                style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold, color: PdfColors.black,),
              ),
              pw.Text(
                "Empowering communities worldwide through education, healthcare, and sustainable development initiatives.",
                style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
                maxLines: 3,
                overflow: pw.TextOverflow.clip,
              ),

              pw.Divider(),

              pw.SizedBox(height: 12),
              pw.Container(
                padding: pw.EdgeInsets.all(8),
                height: 30.h,
                width: 150.w,
                alignment: pw.Alignment.centerLeft,
                decoration: pw.BoxDecoration(
                  color: PdfColors.grey100,
                  borderRadius: pw.BorderRadius.circular(15),
                ),
                child: pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 8),
                  child: pw.Text(
                    textAlign: pw.TextAlign.start,
                    "Report for 2025",
                    style: pw.TextStyle(fontSize: 12, color: PdfColors.black),
                  ),
                ),
              ),
              pw.SizedBox(height: 12),
              // Event List Section Title
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    "Mission",
                    style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, color: PdfColors.blue),
                  ),
                  // Search Bar (Search Date)

                ],
              ),
              pw.SizedBox(height: 8),

              // Event List - Generate 3 events
              for (int i = 0; i < 6; i++)
                pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [

                    pw.Text("Mission Horizons Foundation",style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(bottom: 16),
                      alignment: pw.Alignment.centerLeft,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.grey100,
                        borderRadius: pw.BorderRadius.circular(15),
                      ),
                      child: pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              "Hours 3.5",
                              style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
                            ),
                            pw.SizedBox(height: 4),
                            pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  "Mileage: 186.9",
                                  style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            ],
          );
        },
      ),
    );

    // Save the generated PDF to a file
    final outputDirectory = await getExternalStorageDirectory();
    final file = File('${outputDirectory!.path}/generated_pdf.pdf');
    await file.writeAsBytes(await pdf.save());

    // Open the file for viewing
    OpenFile.open(file.path);
  }
}
