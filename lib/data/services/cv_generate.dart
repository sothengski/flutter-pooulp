import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../core/core.dart';

import '../models/models.dart';
import 'pdf_service.dart';

class CVGenerate {
  Future<File> generate({
    required UserModel? userData,
    required StudentProfileModel? studentData,
    required ProfileModel? profileData,
    required String? jobTitle,
  }) async {
    final pdf = pw.Document();
    final pdfService = PdfService();
    // final netImage = await networkImage('https://www.nfet.net/nfet.jpg');

    pdf.addPage(
      pw.MultiPage(
        // pageFormat: PdfPageFormat.a4,
        pageTheme: pw.PageTheme(
          margin: const pw.EdgeInsets.all(1.0),
          buildBackground: (pw.Context context) => pw.Row(
            children: [
              pw.Expanded(
                flex: 33,
                child: pw.Container(
                  color: PdfColor.fromHex('#364454'),
                ),
              ),
              pw.Expanded(
                flex: 67,
                child: pw.Container(color: PdfColors.white),
              )
            ],
          ),
          // theme: pw.ThemeData.withFont(base: regular, italic: italic, bold: bold, boldItalic: boldItalic),
        ),
        build: (context) {
          return [
            pw.Partitions(
              children: [
                pw.Partition(
                  flex: 33,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      contactInfoComponent(
                        userData: userData,
                        studentData: studentData,
                      ),
                    ],
                  ),
                ),
                pw.Partition(
                  flex: 67,
                  child: pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                      horizontal: 10.0 * PdfPageFormat.mm,
                      vertical: 12.0 * PdfPageFormat.mm,
                    ),
                    child: pw.Wrap(
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
                        textWidgetPdf(
                          text: 'Education',
                          fontSize: 16.0,
                          fontWeight: pw.FontWeight.bold,
                          fontColor: PdfColors.grey700,
                          topPadding: 2.0,
                        ),
                        sizeBoxPdf(
                          width: double.infinity,
                          height: 2.0,
                          dividerThickness: 0.5,
                          isDivider: true,
                          dividerColor: PdfColors.grey500,
                        ),
                        for (var data in studentData!.educations!)
                          sectionCardComponent(
                            textTitle: data.school!.name,
                            textLocation: '${data.degree}, ${data.name}',
                            textDate:
                                '${data.attendedFromTo} at ${data.schoolCityAndCountry}',
                            textDescription: data.description,
                          ),
                        //===== Education Component =====//

                        ///===== Professional Experiences Component =====//
                        if (studentData.experiences!.isNotEmpty)
                          textWidgetPdf(
                            text: 'Professional Experiences',
                            fontSize: 16.0,
                            fontWeight: pw.FontWeight.bold,
                            fontColor: PdfColors.grey700,
                            topPadding: 2.0,
                          ),
                        if (studentData.experiences!.isNotEmpty)
                          sizeBoxPdf(
                            width: double.infinity,
                            height: 2.0,
                            dividerThickness: 0.5,
                            isDivider: true,
                            dividerColor: PdfColors.grey500,
                          ),
                        if (studentData.experiences!.isNotEmpty)
                          for (var data in studentData.experiences!)
                            if (data.type == AppStrings.professionalKey)
                              sectionCardComponent(
                                textTitle: '${data.name}',
                                textLocation: '${data.company}',
                                textDate:
                                    '${data.attendedFromTo} at ${data.companyCityAndCountry}',
                                textDescription: data.description,
                              ),
                        //===== Professional Experiences Component =====//

                        ///===== Personal Experiences Component =====//
                        if (studentData.experiences!.isNotEmpty)
                          textWidgetPdf(
                            text: 'Personal Experiences',
                            fontSize: 16.0,
                            fontWeight: pw.FontWeight.bold,
                            fontColor: PdfColors.grey700,
                            topPadding: 2.0,
                          ),
                        if (studentData.experiences!.isNotEmpty)
                          sizeBoxPdf(
                            width: double.infinity,
                            height: 2.0,
                            dividerThickness: 0.5,
                            isDivider: true,
                            dividerColor: PdfColors.grey500,
                          ),
                        if (studentData.experiences!.isNotEmpty)
                          for (var data in studentData.experiences!)
                            if (data.type == AppStrings.personalKey)
                              sectionCardComponent(
                                textTitle: '${data.name}',
                                textLocation: '${data.company}',
                                textDate:
                                    '${data.attendedFromTo} at ${data.companyCityAndCountry}',
                                textDescription: data.description,
                              ),
                        //===== Personal Experiences Component =====//

                        sizeBoxPdf(
                          width: double.infinity,
                          height: 1.0,
                        ),

                        ///===== Skills Component =====//
                        if (studentData.skills!.isNotEmpty)
                          textWidgetPdf(
                            text: 'Skills',
                            fontSize: 16.0,
                            fontWeight: pw.FontWeight.bold,
                            fontColor: PdfColors.grey700,
                            topPadding: 2.0,
                          ),
                        if (studentData.skills!.isNotEmpty)
                          sizeBoxPdf(
                            width: double.infinity,
                            height: 2.0,
                            dividerThickness: 0.5,
                            isDivider: true,
                            dividerColor: PdfColors.grey500,
                          ),
                        if (studentData.skills!.isNotEmpty)
                          buildPdfSkillList(dataList: studentData.skills),
                        //===== Skills Component =====//

                        sizeBoxPdf(
                          width: double.infinity,
                          height: 1.0,
                        ),

                        ///===== Languages Component =====//
                        if (studentData.spokenLanguages!.isNotEmpty)
                          textWidgetPdf(
                            text: 'Languages',
                            fontSize: 16.0,
                            fontWeight: pw.FontWeight.bold,
                            fontColor: PdfColors.grey700,
                            topPadding: 4.0,
                          ),
                        if (studentData.spokenLanguages!.isNotEmpty)
                          sizeBoxPdf(
                            width: double.infinity,
                            height: 2.0,
                            dividerThickness: 0.5,
                            isDivider: true,
                            dividerColor: PdfColors.grey500,
                          ),
                        if (studentData.spokenLanguages!.isNotEmpty)
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              sizeBoxPdf(height: 2.0),
                              for (var data in studentData.spokenLanguages!)
                                textWidgetPdf(
                                  text: '- ${data.label}',
                                ),
                            ],
                          ),
                        //===== Languages Component =====//

                        sizeBoxPdf(
                          width: double.infinity,
                          height: 1.0,
                        ),

                        ///===== Achievements Component =====//
                        if (studentData.achievements!.isNotEmpty)
                          textWidgetPdf(
                            text: 'Achievements',
                            fontSize: 16.0,
                            fontWeight: pw.FontWeight.bold,
                            fontColor: PdfColors.grey700,
                            topPadding: 2.0,
                          ),
                        if (studentData.achievements!.isNotEmpty)
                          sizeBoxPdf(
                            width: double.infinity,
                            height: 2.0,
                            dividerThickness: 0.5,
                            isDivider: true,
                            dividerColor: PdfColors.grey500,
                          ),
                        if (studentData.achievements!.isNotEmpty)
                          for (var data in studentData.achievements!)
                            sectionCardComponent(
                              textTitle: '${data.name}',
                              textDate: '${data.dateCompletionFormat}',
                              textDescription: data.description,
                            ),
                        //===== Achievements Component =====//

                        sizeBoxPdf(
                          width: double.infinity,
                          height: 1.0,
                        ),

                        ///===== Certificates Component =====//
                        if (studentData.certificates!.isNotEmpty)
                          textWidgetPdf(
                            text: 'Certificates',
                            fontSize: 16.0,
                            fontWeight: pw.FontWeight.bold,
                            fontColor: PdfColors.grey700,
                            topPadding: 4.0,
                          ),
                        if (studentData.certificates!.isNotEmpty)
                          sizeBoxPdf(
                            width: double.infinity,
                            height: 2.0,
                            dividerThickness: 0.5,
                            isDivider: true,
                            dividerColor: PdfColors.grey500,
                          ),
                        if (studentData.certificates!.isNotEmpty)
                          for (var data in studentData.certificates!)
                            sectionCardComponent(
                              textTitle: '${data.title}',
                              textDate: '${data.receivedDateFormat}',
                              textDescription: data.description,
                            ),
                        //===== Certificates Component =====//
                      ],
                    ),
                  ),
                )
              ],
            ),
          ];
        },
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

  pw.Widget buildPdfSkillList({
    List<SkillModel>? dataList,
    String? dataType,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        textWidgetPdf(
          text: 'Hard skills',
          fontSize: 12.0,
          fontWeight: pw.FontWeight.bold,
          fontColor: PdfColors.grey600,
          topPadding: 2.0,
        ),
        for (var index = 0; index < dataList!.length; index++)
          if (dataList[index].type == Type.hardSkill)
            textWidgetPdf(
              text:
                  '${dataList[index].displayDashLabelAndCategory} - ${dataList[index].displayLevel}',
            ),
        sizeBoxPdf(),
        textWidgetPdf(
          text: 'Soft skills',
          fontSize: 12.0,
          fontWeight: pw.FontWeight.bold,
          fontColor: PdfColors.grey600,
          topPadding: 2.0,
        ),
        for (var index = 0; index < dataList.length; index++)
          if (dataList[index].type == Type.softSkill)
            textWidgetPdf(
              text: '- ${dataList[index].label}',
            ),
      ],
    );
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
            ///===== Profile Picture Component =====//
            // pw.Center(
            //   child: pw.Image(
            //     networkImage('https://www.nfet.net/nfet.jpg')
            //         as pw.ImageProvider,
            //   ),
            // ),
            //===== Profile Picture Component =====//

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
    double? textTitleFontSize = 12.0,
    pw.FontWeight? textTitleFontWeight = pw.FontWeight.bold,
    PdfColor textTitleColor = PdfColors.grey600,
    String? textLocation = '',
    String? textDate = '',
    String? textDescription = '',
  }) =>
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          textWidgetPdf(
            text: '$textTitle',
            fontSize: textTitleFontSize,
            fontWeight: textTitleFontWeight,
            fontColor: textTitleColor,
            topPadding: 4.0,
          ),
          if (textLocation == '')
            pw.Container()
          else
            textWidgetPdf(
              text: '$textLocation',
              fontColor: PdfColors.grey700,
            ),
          if (textDate == '')
            pw.Container()
          else
            textWidgetPdf(
              fontColor: PdfColors.grey600,
              text: '$textDate',
            ),
          if (textDescription == '')
            pw.Container()
          else
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
