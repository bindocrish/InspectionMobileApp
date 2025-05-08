
import 'package:inspection_app_mobile/common_widgets/common_import_helper.dart';

import '../common_widgets/custom_date_picker.dart';
import '../common_widgets/custom_textfield.dart';

class ViewWorkOrderScreen extends StatefulWidget {
  const ViewWorkOrderScreen({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  State<ViewWorkOrderScreen> createState() => _ViewWorkOrderScreenState();
}

class _ViewWorkOrderScreenState extends State<ViewWorkOrderScreen> {
  final TextEditingController dateController = TextEditingController(),
      accreditationController = TextEditingController(),
      inspectorController = TextEditingController(),
      clientRefNoController = TextEditingController(),
      insReqByController = TextEditingController(),
      insReqLocationController = TextEditingController(),
      clientNameController = TextEditingController(),
      projectController = TextEditingController(),
      quotationNoController = TextEditingController(),
      projectLocationController = TextEditingController(),
      clientAddressController = TextEditingController(),
      timingController = TextEditingController(),
      contactPersonController = TextEditingController(),
      contactPersonMobNoController = TextEditingController(),
      contactReviewNoController = TextEditingController()
    ;
  DateTime startDate = DateTime.now();
  bool riskExpanded = false, headerExpanded = false, checkListExpanded = false;
  final customStringHelper = CustomStringHelper();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.vertical_shades_rounded),
                InkWell(
                  onTap: () {
                    widget.onBack();
                  },
                  child: Text(
                    "Work Order",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(" / View & Edit Work Order", style: AppTextStyles.headline3),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "View Work Order [ EN.2025.00095 ]",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Work Order Type : ",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                Text("New", style: TextStyle(color: Colors.black, fontSize: 14)),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent, // No dividers
                splashColor: Colors.transparent, // No ripple
                highlightColor: Colors.transparent, // No tap highlight
                focusColor: Colors.transparent, // No focus border
              ),
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: headerExpanded ? Colors.orange : Colors.grey,
                  ),
                  color: headerExpanded ? Colors.orange : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
        
                  collapsedBackgroundColor: Colors.transparent,
                  iconColor: Colors.white,
                  onExpansionChanged: (v) {
                    setState(() {
                      headerExpanded = v;
                    });
                  },
                  collapsedIconColor: Colors.orange,
                  title: Text(
                    "Headers & Equiment Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: headerExpanded ? Colors.white : Colors.orange,
                    ),
                  ),
                  leading: Icon(Icons.topic),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.safety_check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.expand_circle_down),
                    ],
                  ),
                  children: [
                    Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: dateTextField(
                                  dateController,
                                  isValidate: false,
                                  "Date",
                                  () {
                                    CustomDatePicker().getSingleDatePicker(
                                      context,
                                      startDate,
                                      (DateTime picked) {
                                        setState(() {
                                          startDate = picked;
                                          dateController.text = customStringHelper
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
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomTextFormField(
                                    accreditationController,
                                  isValidate: false,
                                  "Accreditation"
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    inspectorController,
                                    isValidate: false,
                                    "Inspector"
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomTextFormField(
                                    clientRefNoController,
                                    isValidate: false,
                                    "Client Ref No"
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    insReqByController,
                                    isValidate: false,
                                    "Inspection Requested By"
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomTextFormField(
                                    insReqLocationController,
                                    isValidate: false,
                                    "Inspection Requested Location"
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    clientNameController,
                                    isValidate: false,
                                    "Client Name"
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomTextFormField(
                                    projectController,
                                    isValidate: false,
                                    "Project Name"
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    quotationNoController,
                                    isValidate: false,
                                    "Quotation No"
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomTextFormField(
                                    projectLocationController,
                                    isValidate: false,
                                    "Project Location"
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    clientAddressController,
                                    isValidate: false,
                                    "Client Address"
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomTextFormField(
                                    timingController,
                                    isValidate: false,
                                    "Timing"
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                    contactPersonController,
                                    isValidate: false,
                                    "Contact Person"
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomTextFormField(
                                    projectController,
                                    isValidate: false,
                                    "Contact Person Mobile No"
                                ),
                              ),
                            ],
                          ),
                          CustomTextFormField(
                              contactReviewNoController,
                              isValidate: false,
                              "Contact Review Number"
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent, // No dividers
                splashColor: Colors.transparent, // No ripple
                highlightColor: Colors.transparent, // No tap highlight
                focusColor: Colors.transparent, // No focus border
              ),
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: riskExpanded ? Colors.orange : Colors.grey,
                  ),
                  color: riskExpanded ? Colors.orange : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
        
                  collapsedBackgroundColor: Colors.transparent,
                  iconColor: Colors.white,
                  onExpansionChanged: (v) {
                    setState(() {
                      riskExpanded = v;
                    });
                  },
                  collapsedIconColor: Colors.orange,
                  title: Text(
                    "Risk Assessment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: riskExpanded ? Colors.white : Colors.orange,
                    ),
                  ),
                  leading: Icon(Icons.topic),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.safety_check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.expand_circle_down),
                    ],
                  ),
                  children: [
                    Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(children: []),
                    ),
                  ],
                ),
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent, // No dividers
                splashColor: Colors.transparent, // No ripple
                highlightColor: Colors.transparent, // No tap highlight
                focusColor: Colors.transparent, // No focus border
              ),
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: checkListExpanded ? Colors.orange : Colors.grey,
                  ),
                  color: checkListExpanded ? Colors.orange : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 16),
        
                  collapsedBackgroundColor: Colors.transparent,
                  iconColor: Colors.white,
                  onExpansionChanged: (v) {
                    setState(() {
                      checkListExpanded = v;
                    });
                  },
                  collapsedIconColor: Colors.orange,
                  title: Text(
                    "Check List & Site Visit Reports",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: checkListExpanded ? Colors.white : Colors.orange,
                    ),
                  ),
                  leading: Icon(Icons.topic),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.safety_check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.expand_circle_down),
                    ],
                  ),
                  children: [
                    Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(children: []),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
