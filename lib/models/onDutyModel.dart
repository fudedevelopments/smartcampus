/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the onDutyModel type in your schema. */
class onDutyModel extends amplify_core.Model {
  static const classType = const _onDutyModelModelType();
  final String id;
  final String? _name;
  final String? _regNo;
  final String? _email;
  final String? _department;
  final String? _year;
  final String? _student;
  final String? _Proctor;
  final String? _Ac;
  final String? _Hod;
  final String? _eventname;
  final String? _details;
  final String? _location;
  final String? _date;
  final String? _registeredUrl;
  final List<String>? _validDocuments;
  final String? _proctorstatus;
  final String? _AcStatus;
  final String? _HodStatus;
  final amplify_core.TemporalTimestamp? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  onDutyModelModelIdentifier get modelIdentifier {
      return onDutyModelModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get regNo {
    try {
      return _regNo!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get department {
    try {
      return _department!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get year {
    try {
      return _year!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get student {
    try {
      return _student!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Proctor {
    try {
      return _Proctor!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Ac {
    try {
      return _Ac!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get Hod {
    try {
      return _Hod!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get eventname {
    try {
      return _eventname!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get details {
    return _details;
  }
  
  String get location {
    try {
      return _location!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get date {
    try {
      return _date!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get registeredUrl {
    try {
      return _registeredUrl!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get validDocuments {
    try {
      return _validDocuments!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get proctorstatus {
    return _proctorstatus;
  }
  
  String? get AcStatus {
    return _AcStatus;
  }
  
  String? get HodStatus {
    return _HodStatus;
  }
  
  amplify_core.TemporalTimestamp? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const onDutyModel._internal({required this.id, required name, required regNo, required email, required department, required year, required student, required Proctor, required Ac, required Hod, required eventname, details, required location, required date, required registeredUrl, required validDocuments, proctorstatus, AcStatus, HodStatus, createdAt, updatedAt}): _name = name, _regNo = regNo, _email = email, _department = department, _year = year, _student = student, _Proctor = Proctor, _Ac = Ac, _Hod = Hod, _eventname = eventname, _details = details, _location = location, _date = date, _registeredUrl = registeredUrl, _validDocuments = validDocuments, _proctorstatus = proctorstatus, _AcStatus = AcStatus, _HodStatus = HodStatus, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory onDutyModel({String? id, required String name, required String regNo, required String email, required String department, required String year, required String student, required String Proctor, required String Ac, required String Hod, required String eventname, String? details, required String location, required String date, required String registeredUrl, required List<String> validDocuments, String? proctorstatus, String? AcStatus, String? HodStatus, amplify_core.TemporalTimestamp? createdAt}) {
    return onDutyModel._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      regNo: regNo,
      email: email,
      department: department,
      year: year,
      student: student,
      Proctor: Proctor,
      Ac: Ac,
      Hod: Hod,
      eventname: eventname,
      details: details,
      location: location,
      date: date,
      registeredUrl: registeredUrl,
      validDocuments: validDocuments != null ? List<String>.unmodifiable(validDocuments) : validDocuments,
      proctorstatus: proctorstatus,
      AcStatus: AcStatus,
      HodStatus: HodStatus,
      createdAt: createdAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is onDutyModel &&
      id == other.id &&
      _name == other._name &&
      _regNo == other._regNo &&
      _email == other._email &&
      _department == other._department &&
      _year == other._year &&
      _student == other._student &&
      _Proctor == other._Proctor &&
      _Ac == other._Ac &&
      _Hod == other._Hod &&
      _eventname == other._eventname &&
      _details == other._details &&
      _location == other._location &&
      _date == other._date &&
      _registeredUrl == other._registeredUrl &&
      DeepCollectionEquality().equals(_validDocuments, other._validDocuments) &&
      _proctorstatus == other._proctorstatus &&
      _AcStatus == other._AcStatus &&
      _HodStatus == other._HodStatus &&
      _createdAt == other._createdAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("onDutyModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("regNo=" + "$_regNo" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("department=" + "$_department" + ", ");
    buffer.write("year=" + "$_year" + ", ");
    buffer.write("student=" + "$_student" + ", ");
    buffer.write("Proctor=" + "$_Proctor" + ", ");
    buffer.write("Ac=" + "$_Ac" + ", ");
    buffer.write("Hod=" + "$_Hod" + ", ");
    buffer.write("eventname=" + "$_eventname" + ", ");
    buffer.write("details=" + "$_details" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("registeredUrl=" + "$_registeredUrl" + ", ");
    buffer.write("validDocuments=" + (_validDocuments != null ? _validDocuments!.toString() : "null") + ", ");
    buffer.write("proctorstatus=" + "$_proctorstatus" + ", ");
    buffer.write("AcStatus=" + "$_AcStatus" + ", ");
    buffer.write("HodStatus=" + "$_HodStatus" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.toString() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  onDutyModel copyWith({String? name, String? regNo, String? email, String? department, String? year, String? student, String? Proctor, String? Ac, String? Hod, String? eventname, String? details, String? location, String? date, String? registeredUrl, List<String>? validDocuments, String? proctorstatus, String? AcStatus, String? HodStatus, amplify_core.TemporalTimestamp? createdAt}) {
    return onDutyModel._internal(
      id: id,
      name: name ?? this.name,
      regNo: regNo ?? this.regNo,
      email: email ?? this.email,
      department: department ?? this.department,
      year: year ?? this.year,
      student: student ?? this.student,
      Proctor: Proctor ?? this.Proctor,
      Ac: Ac ?? this.Ac,
      Hod: Hod ?? this.Hod,
      eventname: eventname ?? this.eventname,
      details: details ?? this.details,
      location: location ?? this.location,
      date: date ?? this.date,
      registeredUrl: registeredUrl ?? this.registeredUrl,
      validDocuments: validDocuments ?? this.validDocuments,
      proctorstatus: proctorstatus ?? this.proctorstatus,
      AcStatus: AcStatus ?? this.AcStatus,
      HodStatus: HodStatus ?? this.HodStatus,
      createdAt: createdAt ?? this.createdAt);
  }
  
  onDutyModel copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<String>? regNo,
    ModelFieldValue<String>? email,
    ModelFieldValue<String>? department,
    ModelFieldValue<String>? year,
    ModelFieldValue<String>? student,
    ModelFieldValue<String>? Proctor,
    ModelFieldValue<String>? Ac,
    ModelFieldValue<String>? Hod,
    ModelFieldValue<String>? eventname,
    ModelFieldValue<String?>? details,
    ModelFieldValue<String>? location,
    ModelFieldValue<String>? date,
    ModelFieldValue<String>? registeredUrl,
    ModelFieldValue<List<String>?>? validDocuments,
    ModelFieldValue<String?>? proctorstatus,
    ModelFieldValue<String?>? AcStatus,
    ModelFieldValue<String?>? HodStatus,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? createdAt
  }) {
    return onDutyModel._internal(
      id: id,
      name: name == null ? this.name : name.value,
      regNo: regNo == null ? this.regNo : regNo.value,
      email: email == null ? this.email : email.value,
      department: department == null ? this.department : department.value,
      year: year == null ? this.year : year.value,
      student: student == null ? this.student : student.value,
      Proctor: Proctor == null ? this.Proctor : Proctor.value,
      Ac: Ac == null ? this.Ac : Ac.value,
      Hod: Hod == null ? this.Hod : Hod.value,
      eventname: eventname == null ? this.eventname : eventname.value,
      details: details == null ? this.details : details.value,
      location: location == null ? this.location : location.value,
      date: date == null ? this.date : date.value,
      registeredUrl: registeredUrl == null ? this.registeredUrl : registeredUrl.value,
      validDocuments: validDocuments == null ? this.validDocuments : validDocuments.value,
      proctorstatus: proctorstatus == null ? this.proctorstatus : proctorstatus.value,
      AcStatus: AcStatus == null ? this.AcStatus : AcStatus.value,
      HodStatus: HodStatus == null ? this.HodStatus : HodStatus.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value
    );
  }
  
  onDutyModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _regNo = json['regNo'],
      _email = json['email'],
      _department = json['department'],
      _year = json['year'],
      _student = json['student'],
      _Proctor = json['Proctor'],
      _Ac = json['Ac'],
      _Hod = json['Hod'],
      _eventname = json['eventname'],
      _details = json['details'],
      _location = json['location'],
      _date = json['date'],
      _registeredUrl = json['registeredUrl'],
      _validDocuments = json['validDocuments']?.cast<String>(),
      _proctorstatus = json['proctorstatus'],
      _AcStatus = json['AcStatus'],
      _HodStatus = json['HodStatus'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'regNo': _regNo, 'email': _email, 'department': _department, 'year': _year, 'student': _student, 'Proctor': _Proctor, 'Ac': _Ac, 'Hod': _Hod, 'eventname': _eventname, 'details': _details, 'location': _location, 'date': _date, 'registeredUrl': _registeredUrl, 'validDocuments': _validDocuments, 'proctorstatus': _proctorstatus, 'AcStatus': _AcStatus, 'HodStatus': _HodStatus, 'createdAt': _createdAt?.toSeconds(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'regNo': _regNo,
    'email': _email,
    'department': _department,
    'year': _year,
    'student': _student,
    'Proctor': _Proctor,
    'Ac': _Ac,
    'Hod': _Hod,
    'eventname': _eventname,
    'details': _details,
    'location': _location,
    'date': _date,
    'registeredUrl': _registeredUrl,
    'validDocuments': _validDocuments,
    'proctorstatus': _proctorstatus,
    'AcStatus': _AcStatus,
    'HodStatus': _HodStatus,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<onDutyModelModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<onDutyModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final REGNO = amplify_core.QueryField(fieldName: "regNo");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final DEPARTMENT = amplify_core.QueryField(fieldName: "department");
  static final YEAR = amplify_core.QueryField(fieldName: "year");
  static final STUDENT = amplify_core.QueryField(fieldName: "student");
  static final PROCTOR = amplify_core.QueryField(fieldName: "Proctor");
  static final AC = amplify_core.QueryField(fieldName: "Ac");
  static final HOD = amplify_core.QueryField(fieldName: "Hod");
  static final EVENTNAME = amplify_core.QueryField(fieldName: "eventname");
  static final DETAILS = amplify_core.QueryField(fieldName: "details");
  static final LOCATION = amplify_core.QueryField(fieldName: "location");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final REGISTEREDURL = amplify_core.QueryField(fieldName: "registeredUrl");
  static final VALIDDOCUMENTS = amplify_core.QueryField(fieldName: "validDocuments");
  static final PROCTORSTATUS = amplify_core.QueryField(fieldName: "proctorstatus");
  static final ACSTATUS = amplify_core.QueryField(fieldName: "AcStatus");
  static final HODSTATUS = amplify_core.QueryField(fieldName: "HodStatus");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "onDutyModel";
    modelSchemaDefinition.pluralName = "onDutyModels";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "student",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.DELETE
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "STAFF" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["student", "createdAt"], name: "onDutyModelsByStudentAndCreatedAt"),
      amplify_core.ModelIndex(fields: const ["Proctor", "createdAt"], name: "onDutyModelsByProctorAndCreatedAt"),
      amplify_core.ModelIndex(fields: const ["Ac", "createdAt"], name: "onDutyModelsByAcAndCreatedAt"),
      amplify_core.ModelIndex(fields: const ["Hod", "createdAt"], name: "onDutyModelsByHodAndCreatedAt")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.REGNO,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.DEPARTMENT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.YEAR,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.STUDENT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.PROCTOR,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.AC,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.HOD,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.EVENTNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.DETAILS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.LOCATION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.REGISTEREDURL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.VALIDDOCUMENTS,
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.PROCTORSTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.ACSTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.HODSTATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: onDutyModel.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _onDutyModelModelType extends amplify_core.ModelType<onDutyModel> {
  const _onDutyModelModelType();
  
  @override
  onDutyModel fromJson(Map<String, dynamic> jsonData) {
    return onDutyModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'onDutyModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [onDutyModel] in your schema.
 */
class onDutyModelModelIdentifier implements amplify_core.ModelIdentifier<onDutyModel> {
  final String id;

  /** Create an instance of onDutyModelModelIdentifier using [id] the primary key. */
  const onDutyModelModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'onDutyModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is onDutyModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}