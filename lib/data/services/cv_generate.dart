import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../core/core.dart';

import '../models/models.dart';
import 'pdf_service.dart';

class CVGenerate {
  Future<File> generate({
    required UserModel? userData,
    required StudentProfileModel? studentProfileData,
    required ProfileModel? profileData,
  }) async {
    final pdf = pw.Document();
    final pdfService = PdfService();
    // final children = <pw.Widget>[
    //   pw.Row(
    //     crossAxisAlignment: pw.CrossAxisAlignment.start,
    //     children: [
    //       // /===== Contact Info Component =====//
    //       pw.Expanded(
    //         flex: 33,
    //         child: pw.ConstrainedBox(
    //           constraints: const pw.BoxConstraints(
    //             minWidth: double.infinity,
    //             minHeight: 839,
    //             // maxHeight: double.infinity,
    //           ),
    //           child: contactInfoComponent(
    //             userData: userData,
    //             studentData: studentProfileData,
    //           ),
    //         ),
    //         // ),
    //       ),
    //       // ===== Contact Info Component =====//

    //       // /===== Personal Info Component =====//
    //       pw.Expanded(
    //         flex: 67,
    //         child: personalInfoComponent(
    //           studentData: studentProfileData,
    //           profileData: profileData,
    //         ),
    //       ),
    //       // ===== Personal Info Component =====//
    //     ],
    //   ),
    // ];

    pdf.addPage(
      pw.MultiPage(
        // pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(1.0),
        build: (context) => <pw.Widget>[
          pw.Wrap(
            // children: children,
            children: [
              // List<Widget>.generate(
              //     studentProfileData!.experiences!.length, (int index) {
              //   final issue = studentProfileData.experiences![index];
              //   return Container(
              //     child: Column(
              //       children: <Widget>[
              //         Header(
              //           text: "Issue n°${issue.id}",
              //           textStyle: const TextStyle(fontSize: 20),
              //         ),
              //         SizedBox(height: 100),
              //         Text(
              //           "Description :",
              //           textAlign: TextAlign.left,
              //           style: const TextStyle(fontSize: 15),
              //         ),
              //       ],
              //     ),
              //   );
              // }),
              // for (var i = 0; i < 8; i++)
              //   if (i == 0)
              //     pw.Row(
              //       crossAxisAlignment: pw.CrossAxisAlignment.start,
              //       children: [
              //         pw.Expanded(
              //           flex: 33,
              //           // child: pw.ConstrainedBox(
              //           //   constraints: const pw.BoxConstraints(
              //           //     minWidth: double.infinity,
              //           //     minHeight: 839,
              //           //     // maxHeight: double.infinity,
              //           //   ),
              //           child: contactInfoComponent(
              //             userData: userData,
              //             studentData: studentProfileData,
              //           ),
              //           // ),
              //           // ),
              //         ),
              //         pw.Expanded(
              //           flex: 67,
              //           child: pw.Container(
              //             padding: const pw.EdgeInsets.symmetric(
              //               horizontal: 10.0 * PdfPageFormat.mm,
              //               vertical: 12.0 * PdfPageFormat.mm,
              //             ),
              //             child: pw.Wrap(
              //               children: [
              //                 //                       pw.Column(
              //                 // crossAxisAlignment: pw.CrossAxisAlignment.start,
              //                 // children: [
              //                 ///===== Job Title Component =====//
              //                 textWidgetPdf(
              //                   text: 'jobTitle',
              //                   fontSize: 20.0,
              //                   fontWeight: pw.FontWeight.bold,
              //                   fontColor: PdfColor.fromHex('#fda10d'),
              //                 ),
              //                 //===== Job Title Component =====//

              //                 ///===== Description Component =====//
              //                 infoSectionComponent(
              //                   title: 'Description',
              //                   contentWidget: textWidgetPdf(
              //                     text: '${profileData!.description}',
              //                     topPadding: 2.0,
              //                     bottomPadding: 4.0,
              //                   ),
              //                 ),
              //                 //===== Description Component =====//
              //                 // pw.ListView(
              //                 //   children: buildPdfPersonalData(
              //                 //     studentProfileData!.experiences,
              //                 //   ),
              //                 // ),
              //                 // pw.ListView(
              //                 //   children: buildPdfPersonalData(
              //                 //     studentProfileData.experiences,
              //                 //   ),
              //                 // ),
              //                 // pw.ListView(
              //                 //   children: buildPdfPersonalData(
              //                 //     studentProfileData.experiences,
              //                 //   ),
              //                 // )
              //               ],
              //             ),
              //           ),
              //         )
              //       ],
              //     )
              //   else if (i == 1)
              //     pw.Row(
              //       crossAxisAlignment: pw.CrossAxisAlignment.start,
              //       children: [
              //         pw.Expanded(
              //           flex: 33,
              //           child: pw.Container(),
              //           // ),
              //         ),
              //         pw.Expanded(
              //           flex: 67,
              //           child: pw.Container(
              //             padding: const pw.EdgeInsets.symmetric(
              //               horizontal: 10.0 * PdfPageFormat.mm,
              //               vertical: 12.0 * PdfPageFormat.mm,
              //             ),
              //             child: pw.Wrap(
              //               children: [
              //                 //                       pw.Column(
              //                 // crossAxisAlignment: pw.CrossAxisAlignment.start,
              //                 // children: [
              //                 ///===== Job Title Component =====//
              //                 textWidgetPdf(
              //                   text: 'jobTitle',
              //                   fontSize: 20.0,
              //                   fontWeight: pw.FontWeight.bold,
              //                   fontColor: PdfColor.fromHex('#fda10d'),
              //                 ),
              //                 //===== Job Title Component =====//

              //                 ///===== Description Component =====//
              //                 infoSectionComponent(
              //                   title: 'Description',
              //                   contentWidget: textWidgetPdf(
              //                     text: '${profileData!.description}',
              //                     topPadding: 2.0,
              //                     bottomPadding: 4.0,
              //                   ),
              //                 ),
              //                 //===== Description Component =====//
              //                 // pw.ListView(
              //                 //   children: buildPdfPersonalData(
              //                 //     studentProfileData!.experiences,
              //                 //   ),
              //                 // ),
              //                 // pw.ListView(
              //                 //   children: buildPdfPersonalData(
              //                 //     studentProfileData.experiences,
              //                 //   ),
              //                 // ),
              //                 // pw.ListView(
              //                 //   children: buildPdfPersonalData(
              //                 //     studentProfileData.experiences,
              //                 //   ),
              //                 // )
              //               ],
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              // pw.ListView(
              //   children: // [
              // infoSectionComponent(
              //   title: 'Personal Experiences',
              //   contentWidget: pw.Column(
              //     crossAxisAlignment: pw.CrossAxisAlignment.start,
              //     children: studentProfileData!.experiences!
              //         .map(
              //           (e) => e.type == AppStrings.personalKey
              //               ? sectionCardComponent(
              //                   textTitle: '${e.name}',
              //                   textLocation: '${e.company}',
              //                   textDate:
              //                       '${e.attendedFromTo} at ${e.companyCityAndCountry}',
              //                   textDescription: e.description,
              //                 )
              //               : pw.Container(),
              //         )
              //         .toList(),
              //   ),
              // ),
              // infoSectionComponent(
              //   title: 'Personal Experiences',
              //   contentWidget: pw.Column(
              //     crossAxisAlignment: pw.CrossAxisAlignment.start,
              //     children: studentProfileData.experiences!
              //         .map(
              //           (e) => e.type == AppStrings.personalKey
              //               ? sectionCardComponent(
              //                   textTitle: '${e.name}',
              //                   textLocation: '${e.company}',
              //                   textDate:
              //                       '${e.attendedFromTo} at ${e.companyCityAndCountry}',
              //                   textDescription: e.description,
              //                 )
              //               : pw.Container(),
              //         )
              //         .toList(),
              //   ),
              // ),
              // infoSectionComponent(
              //   title: 'Personal Experiences',
              //   contentWidget: pw.Column(
              //     crossAxisAlignment: pw.CrossAxisAlignment.start,
              //     children:
              //         buildPdfPersonalData(studentProfileData!.experiences),
              // studentProfileData.experiences!
              //     .map(
              //       (e) => e.type == AppStrings.personalKey
              //           ? sectionCardComponent(
              //               textTitle: '${e.name}',
              //               textLocation: '${e.company}',
              //               textDate:
              //                   '${e.attendedFromTo} at ${e.companyCityAndCountry}',
              //               textDescription: e.description,
              //             )
              //           : pw.Container(),
              //     )
              //     .toList(),
              //   ),
              // ),
              // buildPdfPersonalData(studentProfileData!.experiences),
              // ],
              // ),
              // pw.ListView(
              //   children: buildPdfPersonalData(studentProfileData.experiences),
              // ),
              // pw.ListView(
              //   children: buildPdfPersonalData(studentProfileData.experiences),
              // )
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // ///===== Contact Info Component =====//
                  pw.Expanded(
                    flex: 33,
                    child: pw.ConstrainedBox(
                      constraints: const pw.BoxConstraints(
                        minWidth: double.infinity,
                        minHeight: 839,
                        // maxHeight: double.infinity,
                      ),
                      child: contactInfoComponent(
                        userData: userData,
                        studentData: studentProfileData,
                      ),
                    ),
                    // ),
                  ),
                  // ===== Contact Info Component =====//

                  // /===== Personal Info Component =====//
                  pw.Expanded(
                    flex: 67,
                    child: personalInfoComponent(
                      studentData: studentProfileData,
                      profileData: profileData,
                    ),
                  ),
                  // ===== Personal Info Component =====//
                ],
              ),
            ],
          ),
        ],
      ),
    );

    return pdfService.saveDocument(
      name:
          'Pooulp_CV_${userData!.profile!.firstName}_${userData.profile!.lastName}.pdf',
      pdf: pdf,
    );
  }

  List<pw.Widget> buildPdfPersonalData(List<ExperienceModel>? expList) {
    return <pw.Widget>[
      for (var index = 0; index < expList!.length; index++)
        pw.Container(
          child: expList[index].type == AppStrings.personalKey
              ? sectionCardComponent(
                  textTitle: '${expList[index].name}',
                  textLocation: '${expList[index].company}',
                  textDate:
                      '${expList[index].attendedFromTo} at ${expList[index].companyCityAndCountry}',
                  textDescription: expList[index].description,
                )
              : pw.Container(),
        )
    ];
  }

  pw.Widget contactInfoComponent({
    required UserModel? userData,
    required StudentProfileModel? studentData,
  }) =>
      pw.Container(
        // height: 839,
        alignment: pw.Alignment.topLeft,
        // margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
        padding: const pw.EdgeInsets.symmetric(
          horizontal: 10.0 * PdfPageFormat.mm,
          vertical: 12.0 * PdfPageFormat.mm,
        ),
        decoration: pw.BoxDecoration(
          color: PdfColor.fromHex('#364454'),
          // border:
          //     BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Text(
            //   userData!.profile!.fullName,
            //   style: TextStyle(
            //     color: PdfColors.white,
            //     fontSize: 16.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            ///===== Full Name Component =====//
            textWidgetPdf(
              text: userData!.profile!.fullName,
              fontSize: 16.0,
              fontWeight: pw.FontWeight.bold,
              fontColor: PdfColors.white,
            ),
            //===== Full Name Component =====//

            ///===== Address Component =====//
            textWidgetPdf(
              text:
                  '${userData.profile!.addressCity}, ${userData.profile!.addressCountry}',
              fontColor: PdfColors.white,
            ),
            //===== Address Component =====//

            sizeBoxPdf(
              width: 8.0,
              height: 8.0,
              isDivider: true,
              dividerColor: PdfColors.white,
            ),

            ///===== Details Component =====//
            textWidgetPdf(
              text: 'Details',
              fontSize: 16.0,
              fontWeight: pw.FontWeight.bold,
              fontColor: PdfColors.white,
              topPadding: 4.0,
              bottomPadding: 4.0,
            ),
            //===== Details Component =====//

            ///===== Full Address Component =====//
            textWidgetPdf(
              text: '${userData.profile!.addressStreet}',
              fontColor: PdfColors.white,
              bottomPadding: 4.0,
            ),
            //===== Full Address Component =====//

            ///===== Email Component =====//
            textWidgetPdf(
              text: '${userData.email}',
              fontColor: PdfColors.white,
            ),
            //===== Email Component =====//

            ///===== Phone Number Component =====//
            textWidgetPdf(
              text: userData.profile!.fullPhone1Format,
              fontColor: PdfColors.white,
            ),
            //===== Phone Number Component =====//

            ///===== Birth Date Component =====//
            textWidgetPdf(
              text: 'Birthdate: ${userData.profile!.birthDateFormat}',
              fontColor: PdfColors.white,
            ),
            //===== Birth Date Component =====//

            ///===== LinkedIn Profile Component =====//
            textWidgetPdf(
              text: 'LinkedIn profile:',
              fontColor: PdfColors.white,
              topPadding: 4.0,
            ),
            textWidgetPdf(
              text: '${studentData!.linkedinLink}',
              fontColor: PdfColors.white,
            ),
            //===== LinkedIn Profile Component =====//

            ///===== Video Presentation Link Component =====//
            textWidgetPdf(
              text: 'Video presentation link:',
              fontColor: PdfColors.white,
              topPadding: 4.0,
            ),
            textWidgetPdf(
              text: '${studentData.youtubeLink}',
              fontColor: PdfColors.white,
            ),
            //===== Video Presentation Link Component =====//
          ],
        ),
      );

  pw.Widget personalInfoComponent({
    String? jobTitle = 'IT - Developer',
    required StudentProfileModel? studentData,
    required ProfileModel? profileData,
  }) =>
      pw.Container(
        // alignment: pw.Alignment.topLeft,
        // margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
        padding: const pw.EdgeInsets.symmetric(
          horizontal: 10.0 * PdfPageFormat.mm,
          vertical: 12.0 * PdfPageFormat.mm,
        ),
        // decoration: BoxDecoration(
        //   color: PdfColors.white,
        //   // border:
        //   //     BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)
        // ),
        child: pw.Wrap(
          // crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            ///===== Job Title Component =====//
            textWidgetPdf(
              text: '$jobTitle',
              fontSize: 20.0,
              fontWeight: pw.FontWeight.bold,
              fontColor: PdfColor.fromHex('#fda10d'),
            ),
            //===== Job Title Component =====//

            ///===== Description Component =====//
            infoSectionComponent(
              title: 'Description',
              contentWidget: textWidgetPdf(
                text: '${profileData!.description}',
                topPadding: 2.0,
                bottomPadding: 4.0,
              ),
            ),
            //===== Description Component =====//

            ///===== Education Component =====//
            // pw.Wrap(
            //   children: [
            infoSectionComponent(
              title: 'Education',
              contentWidget: pw.ListView.builder(
                itemCount: studentData!.educations!.length,
                itemBuilder: (context, index) {
                  final item = studentData.educations![index];
                  return sectionCardComponent(
                    textTitle: item.school!.name,
                    textLocation: '${item.degree}, ${item.name}',
                    textDate:
                        '${item.attendedFromTo} at ${item.schoolCityAndCountry}',
                    textDescription: item.description,
                  );
                },
              ),
            ),
            //   ],
            // ),

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: studentData!.educations!
            //       .map(
            //         (e) => sectionCardComponent(
            //           textTitle: e.school!.name,
            //           textLocation: '${e.degree}, ${e.name}',
            //           textDate:
            //               '${e.attendedFromTo} at ${e.schoolCityAndCountry}',
            //           textDescription: e.description,
            //         ),
            //       )
            //       .toList(),
            // ),

            //===== Education Component =====//

            ///===== Professional Experiences Component =====//
            // infoSectionComponent(
            //   title: 'Professional Experiences',
            //   contentWidget: pw.ListView.builder(
            //     itemCount: studentData.experiences!.length,
            //     itemBuilder: (context, index) {
            //       final item = studentData.experiences![index];
            //       return item.type == AppStrings.professionalKey
            //           ? sectionCardComponent(
            //               textTitle: item.name,
            //               textLocation: '${item.company}',
            //               textDate:
            //                   '${item.attendedFromTo} at ${item.companyCityAndCountry}',
            //               textDescription: item.description,
            //             )
            //           : pw.Container();
            //     },
            //   ),
            // ),
            // pw.Wrap(
            //   children: [
            infoSectionComponent(
              title: 'Professional Experiences',
              contentWidget: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: studentData.experiences!
                    .map(
                      (e) => e.type == AppStrings.professionalKey
                          ? sectionCardComponent(
                              textTitle: '${e.name}',
                              textLocation: '${e.company}',
                              textDate:
                                  '${e.attendedFromTo} at ${e.companyCityAndCountry}',
                              textDescription: e.description,
                            )
                          : pw.Container(),
                    )
                    .toList(),
              ),
            ),
            //   ],
            // ),

            //===== Professional Experiences Component =====//

            ///===== Personal Experiences Component =====//
            // pw.Wrap(
            //   children: [
            //     infoSectionComponent(
            //       title: 'Personal Experiences',
            //       contentWidget: pw.Column(
            //         crossAxisAlignment: pw.CrossAxisAlignment.start,
            //         children: studentData.experiences!
            //             .map(
            //               (e) => e.type == AppStrings.personalKey
            //                   ? sectionCardComponent(
            //                       textTitle: '${e.name}',
            //                       textLocation: '${e.company}',
            //                       textDate:
            //                           '${e.attendedFromTo} at ${e.companyCityAndCountry}',
            //                       textDescription: e.description,
            //                     )
            //                   : pw.Container(),
            //             )
            //             .toList(),
            //       ),
            //     ),
            //   ],
            // ),

            //===== Personal Experiences Component =====//
          ],
        ),
      );

  ///===== Info Scetion for PDF Component =====//
  pw.Column infoSectionComponent({
    String? title,
    pw.Widget? contentWidget,
  }) =>
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          textWidgetPdf(
            text: '$title',
            fontSize: 16.0,
            fontWeight: pw.FontWeight.bold,
            fontColor: PdfColors.grey700,
            topPadding: 4.0,
          ),
          sizeBoxPdf(
            width: double.infinity,
            height: 2.0,
            dividerThickness: 0.5,
            isDivider: true,
            dividerColor: PdfColors.grey500,
          ),
          contentWidget!,
        ],
      );
  //===== Info Scetion for PDF Component =====//

  ///===== Scetion Card for PDF Component =====//
  pw.Column sectionCardComponent({
    String? textTitle = '',
    String? textLocation = '',
    String? textDate = '',
    String? textDescription = '',
  }) =>
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          textWidgetPdf(
            text: '$textTitle',
            fontSize: 12.0,
            fontWeight: pw.FontWeight.bold,
            fontColor: PdfColors.grey600,
            topPadding: 4.0,
          ),
          textWidgetPdf(
            text: '$textLocation',
          ),
          textWidgetPdf(
            text: '$textDate',
          ),
          textWidgetPdf(
            text: '$textDescription',
            bottomPadding: 4.0,
          ),
        ],
      );
  //===== Scetion Card for PDF Component =====//

  ///===== Text Widget for PDF Component =====//
  pw.Widget textWidgetPdf({
    String? text = '',
    PdfColor? fontColor = PdfColors.grey,
    double? fontSize = 10.0,
    pw.FontWeight? fontWeight = pw.FontWeight.normal,
    pw.TextStyle? textStyle,
    double? topPadding = 1.0,
    double? bottomPadding = 1.0,
    double? leftPadding = 0.0,
    double? rightPadding = 0.0,
  }) =>
      pw.Padding(
        padding: pw.EdgeInsets.only(
          top: topPadding! * PdfPageFormat.mm,
          bottom: bottomPadding! * PdfPageFormat.mm,
          left: leftPadding! * PdfPageFormat.mm,
          right: rightPadding! * PdfPageFormat.mm,
        ),
        child: text! == ''
            ? pw.Container()
            : pw.Text(
                text,
                // softWrap: true,
                style: textStyle ??
                    pw.TextStyle(
                      color: fontColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      lineSpacing: 3.0,
                    ),
                // style: Theme.of(context)
                //     .defaultTextStyle
                //     .copyWith(color: PdfColors.grey),
              ),
      );
  //===== Text Widget for PDF Component =====//

  ///===== SizedBox include Divider for PDF Component =====//
  pw.Widget sizeBoxPdf({
    double? width = 0.0,
    double? height = 0.0,
    bool? isDivider = false,
    double? dividerHeight = 8.0,
    double? dividerThickness = 0.2,
    PdfColor dividerColor = PdfColors.black,
  }) =>
      pw.SizedBox(
        width: width! * PdfPageFormat.mm,
        height: height! * PdfPageFormat.mm,
        child: isDivider == false
            ? pw.Container()
            : pw.Divider(
                height: dividerHeight! * PdfPageFormat.mm,
                thickness: dividerThickness! * PdfPageFormat.mm,
                color: dividerColor,
              ),
      );
  //===== SizedBox include Divider for PDF Component =====//
}
