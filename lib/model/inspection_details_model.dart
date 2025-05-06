import 'dart:convert';

InspectionDetails inspectionDetailsFromJson(String str) => InspectionDetails.fromJson(json.decode(str));

String inspectionDetailsToJson(InspectionDetails data) => json.encode(data.toJson());

class InspectionDetails {
  String type;
  Data data;

  InspectionDetails({
    required this.type,
    required this.data,
  });

  factory InspectionDetails.fromJson(Map<String, dynamic> json) => InspectionDetails(
    type: json["type"].toString(),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "data": data.toJson(),
  };
}

class Data {
  List<Datum> data;
  String totalRecords;
  String currentPage;
  String totalPages;

  Data({
    required this.data,
    required this.totalRecords,
    required this.currentPage,
    required this.totalPages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    totalRecords: json["total_records"].toString(),
    currentPage: json["current_page"].toString(),
    totalPages: json["total_pages"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "total_records": totalRecords,
    "current_page": currentPage,
    "total_pages": totalPages,
  };
}

class Datum {
  String workOrderUid;
  String workOrderNumber;
  List<String> workOrderEquipments;
  String totalEquipmentQuantity;
  String totalChecklistQuantity;
  Admin admin;
  String? user;
  GeneralSetting? generalSetting;
  Header header;
  EquipmentDetails equipmentDetails;
  RiskAssesment? riskAssesment;
  String orderCompletion;
  String feedback;
  String certificateLink;
  String checklistCount;
  String siteVisitCount;
  String certificateCount;
  String newChecklistCount;
  String reInspectionWorkOrderNumber;
  String followUpAlpha;
  String superAdminStatus;
  String adminStatus;
  String tmStatus;
  String inspectorStatus;
  String siteVisitStatus;
  String checklistStatus;
  String inspectionStatus;
  String certificateStatus;
 // List<ChecklistAssignedTechnicalManager> checklistAssignedTechnicalManager;
  String isActive;
  String isDeleted;
  String isOffline;
  String createdBy;
  String updatedBy;
  List<SiteVisit> siteVisit;
  List<Checklist> checklist;
  List<Certificate> certificate;
  String createdAt;
  String updatedAt;

  Datum({
    required this.workOrderUid,
    required this.workOrderNumber,
    required this.workOrderEquipments,
    required this.totalEquipmentQuantity,
    required this.totalChecklistQuantity,
    required this.admin,
    required this.user,
    this.generalSetting,
    required this.header,
    required this.equipmentDetails,
    required this.riskAssesment,
    required this.orderCompletion,
    required this.feedback,
    required this.certificateLink,
    required this.checklistCount,
    required this.siteVisitCount,
    required this.certificateCount,
    required this.newChecklistCount,
    required this.reInspectionWorkOrderNumber,
    required this.followUpAlpha,
    required this.superAdminStatus,
    required this.adminStatus,
    required this.tmStatus,
    required this.inspectorStatus,
    required this.siteVisitStatus,
    required this.checklistStatus,
    required this.inspectionStatus,
    required this.certificateStatus,
   // required this.checklistAssignedTechnicalManager,
    required this.isActive,
    required this.isDeleted,
    required this.isOffline,
    required this.createdBy,
    required this.updatedBy,
    required this.siteVisit,
    required this.checklist,
    required this.certificate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    workOrderUid: json["work_order_uid"].toString(),
    workOrderNumber: json["work_order_number"].toString(),
    workOrderEquipments: List<String>.from(json["work_order_equipments"].map((x) => x.toString())),
    totalEquipmentQuantity: json["total_equipment_quantity"].toString(),
    totalChecklistQuantity: json["total_checklist_quantity"].toString(),
    admin: Admin.fromJson(json["admin"]),
    user: json["user"].toString(),
    generalSetting: json["general_setting"] == null ? null : GeneralSetting.fromJson(json["general_setting"]),
    header: Header.fromJson(json["header"]),
    equipmentDetails: EquipmentDetails.fromJson(json["equipment_details"]),
    riskAssesment: json["risk_assesment"] == null ? null : RiskAssesment.fromJson(json["risk_assesment"]),
    orderCompletion: json["order_completion"].toString(),
    feedback: json["feedback"].toString(),
    certificateLink: json["certificate_link"].toString(),
    checklistCount: json["checklist_count"].toString(),
    siteVisitCount: json["site_visit_count"].toString(),
    certificateCount: json["certificate_count"].toString(),
    newChecklistCount: json["new_checklist_count"].toString(),
    reInspectionWorkOrderNumber: json["re_inspection_work_order_number"].toString(),
    followUpAlpha: json["follow_up_alpha"].toString(),
    superAdminStatus: json["super_admin_status"].toString(),
    adminStatus: json["admin_status"].toString(),
    tmStatus: json["tm_status"].toString(),
    inspectorStatus: json["inspector_status"].toString(),
    siteVisitStatus: json["site_visit_status"].toString(),
    checklistStatus: json["checklist_status"].toString(),
    inspectionStatus: json["inspection_status"].toString(),
    certificateStatus: json["certificate_status"].toString(),
   // checklistAssignedTechnicalManager: List<ChecklistAssignedTechnicalManager>.from(json["checklist_assigned_technical_manager"].map((x) => checklistAssignedTechnicalManagerValues.map[x]!)),
    isActive: json["is_active"].toString(),
    isDeleted: json["is_deleted"].toString(),
    isOffline: json["is_offline"].toString(),
    createdBy: json["created_by"].toString(),
    updatedBy: json["updated_by"].toString(),
    siteVisit: List<SiteVisit>.from(json["site_visit"].map((x) => SiteVisit.fromJson(x))),
    checklist: List<Checklist>.from(json["checklist"].map((x) => Checklist.fromJson(x))),
    certificate: List<Certificate>.from(json["certificate"].map((x) => Certificate.fromJson(x))),
    createdAt:json["created_at"].toString(),
    updatedAt:json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "work_order_uid": workOrderUid,
    "work_order_number": workOrderNumber,
    "work_order_equipments": List<dynamic>.from(workOrderEquipments.map((x) => x)),
    "total_equipment_quantity": totalEquipmentQuantity,
    "total_checklist_quantity": totalChecklistQuantity,
    "admin": admin.toJson(),
    "user":user,
    "general_setting": generalSetting?.toJson(),
    "header": header.toJson(),
    "equipment_details": equipmentDetails.toJson(),
    "risk_assesment": riskAssesment?.toJson(),
    "order_completion": orderCompletion,
    "feedback": feedback,
    "certificate_link": certificateLink,
    "checklist_count": checklistCount,
    "site_visit_count": siteVisitCount,
    "certificate_count": certificateCount,
    "new_checklist_count": newChecklistCount,
    "re_inspection_work_order_number": reInspectionWorkOrderNumber,
    "follow_up_alpha": followUpAlpha,
    "super_admin_status": superAdminStatus,
    "admin_status": adminStatus,
    "tm_status":tmStatus,
    "inspector_status": inspectorStatus,
    "site_visit_status": siteVisitStatus,
    "checklist_status":checklistStatus,
    "inspection_status": inspectionStatus,
    "certificate_status": certificateStatus,
   // "checklist_assigned_technical_manager": List<dynamic>.from(checklistAssignedTechnicalManager.map((x) => checklistAssignedTechnicalManagerValues.reverse[x])),
    "is_active": isActive,
    "is_deleted": isDeleted,
    "is_offline": isOffline,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "site_visit": List<dynamic>.from(siteVisit.map((x) => x.toJson())),
    "checklist": List<dynamic>.from(checklist.map((x) => x.toJson())),
    "certificate": List<dynamic>.from(certificate.map((x) => x.toJson())),
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Admin {
  String adminUid;
  String fullName;
  String mobileNumber;
  String userType;
  String isForgetPasswordVerified;
  String isActive;
  String isDeleted;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  String roleType;

  Admin({
    required this.adminUid,
    required this.fullName,
    required this.mobileNumber,
    required this.userType,
    required this.isForgetPasswordVerified,
    required this.isActive,
    required this.isDeleted,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.roleType,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    adminUid: json["admin_uid"].toString(),
    fullName: json["full_name"].toString(),
    mobileNumber: json["mobile_number"].toString(),
    userType: json["user_type"].toString(),
    isForgetPasswordVerified: json["is_forget_password_verified"].toString(),
    isActive: json["is_active"].toString(),
    isDeleted: json["is_deleted"].toString(),
    createdBy: json["created_by"].toString(),
    updatedBy: json["updated_by"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
    roleType: json["role_type"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "admin_uid": adminUid,
    "full_name": fullName,
    "mobile_number": mobileNumber,
    "user_type": userType,
    "is_forget_password_verified": isForgetPasswordVerified,
    "is_active": isActive,
    "is_deleted": isDeleted,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "role_type": roleType,
  };
}

class Certificate {
  String equipmentName;
  String equipmentId;
  String checklistNo;
  String certificateLink;
  String reportLink;
  String certificateStatus;
  String certificateOrReportNo;
  String checklistUid;
  String id;

  Certificate({
    required this.equipmentName,
    required this.equipmentId,
    required this.checklistNo,
    required this.certificateLink,
    required this.reportLink,
    required this.certificateStatus,
    required this.certificateOrReportNo,
    required this.checklistUid,
    required this.id,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
    equipmentName: json["equipment_name"].toString(),
    equipmentId: json["equipment_id"].toString(),
    checklistNo: json["checklist_no"].toString(),
    certificateLink: json["certificate_link"].toString(),
    reportLink: json["report_link"].toString(),
    certificateStatus: json["certificate_status"].toString(),
    certificateOrReportNo: json["certificate_or_report_no"].toString(),
    checklistUid: json["checklist_uid"].toString(),
    id: json["_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "equipment_name": equipmentName,
    "equipment_id": equipmentId,
    "checklist_no": checklistNo,
    "certificate_link": certificateLink,
    "report_link": reportLink,
    "certificate_status": certificateStatus,
    "certificate_or_report_no": certificateOrReportNo,
    "checklist_uid": checklistUid,
    "_id": id,
  };
}

class Checklist {
  String equipmentName;
  String equipmentId;
  String inspectionStatus;
  String remarksAndRecommendations;
  List<String> remark;
  String checklistType;
  List<String> recommendation;
  String checklistUid;
  String checklistNo;
  String riskAssesmentStatus;
  CertificateOrReportLink certificateOrReportLink;
  String wllTon;
  String satisfactory;
  String unsatisfactory;
  String createdAt;
  String updatedAt;

  Checklist({
    required this.equipmentName,
    required this.equipmentId,
    required this.inspectionStatus,
    required this.remarksAndRecommendations,
    required this.remark,
    required this.checklistType,
    required this.recommendation,
    required this.checklistUid,
    required this.checklistNo,
    required this.riskAssesmentStatus,
    required this.certificateOrReportLink,
    required this.wllTon,
    required this.satisfactory,
    required this.unsatisfactory,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Checklist.fromJson(Map<String, dynamic> json) => Checklist(
    equipmentName: json["equipment_name"].toString(),
    equipmentId: json["equipment_id"].toString(),
    inspectionStatus: json["inspection_status"].toString(),
    remarksAndRecommendations: json["remarks_and_recommendations"].toString(),
    remark: List<String>.from(json["remark"].map((x) => x)),
    checklistType: json["checklist_type"].toString(),
    recommendation: List<String>.from(json["recommendation"].map((x) => x)),
    checklistUid: json["checklist_uid"].toString(),
    checklistNo: json["checklist_no"].toString(),
    riskAssesmentStatus: json["risk_assesment_status"].toString(),
    certificateOrReportLink: CertificateOrReportLink.fromJson(json["certificate_or_report_link"]),
    wllTon: json["wll_ton"].toString(),
    satisfactory: json["satisfactory"].toString(),
    unsatisfactory: json["unsatisfactory"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "equipment_name": equipmentName,
    "equipment_id": equipmentId,
    "inspection_status": inspectionStatus,
    "remarks_and_recommendations": remarksAndRecommendations,
    "remark": List<dynamic>.from(remark.map((x) => x)),
    "checklist_type": checklistType,
    "recommendation": List<dynamic>.from(recommendation.map((x) => x)),
    "checklist_uid": checklistUid,
    "checklist_no": checklistNo,
    "risk_assesment_status": riskAssesmentStatus,
    "certificate_or_report_link": certificateOrReportLink.toJson(),
    "wll_ton": wllTon,
    "satisfactory": satisfactory,
    "unsatisfactory": unsatisfactory,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class CertificateOrReportLink {
  String type;
  String fileLink;

  CertificateOrReportLink({
    required this.type,
    required this.fileLink,
  });

  factory CertificateOrReportLink.fromJson(Map<String, dynamic> json) => CertificateOrReportLink(
    type: json["type"].toString(),
    fileLink: json["file_link"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "file_link": fileLink,
  };
}


class EquipmentDetails {
  String equipmentDetailsUid;
  String workOrder;
  String inspector;
  List<EquipmentList> equipmentList;
  String totalQuantity;
  String isActive;
  String isDeleted;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;

  EquipmentDetails({
    required this.equipmentDetailsUid,
    required this.workOrder,
    required this.inspector,
    required this.equipmentList,
    required this.totalQuantity,
    required this.isActive,
    required this.isDeleted,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EquipmentDetails.fromJson(Map<String, dynamic> json) => EquipmentDetails(
    equipmentDetailsUid: json["equipment_details_uid"].toString(),
    workOrder: json["work_order"].toString(),
    inspector: json["inspector"].toString(),
    equipmentList: List<EquipmentList>.from(json["equipment_list"].map((x) => EquipmentList.fromJson(x))),
    totalQuantity: json["total_quantity"].toString(),
    isActive: json["is_active"].toString(),
    isDeleted: json["is_deleted"].toString(),
    createdBy: json["created_by"].toString(),
    updatedBy: json["updated_by"].toString(),
    createdAt:json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "equipment_details_uid": equipmentDetailsUid,
    "work_order": workOrder,
    "inspector": inspector,
    "equipment_list": List<dynamic>.from(equipmentList.map((x) => x.toJson())),
    "total_quantity": totalQuantity,
    "is_active": isActive,
    "is_deleted": isDeleted,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class EquipmentList {
  EquipmentListEquipment equipment;
  String referenceStandard;
  String nscTestProcedureNumber;
  String checklistFormatDetails;
  String testCertificateFormatDetails;
  String testReportFormatDetails;
  String rejectionCriteria;
  String quantity;
  String passQtyInChecklist;
  String failQtyInChecklist;
  String quantityInChecklist;
  String followUpQuantity;
  String reInspectionQuantity;
  String completeChecklistStatus;
  List<NumberOfChecklist> numberOfChecklists;
  String additionalQuantity;
  String id;

  EquipmentList({
    required this.equipment,
    required this.referenceStandard,
    required this.nscTestProcedureNumber,
    required this.checklistFormatDetails,
    required this.testCertificateFormatDetails,
    required this.testReportFormatDetails,
    required this.rejectionCriteria,
    required this.quantity,
    required this.passQtyInChecklist,
    required this.failQtyInChecklist,
    required this.quantityInChecklist,
    required this.followUpQuantity,
    required this.reInspectionQuantity,
    required this.completeChecklistStatus,
    required this.numberOfChecklists,
    required this.additionalQuantity,
    required this.id,
  });

  factory EquipmentList.fromJson(Map<String, dynamic> json) => EquipmentList(
    equipment: EquipmentListEquipment.fromJson(json["equipment"]),
    referenceStandard: json["reference_standard"].toString(),
    nscTestProcedureNumber: json["nsc_test_procedure_number"].toString(),
    checklistFormatDetails: json["checklist_format_details"].toString(),
    testCertificateFormatDetails: json["test_certificate_format_details"].toString(),
    testReportFormatDetails: json["test_report_format_details"].toString(),
    rejectionCriteria: json["rejection_criteria"].toString(),
    quantity: json["quantity"].toString(),
    passQtyInChecklist: json["pass_qty_in_checklist"].toString(),
    failQtyInChecklist: json["fail_qty_in_checklist"].toString(),
    quantityInChecklist: json["quantity_in_checklist"].toString(),
    followUpQuantity: json["follow_up_quantity"].toString(),
    reInspectionQuantity: json["re_inspection_quantity"].toString(),
    completeChecklistStatus: json["complete_checklist_status"].toString(),
    numberOfChecklists: List<NumberOfChecklist>.from(json["number_of_checklists"].map((x) => NumberOfChecklist.fromJson(x))),
    additionalQuantity: json["additional_quantity"].toString(),
    id: json["_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "equipment": equipment.toJson(),
    "reference_standard": referenceStandard,
    "nsc_test_procedure_number": nscTestProcedureNumber,
    "checklist_format_details": checklistFormatDetails,
    "test_certificate_format_details": testCertificateFormatDetails,
    "test_report_format_details": testReportFormatDetails,
    "rejection_criteria": rejectionCriteria,
    "quantity": quantity,
    "pass_qty_in_checklist": passQtyInChecklist,
    "fail_qty_in_checklist": failQtyInChecklist,
    "quantity_in_checklist": quantityInChecklist,
    "follow_up_quantity": followUpQuantity,
    "re_inspection_quantity": reInspectionQuantity,
    "complete_checklist_status": completeChecklistStatus,
    "number_of_checklists": List<dynamic>.from(numberOfChecklists.map((x) => x.toJson())),
    "additional_quantity": additionalQuantity,
    "_id": id,
  };
}

class EquipmentListEquipment {
  String equipmentUid;
  String equipmentName;
 // List<Accreditation> accreditation;
  List<CustomerRegionElement>? region;
  String equipmentDescription;
  String? referenceStandard;
  String grade;
  String inspectionFrequency;
  String enasNscTestProcedureNumber;
  String? eiacNscTestProcedureNumber;
  String? rejectionCriteria;
  String equipmentType;
  String checklistType;
  String isActive;
  String isDeleted;
  String createdAt;
  String updatedAt;
  String generalNscTestProcedureNumber;
  String? checklistFormatDetails;
  String? siteVisitReportFormatDetails;
  String? testCertificateFormatDetails;
  String? testReportFormatDetails;
  String? workOrderFormatDetails;
  String? eiacChecklistFormatDetails;
  String? eiacReferenceStandard;
  String? eiacRejectionCriteria;
  String? eiacTestCertificateFormatDetails;
  String? eiacTestReportFormatDetails;
  String enasChecklistFormatDetails;
  String enasReferenceStandard;
  String enasRejectionCriteria;
  String enasTestCertificateFormatDetails;
  String enasTestReportFormatDetails;
  String generalChecklistFormatDetails;
  String generalReferenceStandard;
  String generalRejectionCriteria;
  String generalTestCertificateFormatDetails;
  String generalTestReportFormatDetails;
  String safetyFactor;
  String? type;
  String eiac152ChecklistFormatDetails;
  String eiac152NscTestProcedureNumber;
  String eiac152ReferenceStandard;
  String eiac152RejectionCriteria;
  String eiac152TestCertificateFormatDetails;
  String eiac152TestReportFormatDetails;
  String eiac244ChecklistFormatDetails;
  String eiac244NscTestProcedureNumber;
  String eiac244ReferenceStandard;
  String eiac244RejectionCriteria;
  String eiac244TestCertificateFormatDetails;
  String eiac244TestReportFormatDetails;

  EquipmentListEquipment({
    required this.equipmentUid,
    required this.equipmentName,
   // required this.accreditation,
    this.region,
    required this.equipmentDescription,
    this.referenceStandard,
    required this.grade,
    required this.inspectionFrequency,
    required this.enasNscTestProcedureNumber,
    this.eiacNscTestProcedureNumber,
    this.rejectionCriteria,
    required this.equipmentType,
    required this.checklistType,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.generalNscTestProcedureNumber,
    this.checklistFormatDetails,
    this.siteVisitReportFormatDetails,
    this.testCertificateFormatDetails,
    this.testReportFormatDetails,
    this.workOrderFormatDetails,
    this.eiacChecklistFormatDetails,
    this.eiacReferenceStandard,
    this.eiacRejectionCriteria,
    this.eiacTestCertificateFormatDetails,
    this.eiacTestReportFormatDetails,
    required this.enasChecklistFormatDetails,
    required this.enasReferenceStandard,
    required this.enasRejectionCriteria,
    required this.enasTestCertificateFormatDetails,
    required this.enasTestReportFormatDetails,
    required this.generalChecklistFormatDetails,
    required this.generalReferenceStandard,
    required this.generalRejectionCriteria,
    required this.generalTestCertificateFormatDetails,
    required this.generalTestReportFormatDetails,
    required this.safetyFactor,
    this.type,
    required this.eiac152ChecklistFormatDetails,
    required this.eiac152NscTestProcedureNumber,
    required this.eiac152ReferenceStandard,
    required this.eiac152RejectionCriteria,
    required this.eiac152TestCertificateFormatDetails,
    required this.eiac152TestReportFormatDetails,
    required this.eiac244ChecklistFormatDetails,
    required this.eiac244NscTestProcedureNumber,
    required this.eiac244ReferenceStandard,
    required this.eiac244RejectionCriteria,
    required this.eiac244TestCertificateFormatDetails,
    required this.eiac244TestReportFormatDetails,
  });

  factory EquipmentListEquipment.fromJson(Map<String, dynamic> json) => EquipmentListEquipment(
    equipmentUid: json["equipment_uid"].toString(),
    equipmentName: json["equipment_name"].toString(),
  //  accreditation: List<Accreditation>.from(json["accreditation"].map((x) => accreditationValues.map[x]!)),
    region: json["region"] == null ? [] : List<CustomerRegionElement>.from(json["region"]!.map((x) => CustomerRegionElement.fromJson(x))),
    equipmentDescription: json["equipment_description"].toString(),
    referenceStandard: json["reference_standard"].toString(),
    grade: json["grade"].toString(),
    inspectionFrequency: json["inspection_frequency"].toString(),
    enasNscTestProcedureNumber: json["enas_nsc_test_procedure_number"].toString(),
    eiacNscTestProcedureNumber: json["eiac_nsc_test_procedure_number"].toString(),
    rejectionCriteria: json["rejection_criteria"].toString(),
    equipmentType: json["equipment_type"].toString(),
    checklistType: json["checklist_type"].toString(),
    isActive: json["is_active"].toString(),
    isDeleted: json["is_deleted"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
    generalNscTestProcedureNumber: json["general_nsc_test_procedure_number"].toString(),
    checklistFormatDetails: json["checklist_format_details"].toString(),
    siteVisitReportFormatDetails: json["site_visit_report_format_details"].toString(),
    testCertificateFormatDetails: json["test_certificate_format_details"].toString(),
    testReportFormatDetails: json["test_report_format_details"].toString(),
    workOrderFormatDetails: json["work_order_format_details"].toString(),
    eiacChecklistFormatDetails: json["eiac_checklist_format_details"].toString(),
    eiacReferenceStandard: json["eiac_reference_standard"].toString(),
    eiacRejectionCriteria: json["eiac_rejection_criteria"].toString(),
    eiacTestCertificateFormatDetails: json["eiac_test_certificate_format_details"].toString(),
    eiacTestReportFormatDetails: json["eiac_test_report_format_details"].toString(),
    enasChecklistFormatDetails: json["enas_checklist_format_details"].toString(),
    enasReferenceStandard: json["enas_reference_standard"].toString(),
    enasRejectionCriteria: json["enas_rejection_criteria"].toString(),
    enasTestCertificateFormatDetails: json["enas_test_certificate_format_details"].toString(),
    enasTestReportFormatDetails: json["enas_test_report_format_details"].toString(),
    generalChecklistFormatDetails: json["general_checklist_format_details"].toString(),
    generalReferenceStandard: json["general_reference_standard"].toString(),
    generalRejectionCriteria: json["general_rejection_criteria"].toString(),
    generalTestCertificateFormatDetails: json["general_test_certificate_format_details"].toString(),
    generalTestReportFormatDetails: json["general_test_report_format_details"].toString(),
    safetyFactor: json["safety_factor"].toString(),
    type: json["type"].toString(),
    eiac152ChecklistFormatDetails: json["eiac_152_checklist_format_details"].toString(),
    eiac152NscTestProcedureNumber: json["eiac_152_nsc_test_procedure_number"].toString(),
    eiac152ReferenceStandard: json["eiac_152_reference_standard"].toString(),
    eiac152RejectionCriteria: json["eiac_152_rejection_criteria"].toString(),
    eiac152TestCertificateFormatDetails: json["eiac_152_test_certificate_format_details"].toString(),
    eiac152TestReportFormatDetails: json["eiac_152_test_report_format_details"].toString(),
    eiac244ChecklistFormatDetails: json["eiac_244_checklist_format_details"].toString(),
    eiac244NscTestProcedureNumber: json["eiac_244_nsc_test_procedure_number"].toString(),
    eiac244ReferenceStandard: json["eiac_244_reference_standard"].toString(),
    eiac244RejectionCriteria: json["eiac_244_rejection_criteria"].toString(),
    eiac244TestCertificateFormatDetails: json["eiac_244_test_certificate_format_details"].toString(),
    eiac244TestReportFormatDetails: json["eiac_244_test_report_format_details"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "equipment_uid": equipmentUid,
    "equipment_name": equipmentName,
   // "accreditation": List<dynamic>.from(accreditation.map((x) => accreditationValues.reverse[x])),
    "region": region == null ? [] : List<dynamic>.from(region!.map((x) => x.toJson())),
    "equipment_description": equipmentDescription,
    "reference_standard":referenceStandard,
    "grade": grade,
    "inspection_frequency": inspectionFrequency,
    "enas_nsc_test_procedure_number": enasNscTestProcedureNumber,
    "eiac_nsc_test_procedure_number": eiacNscTestProcedureNumber,
    "rejection_criteria": rejectionCriteria,
    "equipment_type": equipmentType,
    "checklist_type": checklistType,
    "is_active": isActive,
    "is_deleted": isDeleted,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "general_nsc_test_procedure_number": generalNscTestProcedureNumber,
    "checklist_format_details": checklistFormatDetails,
    "site_visit_report_format_details": siteVisitReportFormatDetails,
    "test_certificate_format_details": testCertificateFormatDetails,
    "test_report_format_details": testReportFormatDetails,
    "work_order_format_details": workOrderFormatDetails,
    "eiac_checklist_format_details": eiacChecklistFormatDetails,
    "eiac_reference_standard": eiacReferenceStandard,
    "eiac_rejection_criteria": eiacRejectionCriteria,
    "eiac_test_certificate_format_details": eiacTestCertificateFormatDetails,
    "eiac_test_report_format_details": eiacTestReportFormatDetails,
    "enas_checklist_format_details": enasChecklistFormatDetails,
    "enas_reference_standard": enasReferenceStandard,
    "enas_rejection_criteria": enasRejectionCriteria,
    "enas_test_certificate_format_details": enasTestCertificateFormatDetails,
    "enas_test_report_format_details": enasTestReportFormatDetails,
    "general_checklist_format_details": generalChecklistFormatDetails,
    "general_reference_standard": generalReferenceStandard,
    "general_rejection_criteria": generalRejectionCriteria,
    "general_test_certificate_format_details": generalTestCertificateFormatDetails,
    "general_test_report_format_details": generalTestReportFormatDetails,
    "safety_factor": safetyFactor,
    "type": type,
    "eiac_152_checklist_format_details": eiac152ChecklistFormatDetails,
    "eiac_152_nsc_test_procedure_number": eiac152NscTestProcedureNumber,
    "eiac_152_reference_standard": eiac152ReferenceStandard,
    "eiac_152_rejection_criteria": eiac152RejectionCriteria,
    "eiac_152_test_certificate_format_details": eiac152TestCertificateFormatDetails,
    "eiac_152_test_report_format_details": eiac152TestReportFormatDetails,
    "eiac_244_checklist_format_details": eiac244ChecklistFormatDetails,
    "eiac_244_nsc_test_procedure_number": eiac244NscTestProcedureNumber,
    "eiac_244_reference_standard": eiac244ReferenceStandard,
    "eiac_244_rejection_criteria": eiac244RejectionCriteria,
    "eiac_244_test_certificate_format_details": eiac244TestCertificateFormatDetails,
    "eiac_244_test_report_format_details": eiac244TestReportFormatDetails,
  };
}

class CustomerRegionElement {
  String regionUid;
  String regionName;
  String regionDetails;
  String isActive;
  String isDeleted;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;

  CustomerRegionElement({
    required this.regionUid,
    required this.regionName,
    required this.regionDetails,
    required this.isActive,
    required this.isDeleted,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CustomerRegionElement.fromJson(Map<String, dynamic> json) => CustomerRegionElement(
    regionUid: json["region_uid"].toString(),
    regionName: json["region_name"].toString(),
    regionDetails: json["region_details"].toString(),
    isActive: json["is_active"].toString(),
    isDeleted: json["is_deleted"].toString(),
    createdBy:json["created_by"].toString(),
    updatedBy:json["updated_by"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "region_uid": regionUid,
    "region_name": regionName,
    "region_details": regionDetails,
    "is_active": isActive,
    "is_deleted": isDeleted,
    "created_by": createdBy,
    "updated_by":updatedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class NumberOfChecklist {
  String checklistId;
  String checklistCompletionStatus;
  String id;

  NumberOfChecklist({
    required this.checklistId,
    required this.checklistCompletionStatus,
    required this.id,
  });

  factory NumberOfChecklist.fromJson(Map<String, dynamic> json) => NumberOfChecklist(
    checklistId: json["checklist_id"].toString(),
    checklistCompletionStatus: json["checklist_completion_status"].toString(),
    id: json["_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "checklist_id": checklistId,
    "checklist_completion_status": checklistCompletionStatus,
    "_id": id,
  };
}

class Inspector {
  String userUid;
  List<EquipmentElement> equipments;
  String region;
  String roleType;
 // List<Accreditation> accreditation;
  String fullName;
  String mobileNumber;
  String countryCode;
  String employeeNumber;
  String dateOfJoining;
  String userName;
  String reportingManager;
  String address;
  String userSignature;
  String isActive;
  String isDeleted;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;

  Inspector({
    required this.userUid,
    required this.equipments,
    required this.region,
    required this.roleType,
   // required this.accreditation,
    required this.fullName,
    required this.mobileNumber,
    required this.countryCode,
    required this.employeeNumber,
    required this.dateOfJoining,
    required this.userName,
    required this.reportingManager,
    required this.address,
    required this.userSignature,
    required this.isActive,
    required this.isDeleted,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Inspector.fromJson(Map<String, dynamic> json) => Inspector(
    userUid: json["user_uid"].toString(),
    equipments: List<EquipmentElement>.from(json["equipments"].map((x) => EquipmentElement.fromJson(x))),
    region: json["region"].toString(),
    roleType: json["role_type"].toString(),
   // accreditation: List<Accreditation>.from(json["accreditation"].map((x) => accreditationValues.map[x]!)),
    fullName: json["full_name"].toString(),
    mobileNumber: json["mobile_number"].toString(),
    countryCode: json["country_code"].toString(),
    employeeNumber: json["employee_number"].toString(),
    dateOfJoining: json["date_of_joining"].toString(),
    userName: json["user_name"].toString(),
    reportingManager: json["reporting_manager"].toString(),
    address: json["address"].toString(),
    userSignature: json["user_signature"].toString(),
    isActive: json["is_active"].toString(),
    isDeleted: json["is_deleted"].toString(),
    createdBy: json["created_by"].toString(),
    updatedBy: json["updated_by"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "user_uid": userUid,
    "equipments": List<dynamic>.from(equipments.map((x) => x.toJson())),
    "region": region,
    "role_type": roleType,
  //  "accreditation": List<dynamic>.from(accreditation.map((x) => accreditationValues.reverse[x])),
    "full_name": fullName,
    "mobile_number": mobileNumber,
    "country_code": countryCode,
    "employee_number": employeeNumber,
    "date_of_joining": dateOfJoining,
    "user_name": userName,
    "reporting_manager": reportingManager,
    "address": address,
    "user_signature": userSignature,
    "is_active": isActive,
    "is_deleted": isDeleted,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}



class EquipmentElement {
  EquipmentListEquipment equipment;
//  List<Accreditation> accreditation;
  String id;

  EquipmentElement({
    required this.equipment,
  //  required this.accreditation,
    required this.id,
  });

  factory EquipmentElement.fromJson(Map<String, dynamic> json) => EquipmentElement(
    equipment: EquipmentListEquipment.fromJson(json["equipment"]),
  //  accreditation: List<Accreditation>.from(json["accreditation"].map((x) => accreditationValues.map[x]!)),
    id: json["_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "equipment": equipment.toJson(),
   // "accreditation": List<dynamic>.from(accreditation.map((x) => accreditationValues.reverse[x])),
    "_id": id,
  };
}


class GeneralSetting {
  String workOrderFormatDetails;
  String siteVisitReportFormatDetails;
  String? imageEnas;
  String? imageEnasLink;
  String? imageGeneral;
  String? imageGeneralLink;

  GeneralSetting({
    required this.workOrderFormatDetails,
    required this.siteVisitReportFormatDetails,
    this.imageEnas,
    this.imageEnasLink,
    this.imageGeneral,
    this.imageGeneralLink,
  });

  factory GeneralSetting.fromJson(Map<String, dynamic> json) => GeneralSetting(
    workOrderFormatDetails: json["work_order_format_details"],
    siteVisitReportFormatDetails: json["site_visit_report_format_details"],
    imageEnas: json["image_enas"],
    imageEnasLink: json["image_enas_link"],
    imageGeneral: json["image_general"],
    imageGeneralLink: json["image_general_link"],
  );

  Map<String, dynamic> toJson() => {
    "work_order_format_details": workOrderFormatDetails,
    "site_visit_report_format_details": siteVisitReportFormatDetails,
    "image_enas": imageEnas,
    "image_enas_link": imageEnasLink,
    "image_general": imageGeneral,
    "image_general_link": imageGeneralLink,
  };
}

class Header {
  String headerUid;
  String date;
  String accreditation;
  String quotationNo;
  String clientReferenceNo;
  String workOrderType;
  String projectName;
  String region;
  String timing;
  List<ContactDetail> contactDetails;
  String inspectionRequestedBy;
  String inspectionRequestedByLocation;
  String contractReviewNumber;
  Client client;
  String isActive;
  String isDeleted;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;

  Header({
    required this.headerUid,
    required this.date,
    required this.accreditation,
    required this.quotationNo,
    required this.clientReferenceNo,
    required this.workOrderType,
    required this.projectName,
    required this.region,
    required this.timing,
    required this.contactDetails,
    required this.inspectionRequestedBy,
    required this.inspectionRequestedByLocation,
    required this.contractReviewNumber,
    required this.client,
    required this.isActive,
    required this.isDeleted,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
    headerUid: json["header_uid"].toString(),
    date: json["date"].toString(),
    accreditation: json["accreditation"].toString(),
    quotationNo: json["quotation_no"].toString(),
    clientReferenceNo: json["client_reference_no"].toString(),
    workOrderType: json["work_order_type"].toString(),
    projectName: json["project_name"].toString(),
    region: json["region"].toString(),
    timing: json["timing"].toString(),
    contactDetails: List<ContactDetail>.from(json["contact_details"].map((x) => ContactDetail.fromJson(x))),
    inspectionRequestedBy: json["inspection_requested_by"].toString(),
    inspectionRequestedByLocation: json["inspection_requested_by_location"].toString(),
    contractReviewNumber: json["contract_review_number"].toString(),
    client: Client.fromJson(json["client"]),
    isActive: json["is_active"].toString(),
    isDeleted: json["is_deleted"].toString(),
    createdBy: json["created_by"].toString(),
    updatedBy: json["updated_by"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "header_uid": headerUid,
    "date": date,
    "accreditation": accreditation,
    "quotation_no": quotationNo,
    "client_reference_no": clientReferenceNo,
    "work_order_type": workOrderType,
    "project_name": projectName,
    "region": region,
    "timing": timing,
    "contact_details": List<dynamic>.from(contactDetails.map((x) => x.toJson())),
    "inspection_requested_by": inspectionRequestedBy,
    "inspection_requested_by_location": inspectionRequestedByLocation,
    "contract_review_number": contractReviewNumber,
    "client": client.toJson(),
    "is_active": isActive,
    "is_deleted": isDeleted,
    "created_by": createdBy,
    "updated_by": createdBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Client {
  String customerUid;
  String customerFullname;
  String customerMobilenumber;
  String customerEmail;
  CustomerRegionElement? customerRegion;
  String customerAddress;
  String countryCode;
  String customerLandlineNo;
  String? accreditation;
  List<ContactPersonDetail> contactPersonDetails;
  String clientUniqueNumber;
  String isActive;
  String isDeleted;
  String createdAt;
  String updatedAt;

  Client({
    required this.customerUid,
    required this.customerFullname,
    required this.customerMobilenumber,
    required this.customerEmail,
    required this.customerRegion,
    required this.customerAddress,
    required this.countryCode,
    required this.customerLandlineNo,
    this.accreditation,
    required this.contactPersonDetails,
    required this.clientUniqueNumber,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    customerUid: json["customer_uid"].toString(),
    customerFullname: json["customer_fullname"].toString(),
    customerMobilenumber: json["customer_mobilenumber"].toString(),
    customerEmail: json["customer_email"].toString(),
    customerRegion: json["customer_region"] == null ? null : CustomerRegionElement.fromJson(json["customer_region"]),
    customerAddress: json["customer_address"].toString(),
    countryCode:json["country_code"].toString(),
    customerLandlineNo: json["customer_landline_no"].toString(),
    accreditation: json["accreditation"].toString(),
    contactPersonDetails: List<ContactPersonDetail>.from(json["contact_person_details"].map((x) => ContactPersonDetail.fromJson(x))),
    clientUniqueNumber: json["client_unique_number"].toString(),
    isActive: json["is_active"].toString(),
    isDeleted: json["is_deleted"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "customer_uid": customerUid,
    "customer_fullname": customerFullname,
    "customer_mobilenumber": customerMobilenumber,
    "customer_email": customerEmail,
    "customer_region": customerRegion?.toJson(),
    "customer_address":customerAddress,
    "country_code": countryCode,
    "customer_landline_no": countryCode,
    "accreditation": accreditation,
    "contact_person_details": List<dynamic>.from(contactPersonDetails.map((x) => x.toJson())),
    "client_unique_number": clientUniqueNumber,
    "is_active": isActive,
    "is_deleted": isDeleted,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class ContactPersonDetail {
  String contactPersonFullname;
  String contactPersonMobilenumber;
  String contactPersonCountryCode;
  String contactUniqueNumber;
  String contactPersonEmail;
  String contactPersonAddress;
  String isPrimary;
  String id;

  ContactPersonDetail({
    required this.contactPersonFullname,
    required this.contactPersonMobilenumber,
    required this.contactPersonCountryCode,
    required this.contactUniqueNumber,
    required this.contactPersonEmail,
    required this.contactPersonAddress,
    required this.isPrimary,
    required this.id,
  });

  factory ContactPersonDetail.fromJson(Map<String, dynamic> json) => ContactPersonDetail(
    contactPersonFullname: json["contact_person_fullname"].toString(),
    contactPersonMobilenumber: json["contact_person_mobilenumber"].toString(),
    contactPersonCountryCode: json["contact_person_country_code"].toString(),
    contactUniqueNumber: json["contact_unique_number"].toString(),
    contactPersonEmail:json["contact_person_email"].toString(),
    contactPersonAddress: json["contact_person_address"].toString(),
    isPrimary: json["is_primary"].toString(),
    id: json["_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "contact_person_fullname": contactPersonFullname,
    "contact_person_mobilenumber": contactPersonMobilenumber,
    "contact_person_country_code": contactPersonCountryCode,
    "contact_unique_number": contactUniqueNumber,
    "contact_person_email": contactPersonEmail,
    "contact_person_address": contactPersonAddress,
    "is_primary": isPrimary,
    "_id": id,
  };
}

class ContactDetail {
  String contactPersonName;
  String contactPersonCountryCode;
  String contactPersonMobilenumber;
  String id;

  ContactDetail({
    required this.contactPersonName,
    required this.contactPersonCountryCode,
    required this.contactPersonMobilenumber,
    required this.id,
  });

  factory ContactDetail.fromJson(Map<String, dynamic> json) => ContactDetail(
    contactPersonName: json["contact_person_name"].toString(),
    contactPersonCountryCode: json["contact_person_country_code"].toString(),
    contactPersonMobilenumber: json["contact_person_mobilenumber"].toString(),
    id: json["_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "contact_person_name":contactPersonName,
    "contact_person_country_code": contactPersonCountryCode,
    "contact_person_mobilenumber": contactPersonMobilenumber,
    "_id": id,
  };
}

class RiskAssesment {
  String riskAssesmentUid;
  String checklist;
  Map<String, AssesmentDetail> assesmentDetails;
  String notes;
  String assesmentType;
  String isActive;
  String isDeleted;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;

  RiskAssesment({
    required this.riskAssesmentUid,
    required this.checklist,
    required this.assesmentDetails,
    required this.notes,
    required this.assesmentType,
    required this.isActive,
    required this.isDeleted,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RiskAssesment.fromJson(Map<String, dynamic> json) => RiskAssesment(
    riskAssesmentUid: json["risk_assesment_uid"].toString(),
    checklist: json["checklist"].toString(),
    assesmentDetails: Map.from(json["assesment_details"]).map((k, v) => MapEntry<String, AssesmentDetail>(k, AssesmentDetail.fromJson(v))),
    notes: json["notes"].toString(),
    assesmentType: json["assesment_type"].toString(),
    isActive: json["is_active"].toString(),
    isDeleted: json["is_deleted"].toString(),
    createdBy: json["created_by"].toString(),
    updatedBy: json["updated_by"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "risk_assesment_uid": riskAssesmentUid,
    "checklist": checklist,
    "assesment_details": Map.from(assesmentDetails).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "notes": notes,
    "assesment_type": assesmentType,
    "is_active": isActive,
    "is_deleted": isDeleted,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class AssesmentDetail {
  String riskFactor;
  String controlMeasure;

  AssesmentDetail({
    required this.riskFactor,
    required this.controlMeasure,
  });

  factory AssesmentDetail.fromJson(Map<String, dynamic> json) => AssesmentDetail(
    riskFactor: json["risk_factor"],
    controlMeasure: json["control_measure"],
  );

  Map<String, dynamic> toJson() => {
    "risk_factor": riskFactor,
    "control_measure": controlMeasure,
  };
}


class SiteVisit {
  String siteVisitUid;
  String siteVisitSubmittedAt;
  String id;

  SiteVisit({
    required this.siteVisitUid,
    required this.siteVisitSubmittedAt,
    required this.id,
  });

  factory SiteVisit.fromJson(Map<String, dynamic> json) => SiteVisit(
    siteVisitUid: json["site_visit_uid"].toString(),
    siteVisitSubmittedAt: json["site_visit_submitted_at"].toString(),
    id: json["_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "site_visit_uid": siteVisitUid,
    "site_visit_submitted_at": siteVisitSubmittedAt,
    "_id": id,
  };
}

