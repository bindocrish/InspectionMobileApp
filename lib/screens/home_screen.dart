import 'package:inspection_app_mobile/common_widgets/custom_widget.dart';
import 'package:inspection_app_mobile/services/common_services/auth_service.dart';
import 'package:provider/provider.dart';
import '../common_widgets/common_import_helper.dart';
import '../common_widgets/custom_date_picker.dart';
import '../common_widgets/custom_textfield.dart';
import '../model/inspection_details_model.dart';
import '../services/work_order_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController dateFilterController = TextEditingController();
  DateTime startDate = DateTime.now();
  final customStringHelper = CustomStringHelper();
  final customWidget = CustomWidget();

  InspectionDetails? inspectionDetails;
  List<Datum> inspectionDetailsList = [];
  Client? clientDetails;
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchInspectionDetails();
  }

  Future<void> fetchInspectionDetails() async {
    try {
      final data = await InspectionDetailsService().getInspectionDetailsList(
        queryParams: {'paginate': 'No'},
      );
      setState(() {
        inspectionDetails = data;

        inspectionDetailsList = inspectionDetails!.data.data;
        for (var a in inspectionDetails!.data.data) {
          clientDetails = a.header.client;
        }

        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : inspectionDetailsList.isEmpty
        ? customWidget.getNoFoundWidget()
        : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(55),
                              color: Colors.blue,
                              //  shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/profile2.jpg',
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              bottom: 5,
                              top: 5,
                            ),
                            child: Text(
                              "John",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "Jr Inspection Engineer Of  Inspector",
                              style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: dateTextField(
                        dateFilterController,
                        isValidate: false,
                        "Upcoming Inspections",
                        () {
                          CustomDatePicker().getSingleDatePicker(
                            context,
                            startDate,
                            (DateTime picked) {
                              setState(() {
                                startDate = picked;
                                dateFilterController.text = customStringHelper
                                    .dateFormat(
                                      startDate,
                                      AppConstants.dd_MMM_yyyy,
                                    );
                              });
                            },
                          );
                        },
                        () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Inspection details for today",
                        style: AppTextStyles.headline3,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All Work Orders",
                        style: TextStyle(color: Colors.orange.shade300),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10,bottom: 30,left: 10,right: 10),
                  itemCount: (inspectionDetailsList.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    int firstIndex = index * 2;
                    int secondIndex = firstIndex + 1;

                    return Row(
                      children: [
                        Expanded(
                          child: buildWorkOrderCard(inspectionDetailsList[firstIndex]),
                        ),
                        const SizedBox(width: 16),
                        if (secondIndex < inspectionDetailsList.length)
                          Expanded(
                            child: buildWorkOrderCard(
                              inspectionDetailsList[secondIndex],
                            ),
                          )
                        else
                          const Expanded(child: SizedBox()),

                      ]
                    );
                  },
                ),
              ),

              authProvider.isSuperAdmin
                  ? Text('Super Admin first level')
                  : authProvider.isEmployee
                  ? Text('Admin second level')
                  : Text('Employee Third level Limited permission'),
            ],
          ),
        );
  }

  Widget buildWorkOrderCard(Datum order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orange.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.orange.shade400,
              borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8))
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    customStringHelper.stringNullCheck(order.workOrderNumber, opVal: "-"),
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.orange,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
         // Divider(color: Colors.orange.shade400),
          const SizedBox(height: 8),
          inspectionRowWidget(
            name: "Client Name",
            data:  order.header.client.customerFullname,
          ),
          inspectionRowWidget(
            name: "Contact Number",
            data: order.header.client.customerMobilenumber,
            textStyle: TextStyle(color: Colors.orange),
          ),
          inspectionRowWidget(name: "Accreditation", data: "General"),
          inspectionRowWidget(
            name: "Equipment",
            data: "View All",
            textStyle: TextStyle(color: Colors.orange),
          ),
          inspectionRowWidget(
            name: "Location",
            data: order.header.client.customerAddress,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget inspectionRowWidget({
    String? name,
    String? data,
    TextStyle? textStyle,
    TextOverflow? overflow,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 10,
        end: 10,
        bottom: 10,
        top: 10,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(name!, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text(" : "),
          Expanded(
            flex: 2,
            child: Text(
              customStringHelper.stringNullCheck(data, opVal: "-"),
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
