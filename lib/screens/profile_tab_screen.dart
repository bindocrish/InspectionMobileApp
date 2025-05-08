import 'package:inspection_app_mobile/common_widgets/common_import_helper.dart';

import 'package:inspection_app_mobile/screens/view_work_order_screen.dart';
import '../common_widgets/custom_bottom_widget.dart';

import '../common_widgets/custom_widget.dart';
import '../model/inspection_details_model.dart';
import '../services/work_order_service.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key});

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
  final TextEditingController searchQueryController = TextEditingController();

  List<bool> isSelected = [false, false, false, false];
  InspectionDetails? inspectionDetails;
  List<Datum> inspectionDetailsList = [];
  Client? clientDetails;
  bool isLoading = true;
  String error = '';
  final customStringHelper = CustomStringHelper();
  final customWidget = CustomWidget();
  List<Map<String, dynamic>> filterButtonList = [
    {"name": "ENAS", "selected": false},
    {"name": "EIAC-152", "selected": false},
    {"name": "EIAC-244", "selected": false},
    {"name": "GENERAL", "selected": false},
  ];
  final customBottomSheet = CustomBottomSheet();


  /// for testing
  bool showTableScreen = false;


  @override
  void initState() {
    fetchInspectionDetails();
    super.initState();
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
  void dispose() {
    searchQueryController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      showTableScreen
          ? ViewWorkOrderScreen(
        onBack: () {
          setState(() {
            showTableScreen = false;
          });
        },
      )
          : Container(
        height: 500,
        width: 500,
        color: Colors.red,
        child: InkWell(
            onTap: (){
              setState(() {
                showTableScreen = true;
              });
            },
            child: Text("Hsii")),
      )
          // isLoading
          //     ? Center(child: CircularProgressIndicator(color: Colors.orange))
          //     : inspectionDetailsList.isEmpty
          //     ? customWidget.getNoFoundWidget()
          //     : SingleChildScrollView(
          //       child: Column(
          //         children: [
          //           Padding(
          //             padding: EdgeInsets.all(8),
          //             child: Row(
          //               children: [
          //                 Text(
          //                   "Work Orders",
          //                   style: TextStyle(
          //                     color: Colors.black,
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.all(16.0),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     children:
          //                         filterButtonList.map((item) {
          //                           return GestureDetector(
          //                             onTap: () {
          //                               setState(() {
          //                                 item['selected'] = !item['selected'];
          //                               });
          //                             },
          //                             child: Container(
          //                               margin: const EdgeInsets.symmetric(
          //                                 horizontal: 8.0,
          //                               ),
          //                               padding: const EdgeInsets.symmetric(
          //                                 horizontal: 16.0,
          //                                 vertical: 12.0,
          //                               ),
          //                               decoration: BoxDecoration(
          //                                 color:
          //                                     item['selected']
          //                                         ? Colors.orange
          //                                         : Colors.grey[300],
          //                                 borderRadius: BorderRadius.circular(
          //                                   8.0,
          //                                 ),
          //                               ),
          //                               child: Text(
          //                                 item['name'],
          //                                 style: TextStyle(
          //                                   color:
          //                                       item['selected']
          //                                           ? Colors.white
          //                                           : Colors.black,
          //                                   fontSize: 16,
          //                                 ),
          //                               ),
          //                             ),
          //                           );
          //                         }).toList(),
          //                   ),
          //                 ),
          //                 Spacer(),
          //                 Expanded(
          //                   child: CustomTextFormField(
          //                     topPadding: 10,
          //                     searchQueryController,
          //                     "Search",
          //                     isValidate: false,
          //                   ),
          //                 ),
          //                 const SizedBox(width: 10),
          //                 Container(
          //                   height: 40,
          //                   padding: EdgeInsets.symmetric(
          //                     horizontal: 20,
          //                     vertical: 10,
          //                   ),
          //                   decoration: BoxDecoration(
          //                     color: Colors.orange,
          //                     borderRadius: BorderRadius.circular(55),
          //                   ),
          //                   child: Row(
          //                     children: [
          //                       Icon(
          //                         Icons.add,
          //                         size: 15,
          //                         color: Colors.white,
          //                         weight: 15,
          //                       ),
          //                       const SizedBox(width: 5),
          //                       Text(
          //                         "Create",
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Container(
          //             width: MediaQuery.of(context).size.width,
          //             padding: EdgeInsets.only(bottom: 30),
          //             margin: EdgeInsets.symmetric(
          //               horizontal: 10,
          //               vertical: 10,
          //             ),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8),
          //               color: Colors.white,
          //               border: Border.all(color: Colors.orange),
          //             ),
          //             child: Column(
          //               children: [
          //                 Container(
          //                   padding: EdgeInsets.all(8),
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.only(
          //                       topRight: Radius.circular(6),
          //                       topLeft: Radius.circular(6),
          //                     ),
          //                     color: Colors.orange,
          //                   ),
          //                   child: Row(
          //                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     children: [
          //                       Expanded(
          //                         flex: 1,
          //                         child: Container(
          //
          //
          //                           alignment: Alignment.topCenter,
          //                           child: Text(
          //                             " Date & Time",
          //                             style: AppTextStyles.headline4,
          //                           ),
          //                         ),
          //                       ),
          //                       Expanded(
          //                         flex: 1,
          //                         child: Container(
          //
          //                           alignment: Alignment.topCenter,
          //                           child: Text(
          //                             "Work Order And Client",
          //                             style: AppTextStyles.headline4,
          //                           ),
          //                         ),
          //                       ),
          //
          //                       Expanded(
          //                         flex: 1,
          //                         child: Container(
          //                           alignment: Alignment.topCenter,
          //
          //                           child: Text(
          //                             "Equipments",
          //                             style: AppTextStyles.headline4,
          //                           ),
          //                         ),
          //                       ),
          //
          //                       Expanded(
          //                         flex: 1,
          //                         child: Container(
          //
          //                           alignment: Alignment.topCenter,
          //                           child: Text(
          //                             "Status",
          //                             style: AppTextStyles.headline4,
          //                           ),
          //                         ),
          //                       ),
          //                       Expanded(
          //                         flex: 1,
          //                         child: Container(
          //
          //                           alignment: Alignment.topCenter,
          //                           child: Text(
          //                             "Actions",
          //                             style: AppTextStyles.headline4,
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: MediaQuery.of(context).size.height * 0.5,
          //                   child: ListView.builder(
          //                     itemCount: inspectionDetailsList.length,
          //                     shrinkWrap: true,
          //                     itemBuilder: (context, index) {
          //                       String statusName = "";
          //                       Color? statusColor;
          //                       for (var a
          //                           in inspectionDetails!
          //                               .data
          //                               .data[index]
          //                               .equipmentDetails
          //                               .equipmentList) {
          //                         statusColor =
          //                             a.completeChecklistStatus == "PENDING"
          //                                 ? Colors.orange
          //                                 : a.completeChecklistStatus ==
          //                                     "COMPLETED"
          //                                 ? Colors.green
          //                                 : a.completeChecklistStatus ==
          //                                     "INPROGRESS"
          //                                 ? Colors.red
          //                                 : a.completeChecklistStatus ==
          //                                     "APPROVED"
          //                                 ? Colors.green
          //                                 : a.completeChecklistStatus ==
          //                                     "FORAPPROVAL"
          //                                 ? Colors.blue
          //                                 : Colors.grey;
          //                         statusName = a.completeChecklistStatus;
          //                       }
          //
          //                       return Container(
          //                         padding: EdgeInsets.all(8),
          //                         child: Column(
          //                           children: [
          //                             Row(
          //                               //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                               children: [
          //                                 Expanded(
          //                                   flex: 1,
          //                                   child: Container(
          //
          //                                     alignment: Alignment.topCenter,
          //                                     child: Text(
          //                                       customStringHelper.dateFormat(
          //                                         inspectionDetails!
          //                                             .data
          //                                             .data[index]
          //                                             .header
          //                                             .date,
          //                                         AppConstants.dd_MMM_yyyy,
          //                                         opVal: "-",
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //                                 Expanded(
          //                                   flex: 1,
          //                                   child: Container(
          //                                     alignment: Alignment.topCenter,
          //                                     child: Column(
          //                                       children: [
          //                                         Text(
          //                                           customStringHelper
          //                                               .stringNullCheck(
          //                                                 inspectionDetails!
          //                                                     .data
          //                                                     .data[index]
          //                                                     .workOrderNumber,
          //                                                 opVal: "-",
          //                                               ),
          //                                         ),
          //                                         Text(
          //                                           customStringHelper
          //                                               .stringNullCheck(
          //                                                 inspectionDetails!
          //                                                     .data
          //                                                     .data[index]
          //                                                     .header
          //                                                     .client
          //                                                     .customerFullname,
          //                                                 opVal: "-",
          //                                               ),
          //                                         ),
          //                                       ],
          //                                     ),
          //                                   ),
          //                                 ),
          //
          //                                 Expanded(
          //                                   flex: 1,
          //                                   child: Container(
          //                                     alignment: Alignment.topCenter,
          //                                     child: Column(
          //                                       children:
          //                                           inspectionDetails!
          //                                               .data
          //                                               .data[index]
          //                                               .equipmentDetails
          //                                               .equipmentList
          //                                               .map(
          //                                                 (e) => Text(
          //                                                   e
          //                                                       .equipment
          //                                                       .equipmentName,
          //                                                 ),
          //                                               )
          //                                               .toList(),
          //                                     ),
          //                                   ),
          //                                 ),
          //
          //                                 Expanded(
          //                                   flex: 1,
          //                                   child: Row(
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     children: [
          //                                       Container(
          //                                         alignment:
          //                                             Alignment.topCenter,
          //                                         width: 100,
          //                                         height: 30,
          //                                         decoration: BoxDecoration(
          //                                           borderRadius:
          //                                               BorderRadius.circular(
          //                                                 30,
          //                                               ),
          //                                           color: statusColor,
          //                                         ),
          //                                         child: Center(
          //                                           child: Text(
          //                                             statusName,
          //                                             style: TextStyle(
          //                                               color: Colors.white,
          //                                               fontSize: 12,
          //                                             ),
          //                                           ),
          //                                         ),
          //                                       ),
          //
          //                                       InkWell(
          //                                         onTap: () {
          //                                           // _bottomSheetWidget();
          //
          //                                           Navigator.push(
          //                                             context,
          //                                             MaterialPageRoute(
          //                                               builder:
          //                                                   (context) =>
          //                                                       WorkOrderTable(),
          //                                             ),
          //                                           );
          //                                         },
          //                                         child: Container(
          //                                           alignment:
          //                                           Alignment.topCenter,
          //                                           padding: EdgeInsets.all(8),
          //                                           margin: EdgeInsets.only(
          //                                             left: 5,
          //                                           ),
          //                                           decoration: BoxDecoration(
          //                                             borderRadius:
          //                                                 BorderRadius.circular(
          //                                                   30,
          //                                                 ),
          //                                             color: Colors.orange,
          //                                           ),
          //                                           child: Icon(
          //                                             Icons.add_card_sharp,
          //                                             size: 15,
          //                                             color: Colors.white,
          //                                           ),
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //
          //                                 Expanded(
          //                                   flex: 1,
          //                                   child: InkWell(
          //                                     onTap: (){
          //
          //                                           setState(() {
          //                                             showTableScreen = false;
          //                                           });
          //
          //
          //                                     },
          //                                     child: Container(
          //                                       alignment: Alignment.topCenter,
          //                                       child: Icon(
          //                                         Icons.remove_red_eye_sharp,
          //                                         color: Colors.orange,
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                       );
          //                     },
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
    );
  }

  // void _bottomSheetWidget() {
  //   final List<String> firstRowData = ['Cell 1', 'Cell 2', 'Cell 3', 'Cell 4'];
  //   final List<String> secondRowData = [
  //     'Cell 1',
  //     'Cell 2',
  //     'Cell 3',
  //     'Cell 4',
  //     'Cell 5',
  //   ];
  //   final List<String> listViewData = [
  //     'Item 1',
  //     'Item 2',
  //     'Item 3',
  //     'Item 4',
  //     'Item 5',
  //   ];
  //   customBottomSheet.showBottomSheet(
  //     context,
  //     StatefulBuilder(
  //       builder: (BuildContext context, StateSetter stateSetter) {
  //         return Wrap(
  //           children: [
  //             Container(
  //               decoration: const BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(25.0),
  //                   topRight: Radius.circular(25.0),
  //                 ),
  //               ),
  //               padding: MediaQuery.of(context).viewInsets,
  //               child: Column(
  //                 children: [
  //                   customBottomSheet.header("Work Order"),
  //                   Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Text(
  //                         'Work Order – EN.2025.00087.R1',
  //                         style: TextStyle(
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       SizedBox(height: 10),
  //                       Table(
  //                         border: TableBorder.all(),
  //                         defaultColumnWidth: FixedColumnWidth(100.0),
  //                         children: [
  //                           // First Row with 4 cells
  //                           TableRow(
  //                             children:
  //                                 firstRowData
  //                                     .map(
  //                                       (cell) => Padding(
  //                                         padding: const EdgeInsets.all(8.0),
  //                                         child: Text(cell),
  //                                       ),
  //                                     )
  //                                     .toList(),
  //                           ),
  //                           // Second Row with 5 cells
  //                           TableRow(
  //                             children:
  //                                 secondRowData
  //                                     .map(
  //                                       (cell) => Padding(
  //                                         padding: const EdgeInsets.all(8.0),
  //                                         child: Text(cell),
  //                                       ),
  //                                     )
  //                                     .toList(),
  //                           ),
  //                           // Third Row with a ListView in one cell
  //                           TableRow(
  //                             children: [
  //                               Container(
  //                                 height: 100,
  //                                 // Set a fixed height for the ListView
  //                                 child: ListView.builder(
  //                                   itemCount: listViewData.length,
  //                                   itemBuilder: (context, index) {
  //                                     return ListTile(
  //                                       title: Text(listViewData[index]),
  //                                     );
  //                                   },
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }

}
