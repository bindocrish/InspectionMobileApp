
import 'package:inspection_app_mobile/common_widgets/common_import_helper.dart';
import '../common_widgets/custom_bottom_widget.dart';
import '../common_widgets/custom_textfield.dart';
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
          isLoading
              ? Center(child: CircularProgressIndicator())
              : inspectionDetailsList.isEmpty
              ? customWidget.getNoFoundWidget()
              : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            "Work Orders",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:
                                  filterButtonList.map((item) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item['selected'] = !item['selected'];
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 12.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              item['selected']
                                                  ? Colors.orange
                                                  : Colors.grey[300],
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                        child: Text(
                                          item['name'],
                                          style: TextStyle(
                                            color:
                                                item['selected']
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,

                            child: CustomTextFormField(
                              topPadding: 10,
                              searchQueryController,
                              "Search",
                              isValidate: false,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 40,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(55),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                  weight: 15,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Create",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(bottom: 30),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6),
                                topLeft: Radius.circular(6),
                              ),
                              color: Colors.orange,
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "WO Date",
                                    style: AppTextStyles.headline4,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Work Order",
                                    style: AppTextStyles.headline4,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "WO Type",
                                    style: AppTextStyles.headline4,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Client Name",
                                    style: AppTextStyles.headline4,
                                  ),
                                ),

                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Equipments",
                                    style: AppTextStyles.headline4,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Timing",
                                    style: AppTextStyles.headline4,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Check List",
                                    style: AppTextStyles.headline4,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "Status",
                                      style: AppTextStyles.headline4,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "Actions",
                                      style: AppTextStyles.headline4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: ListView.builder(
                              itemCount: inspectionDetailsList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                String statusName = "";
                                Color? statusColor;
                                for (var a
                                    in inspectionDetails!
                                        .data
                                        .data[index]
                                        .equipmentDetails
                                        .equipmentList) {
                                  statusColor =
                                      a.completeChecklistStatus == "PENDING"
                                          ? Colors.orange
                                          : a.completeChecklistStatus ==
                                              "COMPLETED"
                                          ? Colors.green
                                          : a.completeChecklistStatus ==
                                              "INPROGRESS"
                                          ? Colors.red
                                          : a.completeChecklistStatus ==
                                              "APPROVED"
                                          ? Colors.green
                                          : a.completeChecklistStatus ==
                                              "FORAPPROVAL"
                                          ? Colors.blue
                                          : Colors.grey;
                                  statusName = a.completeChecklistStatus;
                                }

                                return Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Row(
                                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              customStringHelper.dateFormat(
                                                inspectionDetails!
                                                    .data
                                                    .data[index]
                                                    .header
                                                    .date,
                                                AppConstants.dd_MMM_yyyy,
                                                opVal: "-",
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              customStringHelper
                                                  .stringNullCheck(
                                                    inspectionDetails!
                                                        .data
                                                        .data[index]
                                                        .workOrderNumber,
                                                    opVal: "-",
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              customStringHelper
                                                  .stringNullCheck(
                                                    inspectionDetails!
                                                        .data
                                                        .data[index]
                                                        .header
                                                        .workOrderType,
                                                    opVal: "-",
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              customStringHelper
                                                  .stringNullCheck(
                                                    inspectionDetails!
                                                        .data
                                                        .data[index]
                                                        .header
                                                        .client
                                                        .customerFullname,
                                                    opVal: "-",
                                                  ),
                                            ),
                                          ),

                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children:
                                                  inspectionDetails!
                                                      .data
                                                      .data[index]
                                                      .equipmentDetails
                                                      .equipmentList
                                                      .map(
                                                        (e) => Text(
                                                          e
                                                              .equipment
                                                              .equipmentName,
                                                        ),
                                                      )
                                                      .toList(),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              customStringHelper.onlyTimeFormat(
                                                inspectionDetails!
                                                    .data
                                                    .data[index]
                                                    .header
                                                    .timing,
                                                opVal: "-",
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "CL View",
                                                  style: TextStyle(
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "SVR View",
                                                  style: TextStyle(
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  width: 100,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          30,
                                                        ),
                                                    color: statusColor,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      statusName,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                InkWell(
                                                  onTap: (){
                                                    _bottomSheetWidget();
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    margin: EdgeInsets.only(
                                                      left: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            30,
                                                          ),
                                                      color: Colors.orange,
                                                    ),
                                                    child: Icon(
                                                      Icons.add_card_sharp,
                                                      size: 15,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.topCenter,
                                              child: Icon(
                                                Icons.remove_red_eye_sharp,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
  void _bottomSheetWidget() {

    customBottomSheet.showBottomSheet(context, StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
          return Wrap(children: [
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0))),
                padding: MediaQuery.of(context).viewInsets,
                child: Column(children: [
                  customBottomSheet.header(
                      "Work Order"),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Work Order – EN.2025.00087.R1',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Table(
                        border: TableBorder.all(color: Colors.orange.shade200),
                        columnWidths: const {
                          0: FixedColumnWidth(100),
                          1: FixedColumnWidth(70),
                          2: FixedColumnWidth(70),
                          3: FixedColumnWidth(70),
                          4: FixedColumnWidth(90),
                        },
                        children: [
                          // Row 1: Main headers (5 columns)
                          TableRow(
                            decoration: BoxDecoration(color: Colors.orange.shade50),
                            children: [
                              _buildHeaderCell('Equipment'),
                              _buildHeaderCell('WO Qty'),
                              _buildHeaderCell('Inspected Qty', colSpan: 2),
                              _buildHeaderCell('Pending Qty'),
                            ],
                          ),
                          // Row 2: Sub-headers under "Inspected Qty"
                          TableRow(
                            decoration: BoxDecoration(color: Colors.orange.shade50),
                            children: [
                              _emptyCell(), // Under "Equipment"
                              _emptyCell(), // Under "WO Qty"
                              _buildHeaderCell('Passed Qty'),
                              _buildHeaderCell('Failed Qty'),
                              _emptyCell(), // Under "Pending Qty"
                            ],
                          ),
                          // Row 3: Data row (all 5 columns filled)
                          TableRow(
                            children: [
                              _buildDataCell('Forklift'),
                              _buildDataCell('1'),
                              _buildDataCell('0'),
                              _buildDataCell('0'),
                              _buildDataCell('0'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )

                ]
                  ))
          ]);
        }));
  }
  Widget _buildHeaderCell(String text, {int rowSpan = 1, int colSpan = 1}) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        alignment: Alignment.center,
        height: rowSpan == 2 ? 80 : 40,
        padding: EdgeInsets.all(8),
        color: Colors.orange.shade50,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget _emptyCell() {
    return Container(
      height: 40,
      color: Colors.orange.shade50,
    );
  }

  Widget _buildDataCell(String text) {
    return TableCell(
      child: Container(
        alignment: Alignment.center,
        height: 40,
        padding: EdgeInsets.all(8),
        child: Text(text),
      ),
    );
  }
}
