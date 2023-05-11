import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:provider/provider.dart';
import 'package:flutter_beep/flutter_beep.dart';
import '../../../../Helper/SizedConfig.dart';
import '../../../../Helper/globle style.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../BotProvider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:getwidget/getwidget.dart';
import '../Controller/AddEnquiryController.dart';
import '../Helper/animation.dart';
import '../Helper/commen_textField.dart';
import '../Helper/globle style.dart';
import '../Helper/globle style.dart';
import '../Helper/navigation_helper.dart';
import '../Helper/send_button_component.dart';
import '../Profile/Pdf_viewer.dart';
import 'Emi_calculator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../Profile/Pdf_viewer.dart';
import 'home_screen (3).dart';
import 'package:fluttertoast/fluttertoast.dart';
class CheckCriteriaWithBot extends StatefulWidget {
  const CheckCriteriaWithBot({Key? key}) : super(key: key);

  @override
  State<CheckCriteriaWithBot> createState() => _CheckCriteriaWithBotState();
}

class _CheckCriteriaWithBotState extends State<CheckCriteriaWithBot> {
  late BotProvider botProvider1;
  final _principalController = TextEditingController();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();

  final addenquiryController = Get.find<AddEnquiryController>();

  RangeValues _loanRangeValues = RangeValues(0.0, 10.0);
  late AssetsAudioPlayer audioPlayer;
  String ActiveDeactive = 'Salaride';

  //Bank Statement
  bool isbIconSelected = false;
  String document="";
  late File filedocument;
  bool isfileuploaded=false;

  //upload Image
  bool isIconSelected=false;
  final ImagePicker _picker = ImagePicker();
  late String profile_pic='';
  File? icon_img;
  late XFile pickedImageFile;

  //Upload Pan card photo
  bool ispanIconSelected=false;
  final ImagePicker _ppicker = ImagePicker();
  late String pan_pic='';
  File? picon_img;
  late XFile ppickedImageFile;

  //Upload adhar card photo
  bool isadharIconSelected=false;
  final ImagePicker _apicker = ImagePicker();
  late String adhar_pic='';
  File? aicon_img;
  late XFile apickedImageFile;

  //Upload RC photo
  bool isRCIconSelected=false;
  final ImagePicker _rpicker = ImagePicker();
  late String rc_pic='';
   File? ricon_img;
  late XFile rpickedImageFile;

  //Upload insurance photo
  bool isinsuranceIconSelected=false;
  final ImagePicker _Ipicker = ImagePicker();
  late String insurance_pic='';
  File? inicon_img;
  late XFile ipickedImageFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AssetsAudioPlayer();
    receiveSound();
    botProvider1 = Provider.of<BotProvider>(context, listen: false);

  }

  sendSound() async {
    FlutterBeep.beep();
  }

  receiveSound() async {
    Future.delayed(Duration.zero, () {
      audioPlayer.open(
        Audio(
          'assets/audios/sound_receive.mp3',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Consumer<BotProvider>(builder: (context, botProvider, child) {
            return
              Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Column(
                children: [
                  //Top componenet
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: SizeConfig.screenWidth * 0.5,
                          child: Image.asset('assets/images/hello.gif'),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SlideFadeTransition(
                                delayStart: Duration(milliseconds: 500),
                                animationDuration: Duration(milliseconds: 1200),
                                child: const Text(
                                  "Welcome, John",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: themeColor,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                              SizedBox(height: 10,),
                              SlideFadeTransition(
                                delayStart: Duration(milliseconds: 1000),
                                animationDuration: Duration(milliseconds: 700),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Let's start, to check your eligible critria...",
                                  style: KH6.copyWith(
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),



                  SlideFadeTransition(
                      delayStart: Duration(milliseconds: 1200),
                      animationDuration: Duration(milliseconds: 1200),
                      // curve: Curves.elasticOut,
                      // offset: -2.5,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SlideFadeTransition(
                                delayStart: Duration(milliseconds: 200),
                                animationDuration: Duration(milliseconds: 1200),
                                // curve: Curves.elasticOut,
                                // offset: -2.5,
                                child: Text(
                                  "Let's Enter your information such as address, date of birth,salary for checking your criteria...",
                                  style: KH7_SemiBold.copyWith(height: 1.5),
                                )),
                            Container(
                              width: SizeConfig.screenWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Enter your city name",
                                    style: KH7.copyWith(height: 1.5),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: botProvider.districtTextVisible
                                            ? SizeConfig.screenWidth * 0.9
                                            : SizeConfig.screenWidth * 0.7,
                                        child: TextFiledBorderWidget(
                                          controller: _nameController,
                                          isEnabled: true,
                                          label: 'Enter City',
                                          validator: (String) {},
                                          width: SizeConfig.screenWidth,
                                          inputType: TextInputType.text,
                                          focusNode: botProvider.distictfocus,
                                          onChnage: (String? value) {
                                            setState(() {
                                              botProvider.districtButtonVisible = true;
                                              botProvider.districtTextVisible = false;

                                            });
                                          },
                                        ),
                                      ),
                                      Visibility(
                                          visible:
                                          botProvider.districtButtonVisible ? true : false,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sendSound();
                                                  botProvider.districtButtonVisible = false;
                                                  botProvider.districtTextVisible = true;
                                                  botProvider.dateofbirthWidgetVisible = true;
                                                  receiveSound();
                                                });
                                              },
                                              child: SendButtonComponent()))
                                    ],
                                  ),

                                ],
                              ),
                            ),


                            SlideFadeTransition(
                              delayStart: Duration(milliseconds: 300),
                              animationDuration: Duration(milliseconds: 1200),
                              // curve: Curves.elasticOut,
                              // offset: -2.5,

                              child: Visibility(
                                visible: botProvider.dateofbirthWidgetVisible ? true : false,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Great!!!...",
                                        style: KH7_SemiBold.copyWith(height: 1.5),
                                      ),
                                      Text(
                                        "Please Enter your date of birth",
                                        style: KH7.copyWith(height: 1.5),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: botProvider.dateofbirthTextVisible
                                                ? SizeConfig.screenWidth * 0.9
                                                : SizeConfig.screenWidth * 0.7,
                                            child: TextFiledBorderWidget(
                                              controller: _dobController,
                                              isEnabled: true,
                                              label: 'Enter Date Of Birth',
                                              validator: (String) {},
                                              width: SizeConfig.screenWidth,
                                              inputType: TextInputType.text,
                                              focusNode: botProvider.dobFocus,
                                              onChnage: (String? value) {
                                                setState(() {
                                                  botProvider.dateofbirthButtonVisible = true;
                                                  botProvider.dateofbirthTextVisible = false;
                                                });
                                              },
                                            ),
                                          ),
                                          Visibility(
                                              visible:
                                              botProvider.dateofbirthButtonVisible ? true : false,
                                              child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      sendSound();
                                                      botProvider.dateofbirthButtonVisible = false;
                                                      botProvider.dateofbirthTextVisible = true;
                                                      botProvider.employementWidgetVisible = true;
                                                      receiveSound();
                                                    });
                                                  },
                                                  child: SendButtonComponent()))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SlideFadeTransition(
                              delayStart: Duration(milliseconds: 300),
                              animationDuration: Duration(milliseconds: 1200),
                              // curve: Curves.elasticOut,
                              // offset: -2.5,

                              child: Visibility(
                                visible: botProvider.employementWidgetVisible ? true : false,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),

                                      Text(
                                        "okk!!!...",
                                        style: KH7_SemiBold.copyWith(height: 1.5),
                                      ),
                                      Text(
                                        "Please Enter Employement Type",
                                        style: KH7.copyWith(height: 1.5),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: botProvider.employementTextVisible
                                                ? SizeConfig.screenWidth * 0.9
                                                : SizeConfig.screenWidth * 0.7,
                                            child:
                                            DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.all( 8), //<-- set vertical padding here
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(color: Colors.grey, width: 1),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(color: Colors.grey, width: 1),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                              dropdownColor: Colors.white,
                                              value: ActiveDeactive,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  ActiveDeactive = newValue!;
                                                  print("isActive==");
                                                  print(ActiveDeactive);
                                                  botProvider.employementtypeButtonVisible = true;
                                                  botProvider.employementTextVisible = false;
                                                });
                                              },
                                              items: <String>['Salaride', 'Buisnessman'].map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                );
                                              }).toList(),
                                            )
                                          ),
                                          Visibility(
                                              visible:
                                              botProvider.employementtypeButtonVisible ? true : false,
                                              child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      sendSound();
                                                      botProvider.employementtypeButtonVisible = false;
                                                      botProvider.employementTextVisible = true;
                                                      botProvider.monthlyWidgetVisible = true;
                                                      receiveSound();
                                                    });
                                                  },
                                                  child: SendButtonComponent()))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),


                            SlideFadeTransition(
                              delayStart: Duration(milliseconds: 300),
                              animationDuration: Duration(milliseconds: 1200),
                              // curve: Curves.elasticOut,
                              // offset: -2.5,

                              child: Visibility(
                                visible: botProvider.monthlyWidgetVisible ? true : false,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),



                                      Text(
                                        "Ok!!!...",
                                        style: KH7_SemiBold.copyWith(height: 1.5),
                                      ),
                                      Row(
                                        children: [
                                          Text( "Please Enter Requirement of amount"),
                                          SizedBox(width: 50),
                                          Expanded(
                                            child:
                                            SizedBox(
                                              height: 40,

                                              child: TextField(
                                                controller: _principalController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                  labelText: 'Rs.',
                                                ),
                                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                              ),
                                            ),


                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: botProvider.monthalyTextVisible
                                            ? SizeConfig.screenWidth * 0.9
                                            : SizeConfig.screenWidth * 0.7,
                                        child:

                                        RangeSlider(
                                          values: _loanRangeValues,
                                          min: 0.0,
                                          max: 4000000.0,
                                          divisions: 40,
                                          labels: RangeLabels(
                                            '${_loanRangeValues.start}L',
                                            '${_loanRangeValues.end}L',
                                          ),
                                          onChanged: (RangeValues values) {
                                            setState(() {
                                              _loanRangeValues = values;
                                              _principalController.text = _loanRangeValues.end.toStringAsFixed(2);
                                              botProvider.monthalybottonVisible = true;
                                            });
                                          },
                                          activeColor:themeColor, // Change the color to blue
                                          semanticFormatterCallback: (value) => '${value.round()}L', // Add this line to make the slider move from left to right
                                        ),


                                      ),


                                      Visibility(
                                          visible:
                                          botProvider.monthalybottonVisible ? true : false,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sendSound();
                                                  botProvider.monthalybottonVisible = false;
                                                  botProvider.photoWidgetVisible = true;
                                                 // botProvider.visibleExpericeneWidget(true);
                                                  receiveSound();
                                                });
                                              },
                                              child: SendButtonComponent())),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SlideFadeTransition(
                              delayStart: Duration(milliseconds: 300),
                              animationDuration: Duration(milliseconds: 1200),
                              // curve: Curves.elasticOut,
                              // offset: -2.5,
                              child: Visibility(
                                visible: botProvider.photoWidgetVisible ? true : false,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Ok!!!...",
                                        style: KH7_SemiBold.copyWith(height: 1.5),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text( "Please Upload Your Photo"),

                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: botProvider.photoIconVisible
                                            ? SizeConfig.screenWidth * 0.9
                                            : SizeConfig.screenWidth * 0.7,
                                        child:
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10.0),
                                              child: isIconSelected
                                                  ? Image.file(
                                                icon_img!,
                                                height: 100,
                                                width: 100,
                                              )
                                                  : profile_pic.isEmpty
                                                  ? GestureDetector(
                                                onTap: () {
                                                  showImageDialog();
                                                  setState(() {
                                                    botProvider.photoButtonVisible = true;
                                                  });
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 200,
                                                  child: Image.asset('assets/images/uploading.png'),
                                                ),
                                              )
                                                  : CachedNetworkImage(
                                                height: 50,
                                                width: 200,
                                                imageUrl: profile_pic,
                                                placeholder: (context, url) => Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[400],
                                                  ),
                                                ),
                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                              ),
                                            ),
                                            if (isIconSelected)
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isIconSelected = false;
                                                      icon_img = null; // Set icon_img back to null
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.cancel,
                                                    size: 20,
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),


                                      ),


                                      Visibility(
                                          visible:
                                          botProvider.photoButtonVisible ? true : false,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sendSound();
                                                  botProvider.photoButtonVisible = false;
                                                  botProvider.panWidgetVisible = true;
                                                  // botProvider.visibleExpericeneWidget(true);
                                                  receiveSound();
                                                });
                                              },
                                              child: SendButtonComponent())),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SlideFadeTransition(
                              delayStart: Duration(milliseconds: 300),
                              animationDuration: Duration(milliseconds: 1200),
                              // curve: Curves.elasticOut,
                              // offset: -2.5,

                              child: Visibility(
                                visible: botProvider.panWidgetVisible ? true : false,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Ok!!!...",
                                        style: KH7_SemiBold.copyWith(height: 1.5),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text( "Please Upload Your Pan Card Photo"),

                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                          width: botProvider.panIconVisible
                                              ? SizeConfig.screenWidth * 0.9
                                              : SizeConfig.screenWidth * 0.7,
                                          child:
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: ispanIconSelected
                                                    ? Image.file(
                                                  picon_img!,
                                                  height: 100,
                                                  width: 100,
                                                )
                                                    : pan_pic.isEmpty
                                                    ? GestureDetector(
                                                  onTap: () {
                                                    pshowImageDialog();
                                                    setState(() {
                                                      botProvider.panButtonVisible = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 200,
                                                    child: Image.asset('assets/images/uploading.png'),
                                                  ),
                                                )
                                                    : CachedNetworkImage(
                                                  height: 50,
                                                  width: 200,
                                                  imageUrl: pan_pic,
                                                  placeholder: (context, url) => Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[400],
                                                    ),
                                                  ),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),
                                              ),
                                              if (ispanIconSelected)
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        ispanIconSelected = false;
                                                        picon_img = null; // Set picon_img back to null
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.cancel,
                                                      size: 20,
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),



                                      ),


                                      Visibility(
                                          visible:
                                          botProvider.panButtonVisible ? true : false,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sendSound();
                                                  botProvider.panButtonVisible = false;
                                                  botProvider.adharWidgetVisible = true;
                                                  // botProvider.visibleExpericeneWidget(true);
                                                  receiveSound();
                                                });
                                              },
                                              child: SendButtonComponent())),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SlideFadeTransition(
                              delayStart: Duration(milliseconds: 300),
                              animationDuration: Duration(milliseconds: 1200),
                              // curve: Curves.elasticOut,
                              // offset: -2.5,

                              child: Visibility(
                                visible: botProvider.adharWidgetVisible ? true : false,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Ok!!!...",
                                        style: KH7_SemiBold.copyWith(height: 1.5),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text( "Please Upload Your Adhar Card Photo"),

                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                          width: botProvider.adharIconVisible
                                              ? SizeConfig.screenWidth * 0.9
                                              : SizeConfig.screenWidth * 0.7,
                                          child:
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: isadharIconSelected
                                                    ? Image.file(
                                                  aicon_img!,
                                                  height: 100,
                                                  width: 100,
                                                )
                                                    : adhar_pic.isEmpty
                                                    ? GestureDetector(
                                                  onTap: () {
                                                    ashowImageDialog();
                                                    setState(() {
                                                      botProvider.adharButtonVisible = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 200,
                                                    child: Image.asset('assets/images/uploading.png'),
                                                  ),
                                                )
                                                    : CachedNetworkImage(
                                                  height: 50,
                                                  width: 200,
                                                  imageUrl: adhar_pic,
                                                  placeholder: (context, url) => Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[400],
                                                    ),
                                                  ),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),
                                              ),
                                              if (isadharIconSelected)
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isadharIconSelected = false;
                                                        aicon_img = null; // Set picon_img back to null
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.cancel,
                                                      size: 20,
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                      ),


                                      Visibility(
                                          visible:
                                          botProvider.adharButtonVisible ? true : false,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sendSound();
                                                  botProvider.adharButtonVisible = false;
                                                  botProvider.rcWidgetVisible = true;
                                                  // botProvider.visibleExpericeneWidget(true);
                                                  receiveSound();
                                                });
                                              },
                                              child: SendButtonComponent())),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SlideFadeTransition(
                              delayStart: Duration(milliseconds: 300),
                              animationDuration: Duration(milliseconds: 1200),
                              // curve: Curves.elasticOut,
                              // offset: -2.5,

                              child: Visibility(
                                visible: botProvider.rcWidgetVisible ? true : false,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Ok!!!...",
                                        style: KH7_SemiBold.copyWith(height: 1.5),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text( "Please Upload Your RC Book Photo"),

                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                          width: botProvider.rcIconVisible
                                              ? SizeConfig.screenWidth * 0.9
                                              : SizeConfig.screenWidth * 0.7,
                                          child:
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: isRCIconSelected
                                                    ? Image.file(
                                                  ricon_img!,
                                                  height: 100,
                                                  width: 100,
                                                )
                                                    : rc_pic.isEmpty
                                                    ? GestureDetector(
                                                  onTap: () {
                                                    rshowImageDialog();
                                                    setState(() {
                                                      botProvider.rcButtonVisible = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 200,
                                                    child: Image.asset('assets/images/uploading.png'),
                                                  ),
                                                )
                                                    : CachedNetworkImage(
                                                  height: 50,
                                                  width: 200,
                                                  imageUrl: rc_pic,
                                                  placeholder: (context, url) => Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[400],
                                                    ),
                                                  ),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),
                                              ),
                                              if (isRCIconSelected)
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isRCIconSelected = false;
                                                        ricon_img = null; // Set picon_img back to null
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.cancel,
                                                      size: 20,
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),


                                      ),


                                      Visibility(
                                          visible:
                                          botProvider.rcButtonVisible ? true : false,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sendSound();
                                                  botProvider.rcButtonVisible = false;
                                                  botProvider.insuWidgetVisible = true;
                                                  // botProvider.visibleExpericeneWidget(true);
                                                  receiveSound();
                                                });
                                              },
                                              child: SendButtonComponent())),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SlideFadeTransition(
                              delayStart: Duration(milliseconds: 300),
                              animationDuration: Duration(milliseconds: 1200),
                              // curve: Curves.elasticOut,
                              // offset: -2.5,

                              child: Visibility(
                                visible: botProvider.insuWidgetVisible ? true : false,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Ok!!!...",
                                        style: KH7_SemiBold.copyWith(height: 1.5),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text( "Please Upload  Insurance Photo"),

                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                          width: botProvider.insuIconVisible
                                              ? SizeConfig.screenWidth * 0.9
                                              : SizeConfig.screenWidth * 0.7,
                                          child:
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: isinsuranceIconSelected
                                                    ? Image.file(
                                                  inicon_img!,
                                                  height: 100,
                                                  width: 100,
                                                )
                                                    : insurance_pic.isEmpty
                                                    ? GestureDetector(
                                                  onTap: () {
                                                    ishowImageDialog();
                                                    setState(() {
                                                      botProvider.insuButtonVisible = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 200,
                                                    child: Image.asset('assets/images/uploading.png'),
                                                  ),
                                                )
                                                    : CachedNetworkImage(
                                                  height: 50,
                                                  width: 200,
                                                  imageUrl: insurance_pic,
                                                  placeholder: (context, url) => Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[400],
                                                    ),
                                                  ),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),
                                              ),
                                              if (isinsuranceIconSelected)
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isinsuranceIconSelected = false;
                                                        inicon_img = null; // Set picon_img back to null
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.cancel,
                                                      size: 20,
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),


                                      ),


                                      Visibility(
                                          visible:
                                          botProvider.insuButtonVisible ? true : false,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sendSound();
                                                  botProvider.insuButtonVisible = false;
                                                  botProvider.bankWidgetVisible = true;
                                                  // botProvider.visibleExpericeneWidget(true);
                                                  receiveSound();
                                                });
                                              },
                                              child: SendButtonComponent())),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SlideFadeTransition(
                              delayStart: Duration(milliseconds: 300),
                              animationDuration: Duration(milliseconds: 1200),
                              // curve: Curves.elasticOut,
                              // offset: -2.5,

                              child: Visibility(
                                visible: botProvider.bankWidgetVisible ? true : false,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Ok!!!...",
                                        style: KH7_SemiBold.copyWith(height: 1.5),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text( "Please Upload Bank Statement"),

                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                          width: botProvider.bankIconVisible
                                              ? SizeConfig.screenWidth * 0.9
                                              : SizeConfig.screenWidth * 0.7,
                                          child:
                                          GestureDetector(
                                            onTap: () async {
                                              if (document.isNotEmpty) {
                                                push(context, Pdf_viewer(document));
                                              } else {
                                                FilePickerResult? result = await FilePicker.platform.pickFiles(
                                                  type: FileType.custom,
                                                  allowedExtensions: ['pdf', 'doc'],
                                                  allowMultiple: false,
                                                );
                                                if (result != null) {
                                                  PlatformFile file = result.files.first;
                                                  filedocument = File(file.path!);
                                                  isfileuploaded = true;
                                                  print(file.name);
                                                  print(file.size);
                                                  print(file.extension);
                                                  setState(() {
                                                    document = file.name;
                                                    botProvider.bankButtonVisible = true;
                                                  });
                                                } else {
                                                  print('No file selected');
                                                }
                                              }
                                            },
                                            child: isfileuploaded
                                                ? Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isfileuploaded = false;
                                                      document = '';
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.cancel,
                                                    size: 20,
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                GestureDetector(
                                                  onTap: () {
                                                    push(context, Pdf_viewer(document));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15.0),
                                                    child: Text(
                                                      document,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                                : Icon(
                                              Icons.upload_file,
                                              size: 30,
                                              color: Colors.black,
                                            ),
                                          ),

                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Visibility(
                                          visible:
                                          botProvider.bankButtonVisible ? true : false,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sendSound();
                                                  botProvider.bankButtonVisible = false;
                                                  botProvider.existingloanWidgetVisible = true;
                                                  botProvider.finishWidgetVisible = true;

                                                  // botProvider.visibleExpericeneWidget(true);
                                                  receiveSound();
                                                });
                                                }, child: SendButtonComponent())),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // SlideFadeTransition(
                            //   delayStart: Duration(milliseconds: 300),
                            //   animationDuration: Duration(milliseconds: 1200),
                            //   // curve: Curves.elasticOut,
                            //   // offset: -2.5,
                            //
                            //   child: Visibility(
                            //     visible: botProvider.existingloanWidgetVisible ? true : false,
                            //     child: Container(
                            //       width: SizeConfig.screenWidth,
                            //       child: Column(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //           const SizedBox(
                            //             height: 20,
                            //           ),
                            //           Text(
                            //             "Great!!!...",
                            //             style: KH7_SemiBold.copyWith(height: 1.5),
                            //           ),
                            //           Text(
                            //             "Now, Enter you have any existing loan",
                            //             style: KH7.copyWith(height: 1.5),
                            //           ),
                            //           const SizedBox(
                            //             height: 7,
                            //           ),
                            //           Column(
                            //             children: [
                            //               Container(
                            //                 width: botProvider.existingtextvisible
                            //                     ? SizeConfig.screenWidth * 0.9
                            //                     : SizeConfig.screenWidth * 0.7,
                            //                 child:
                            //                 Container(
                            //                   padding: EdgeInsets.symmetric(horizontal: 5.0),
                            //
                            //                   child:
                            //                   Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       CheckboxListTile(
                            //                         title: Text('Home Loan'),
                            //                         value: botProvider.homeLoanChecked,
                            //                         onChanged: (newValue) {
                            //                           setState(() {
                            //                             botProvider.homeLoanChecked = newValue!;
                            //                           });
                            //                         },
                            //                       ),
                            //                       CheckboxListTile(
                            //                         title: Text('Bike Loan'),
                            //                         value: botProvider.bikeLoanChecked,
                            //                         onChanged: (newValue) {
                            //                           setState(() {
                            //                             botProvider.bikeLoanChecked = newValue!;
                            //                           });
                            //                         },
                            //                       ),
                            //                       CheckboxListTile(
                            //                         title: Text('Car Loan'),
                            //                         value: botProvider.carLoanChecked,
                            //                         onChanged: (newValue) {
                            //                           setState(() {
                            //                             botProvider.carLoanChecked = newValue!;
                            //                           });
                            //                         },
                            //                       ),
                            //                       CheckboxListTile(
                            //                         title: Text('Personal Loan'),
                            //                         value: botProvider.personalLoanChecked,
                            //                         onChanged: (newValue) {
                            //                           setState(() {
                            //                             botProvider.personalLoanChecked = newValue!;
                            //                           });
                            //                         },
                            //                       ),
                            //                       CheckboxListTile(
                            //                         title: Text('Other'),
                            //                         value: botProvider.otherLoanChecked,
                            //                         onChanged: (newValue) {
                            //                           setState(() {
                            //                             botProvider.otherLoanChecked = newValue!;
                            //                           });
                            //                         },
                            //                       ),
                            //                     ],
                            //                   )
                            //
                            //                 ),
                            //
                            //               ),
                            //             ],
                            //           ),
                            //           Visibility(
                            //               visible:
                            //               botProvider.homeLoanChecked==true||  botProvider.carLoanChecked==true||
                            //                   botProvider.bikeLoanChecked==true|| botProvider.personalLoanChecked==true||
                            //                   botProvider.otherLoanChecked ? true : false,
                            //               child: InkWell(
                            //                   onTap: () {
                            //                     setState(() {
                            //                       sendSound();
                            //                       botProvider.existingbottonvisible = false;
                            //                       botProvider.existingtextvisible = true;
                            //                       botProvider.finishWidgetVisible = true;
                            //                       receiveSound();
                            //                     });
                            //                   },
                            //                   child: SendButtonComponent())),
                            //
                            //
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            Visibility(
                              visible: botProvider.finishWidgetVisible == true ? true :false,
                              child: Column(
                                children: [
                                  Text(
                                    "You are eligible for loan",
                                    textAlign: TextAlign.center,
                                    style: KH6.copyWith(
                                      height: 1.5,
                                    ),
                                  ),

                                  Text(
                                    "You can get loan according to your eligible criteria",
                                    style: KH7.copyWith(height: 1.5,),
                                  ),
                                  SizedBox(height: 20,),
                                  botProvider.isApiCallProcessing==false?InkWell(
                                      onTap: () {
                                        setState(() {
                                          sendSound();
                                          //Navigator.of(context).pushReplacement(
                                          // MaterialPageRoute(builder: (context) => HomeScreen()));
                                          if(validationData()==true) {
                                            addenquiryController.addEnquieryApi(
                                              cityName: _nameController.text,
                                              empType: ActiveDeactive,
                                              reuireamt: _principalController
                                                  .text,
                                              profileImg: profile_pic,
                                              icon_img: icon_img,
                                              panCardImg: pan_pic,
                                              picon_img: picon_img,
                                              adharCardImg: adhar_pic,
                                              aicon_img: aicon_img,
                                              RCImg: rc_pic,
                                              ricon_img: ricon_img,
                                              insuImg: insurance_pic,
                                              iicon_img: inicon_img,
                                              bankStatement: document,
                                              filedocument: filedocument,
                                            );
                                          }

                                          receiveSound();
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          width: SizeConfig.screenWidth,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: themeColor,
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                                    offset: Offset(1, 6),
                                                    blurRadius: 12)
                                              ]),
                                          // height: 50,
                                          // width: 50,
                                          padding: EdgeInsets.all(12),
                                          alignment: Alignment.center,
                                          child: Text("Submit", style: KH6_SemiBold.copyWith(color: KWHITE_COLOR),),
                                        ),
                                      )):Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: const GFLoader(
                                        type:GFLoaderType.circle
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
            ),
              );
          }),
        ),
      ),
    );
  }
//profile pic
  showImageDialog() async{
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            height: 110,
            child: Column(
              children: <Widget>[
                Text("Choose Profile Photo",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),
                SizedBox(
                  height: 20,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,children:<Widget> [
                  TextButton.icon(
                      onPressed:(){
                        getCameraImage();

                      },
                      icon: Icon(Icons.camera,
                        color: Colors.black54,
                        size: 20,),
                      label: Text("Camera",
                          style: TextStyle(color: Colors.black54,fontSize: 20))
                  ),
                  TextButton.icon(
                      onPressed:(){
                        getGalleryImage();

                      },
                      icon: Icon(Icons.image,
                        color: Colors.black54,
                        size: 20,),
                      label: Text("Gallery",
                          style: TextStyle(color: Colors.black54,fontSize: 20))
                  ),

                ],)
              ],
            ),

          )
      ),
    ) ;
  }

  Future getCameraImage() async {
    Navigator.of(context).pop(false);
    var pickedFile  = await _picker.pickImage(source: ImageSource.camera);

    if(pickedFile!=null){
      pickedImageFile=pickedFile;

      File selectedImg = File(pickedImageFile.path);

      cropImage(selectedImg);
    }
  }

  Future getGalleryImage() async {
    Navigator.of(context).pop(false);
    var pickedFile  = await _picker.pickImage(source: ImageSource.gallery);

    if(pickedFile!=null){
      pickedImageFile=pickedFile;

      File selectedImg = File(pickedImageFile.path);

      cropImage(selectedImg);
    }
  }

  cropImage (File icon) async {

    CroppedFile? croppedFile = (await ImageCropper().cropImage(
        sourcePath: icon.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings:[
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ]
    ));

    if(croppedFile!=null){
      setState(() {
        icon_img = File(croppedFile.path);
        isIconSelected=true;
      });
    }
  }

  //PanCard pic

  pshowImageDialog() async{
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            height: 110,
            child: Column(
              children: <Widget>[
                Text("Choose Profile Photo",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),
                SizedBox(
                  height: 20,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,children:<Widget> [
                  TextButton.icon(
                      onPressed:(){
                        pgetCameraImage();

                      },
                      icon: Icon(Icons.camera,
                        color: Colors.black54,
                        size: 20,),
                      label: Text("Camera",
                          style: TextStyle(color: Colors.black54,fontSize: 20))
                  ),
                  TextButton.icon(
                      onPressed:(){
                        pgetGalleryImage();

                      },
                      icon: Icon(Icons.image,
                        color: Colors.black54,
                        size: 20,),
                      label: Text("Gallery",
                          style: TextStyle(color: Colors.black54,fontSize: 20))
                  ),

                ],)
              ],
            ),

          )
      ),
    ) ;
  }

  Future pgetCameraImage() async {
    Navigator.of(context).pop(false);
    var pickedFile  = await _ppicker.pickImage(source: ImageSource.camera);

    if(pickedFile!=null){
      ppickedImageFile=pickedFile;

      File selectedImg = File(ppickedImageFile.path);

      pcropImage(selectedImg);
    }
  }

  Future pgetGalleryImage() async {
    Navigator.of(context).pop(false);
    var pickedFile  = await _ppicker.pickImage(source: ImageSource.gallery);

    if(pickedFile!=null){
      ppickedImageFile=pickedFile;

      File selectedImg = File(ppickedImageFile.path);

      pcropImage(selectedImg);
    }
  }

  pcropImage (File icon) async {

    CroppedFile? croppedFile = (await ImageCropper().cropImage(
        sourcePath: icon.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings:[
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ]
    ));

    if(croppedFile!=null){
      setState(() {
        picon_img = File(croppedFile.path);
        ispanIconSelected=true;
      });
    }
  }

  //adhar image
  Future agetCameraImage() async {
    Navigator.of(context).pop(false);

    var apickedFile  = await _apicker.pickImage(source: ImageSource.camera);

    if(apickedFile!=null ){

      apickedImageFile=apickedFile;



      File aselectedImg = File(apickedImageFile.path);



      acropImage(aselectedImg);

    }
  }

  Future agetGalleryImage() async {
    Navigator.of(context).pop(false);

    var apickedFile  = await _apicker.pickImage(source: ImageSource.gallery);


    if( apickedFile!=null ){

      apickedImageFile=apickedFile;



      File aselectedImg = File(apickedImageFile.path);



      acropImage(aselectedImg);

    }
  }

  acropImage (File icon) async {

    CroppedFile? croppedFile = (await ImageCropper().cropImage(
        sourcePath: icon.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings:[
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ]
    ));

    if(croppedFile!=null){
      setState(() {

        aicon_img = File(croppedFile.path);
        isadharIconSelected=true;

      });
    }
  }

  ashowImageDialog() async{
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            height: 110,
            child: Column(
              children: <Widget>[
                Text("Choose Profile Photo",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),
                SizedBox(
                  height: 20,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,children:<Widget> [
                  TextButton.icon(
                      onPressed:(){
                        agetCameraImage();

                      },
                      icon: Icon(Icons.camera,
                        color: Colors.black54,
                        size: 20,),
                      label: Text("Camera",
                          style: TextStyle(color: Colors.black54,fontSize: 20))
                  ),
                  TextButton.icon(
                      onPressed:(){
                        agetGalleryImage();

                      },
                      icon: Icon(Icons.image,
                        color: Colors.black54,
                        size: 20,),
                      label: Text("Gallery",
                          style: TextStyle(color: Colors.black54,fontSize: 20))
                  ),

                ],)
              ],
            ),

          )
      ),
    ) ;
  }

  //Rc Book
  Future rgetCameraImage() async {
    Navigator.of(context).pop(false);

    var apickedFile  = await _rpicker.pickImage(source: ImageSource.camera);

    if(apickedFile!=null ){

      rpickedImageFile=apickedFile;



      File aselectedImg = File(rpickedImageFile.path);



      rcropImage(aselectedImg);

    }
  }

  Future rgetGalleryImage() async {
    Navigator.of(context).pop(false);

    var apickedFile  = await _rpicker.pickImage(source: ImageSource.gallery);


    if( apickedFile!=null ){

      rpickedImageFile=apickedFile;



      File aselectedImg = File(rpickedImageFile.path);



      rcropImage(aselectedImg);

    }
  }

  rcropImage (File icon) async {

    CroppedFile? croppedFile = (await ImageCropper().cropImage(
        sourcePath: icon.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings:[
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ]
    ));

    if(croppedFile!=null){
      setState(() {

        ricon_img = File(croppedFile.path);
        isRCIconSelected=true;

      });
    }
  }

  rshowImageDialog() async{
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            height: 110,
            child: Column(
              children: <Widget>[
                Text("Choose Profile Photo",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),
                SizedBox(
                  height: 20,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,children:<Widget> [
                  TextButton.icon(
                      onPressed:(){
                        rgetCameraImage();

                      },
                      icon: Icon(Icons.camera,
                        color: Colors.black54,
                        size: 20,),
                      label: Text("Camera",
                          style: TextStyle(color: Colors.black54,fontSize: 20))
                  ),
                  TextButton.icon(
                      onPressed:(){
                        rgetGalleryImage();

                      },
                      icon: Icon(Icons.image,
                        color: Colors.black54,
                        size: 20,),
                      label: Text("Gallery",
                          style: TextStyle(color: Colors.black54,fontSize: 20))
                  ),

                ],)
              ],
            ),

          )
      ),
    ) ;
  }

  //Insurance
  Future igetCameraImage() async {
    Navigator.of(context).pop(false);

    var apickedFile  = await _Ipicker.pickImage(source: ImageSource.camera);

    if(apickedFile!=null ){

      ipickedImageFile=apickedFile;



      File aselectedImg = File(ipickedImageFile.path);



      icropImage(aselectedImg);

    }
  }

  Future igetGalleryImage() async {
    Navigator.of(context).pop(false);

    var apickedFile  = await _Ipicker.pickImage(source: ImageSource.gallery);


    if( apickedFile!=null ){

      ipickedImageFile=apickedFile;



      File aselectedImg = File(ipickedImageFile.path);



      icropImage(aselectedImg);

    }
  }

  icropImage (File icon) async {

    CroppedFile? croppedFile = (await ImageCropper().cropImage(
        sourcePath: icon.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings:[
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ]
    ));

    if(croppedFile!=null){
      setState(() {

        inicon_img = File(croppedFile.path);
        isinsuranceIconSelected=true;

      });
    }
  }

  ishowImageDialog() async{
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            height: 110,
            child: Column(
              children: <Widget>[
                Text("Choose Profile Photo",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),
                SizedBox(
                  height: 20,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,children:<Widget> [
                  TextButton.icon(
                      onPressed:(){
                        igetCameraImage();

                      },
                      icon: Icon(Icons.camera,
                        color: Colors.black54,
                        size: 20,),
                      label: Text("Camera",
                          style: TextStyle(color: Colors.black54,fontSize: 20))
                  ),
                  TextButton.icon(
                      onPressed:(){
                        igetGalleryImage();

                      },
                      icon: Icon(Icons.image,
                        color: Colors.black54,
                        size: 20,),
                      label: Text("Gallery",
                          style: TextStyle(color: Colors.black54,fontSize: 20))
                  ),

                ],)
              ],
            ),

          )
      ),
    ) ;
  }


  bool validationData(){
    if(_nameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please City", backgroundColor: Colors.grey,);
      return false;
    }
    else if(_nameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Please enter valid otp", backgroundColor: Colors.grey,);
      return false;
    }
    return true;
  }

}
