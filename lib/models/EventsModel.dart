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


/** This is an auto generated class representing the EventsModel type in your schema. */
class EventsModel extends amplify_core.Model {
  static const classType = const _EventsModelModelType();
  final String id;
  final String? _eventname;
  final String? _location;
  final amplify_core.TemporalDate? _date;
  final String? _details;
  final String? _registeredUrl;
  final List<String>? _images;
  final amplify_core.TemporalTimestamp? _expiray;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EventsModelModelIdentifier get modelIdentifier {
      return EventsModelModelIdentifier(
        id: id
      );
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
  
  amplify_core.TemporalDate get date {
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
  
  String? get details {
    return _details;
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
  
  List<String>? get images {
    return _images;
  }
  
  amplify_core.TemporalTimestamp? get expiray {
    return _expiray;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EventsModel._internal({required this.id, required eventname, required location, required date, details, required registeredUrl, images, expiray, createdAt, updatedAt}): _eventname = eventname, _location = location, _date = date, _details = details, _registeredUrl = registeredUrl, _images = images, _expiray = expiray, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EventsModel({String? id, required String eventname, required String location, required amplify_core.TemporalDate date, String? details, required String registeredUrl, List<String>? images, amplify_core.TemporalTimestamp? expiray}) {
    return EventsModel._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      eventname: eventname,
      location: location,
      date: date,
      details: details,
      registeredUrl: registeredUrl,
      images: images != null ? List<String>.unmodifiable(images) : images,
      expiray: expiray);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsModel &&
      id == other.id &&
      _eventname == other._eventname &&
      _location == other._location &&
      _date == other._date &&
      _details == other._details &&
      _registeredUrl == other._registeredUrl &&
      DeepCollectionEquality().equals(_images, other._images) &&
      _expiray == other._expiray;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EventsModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("eventname=" + "$_eventname" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("details=" + "$_details" + ", ");
    buffer.write("registeredUrl=" + "$_registeredUrl" + ", ");
    buffer.write("images=" + (_images != null ? _images!.toString() : "null") + ", ");
    buffer.write("expiray=" + (_expiray != null ? _expiray!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EventsModel copyWith({String? eventname, String? location, amplify_core.TemporalDate? date, String? details, String? registeredUrl, List<String>? images, amplify_core.TemporalTimestamp? expiray}) {
    return EventsModel._internal(
      id: id,
      eventname: eventname ?? this.eventname,
      location: location ?? this.location,
      date: date ?? this.date,
      details: details ?? this.details,
      registeredUrl: registeredUrl ?? this.registeredUrl,
      images: images ?? this.images,
      expiray: expiray ?? this.expiray);
  }
  
  EventsModel copyWithModelFieldValues({
    ModelFieldValue<String>? eventname,
    ModelFieldValue<String>? location,
    ModelFieldValue<amplify_core.TemporalDate>? date,
    ModelFieldValue<String?>? details,
    ModelFieldValue<String>? registeredUrl,
    ModelFieldValue<List<String>?>? images,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? expiray
  }) {
    return EventsModel._internal(
      id: id,
      eventname: eventname == null ? this.eventname : eventname.value,
      location: location == null ? this.location : location.value,
      date: date == null ? this.date : date.value,
      details: details == null ? this.details : details.value,
      registeredUrl: registeredUrl == null ? this.registeredUrl : registeredUrl.value,
      images: images == null ? this.images : images.value,
      expiray: expiray == null ? this.expiray : expiray.value
    );
  }
  
  EventsModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _eventname = json['eventname'],
      _location = json['location'],
      _date = json['date'] != null ? amplify_core.TemporalDate.fromString(json['date']) : null,
      _details = json['details'],
      _registeredUrl = json['registeredUrl'],
      _images = json['images']?.cast<String>(),
      _expiray = json['expiray'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['expiray']) : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'eventname': _eventname, 'location': _location, 'date': _date?.format(), 'details': _details, 'registeredUrl': _registeredUrl, 'images': _images, 'expiray': _expiray?.toSeconds(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'eventname': _eventname,
    'location': _location,
    'date': _date,
    'details': _details,
    'registeredUrl': _registeredUrl,
    'images': _images,
    'expiray': _expiray,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EventsModelModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EventsModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EVENTNAME = amplify_core.QueryField(fieldName: "eventname");
  static final LOCATION = amplify_core.QueryField(fieldName: "location");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final DETAILS = amplify_core.QueryField(fieldName: "details");
  static final REGISTEREDURL = amplify_core.QueryField(fieldName: "registeredUrl");
  static final IMAGES = amplify_core.QueryField(fieldName: "images");
  static final EXPIRAY = amplify_core.QueryField(fieldName: "expiray");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EventsModel";
    modelSchemaDefinition.pluralName = "EventsModels";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "ADMINS", "STAFF" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventsModel.EVENTNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventsModel.LOCATION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventsModel.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventsModel.DETAILS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventsModel.REGISTEREDURL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventsModel.IMAGES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventsModel.EXPIRAY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _EventsModelModelType extends amplify_core.ModelType<EventsModel> {
  const _EventsModelModelType();
  
  @override
  EventsModel fromJson(Map<String, dynamic> jsonData) {
    return EventsModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EventsModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EventsModel] in your schema.
 */
class EventsModelModelIdentifier implements amplify_core.ModelIdentifier<EventsModel> {
  final String id;

  /** Create an instance of EventsModelModelIdentifier using [id] the primary key. */
  const EventsModelModelIdentifier({
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
  String toString() => 'EventsModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EventsModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}