import 'package:flutter/material.dart';
import 'package:loan_app/Dashboard/Dashboard.dart';
import '../Controller/GetEnquiryController.dart';
import 'package:get/get.dart';
import '../Controller/UserProfileController.dart';
import '../Helper/String_constant.dart';
import '../Helper/globle style.dart';
import '../Helper/shared_preferances.dart';
import '../Model/GetEnquiryData.dart';
import 'UploadDocumentScreen.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);
  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  bool isApiCallProcessing = false;
  final enquiryDataController = Get.find<GetEnquiryController>();
  final profileDataController = Get.find<UserProfileController>();
  String? token='';

  @override
  void initState() {
    super.initState();
    get_token();
  }

  get_token()
  async {
    token = await SPManager.instance.getUser(LOGIN_KEY);
    if(token!=null && token!="")
    {
      profileDataController.getUserProfile();
      enquiryDataController. getEnquiry();
    }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.white,
          ),
          onPressed: () {
            Get.off(()=>Dashboard());
          },
        ),
        backgroundColor: themeColor,
        title: const Text(
          "Enquiries",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body:
      Obx(()=>enquiryDataController.getEnqurylist.isEmpty?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No Enquiries')
        ],
      ):
         ListView.builder(
          itemCount: enquiryDataController.getEnqurylist.length,
          itemBuilder: (context, index) {
            GetEnquiryData data = GetEnquiryData.fromJson(enquiryDataController.getEnqurylist[index]);
            return upload_documentDetailScreen(
              data: data,
              index: index,
            );
          },
        ),
      ),
    );
  }

}
