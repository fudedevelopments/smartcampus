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


/** This is an auto generated class representing the Events type in your schema. */
class Events extends amplify_core.Model {
  static const classType = const _EventsModelType();
  final String id;
  final String? _model;
  final List<String>? _images;
  final String? _eventname;
  final String? _details;
  final String? _location;
  final String? _date;
  final String? _registerUrl;
  final int? _expiry;
  final amplify_core.TemporalTimestamp? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EventsModelIdentifier get modelIdentifier {
      return EventsModelIdentifier(
        id: id
      );
  }
  
  String get model {
    try {
      return _model!;
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
  
  String get details {
    try {
      return _details!;
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
  
  String get registerUrl {
    try {
      return _registerUrl!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get expiry {
    try {
      return _expiry!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalTimestamp? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Events._internal({required this.id, required model, images, required eventname, required details, required location, required date, required registerUrl, required expiry, createdAt, updatedAt}): _model = model, _images = images, _eventname = eventname, _details = details, _location = location, _date = date, _registerUrl = registerUrl, _expiry = expiry, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Events({String? id, required String model, List<String>? images, required String eventname, required String details, required String location, required String date, required String registerUrl, required int expiry, amplify_core.TemporalTimestamp? createdAt}) {
    return Events._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      model: model,
      images: images != null ? List<String>.unmodifiable(images) : images,
      eventname: eventname,
      details: details,
      location: location,
      date: date,
      registerUrl: registerUrl,
      expiry: expiry,
      createdAt: createdAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Events &&
      id == other.id &&
      _model == other._model &&
      DeepCollectionEquality().equals(_images, other._images) &&
      _eventname == other._eventname &&
      _details == other._details &&
      _location == other._location &&
      _date == other._date &&
      _registerUrl == other._registerUrl &&
      _expiry == other._expiry &&
      _createdAt == other._createdAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Events {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("model=" + "$_model" + ", ");
    buffer.write("images=" + (_images != null ? _images!.toString() : "null") + ", ");
    buffer.write("eventname=" + "$_eventname" + ", ");
    buffer.write("details=" + "$_details" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("registerUrl=" + "$_registerUrl" + ", ");
    buffer.write("expiry=" + (_expiry != null ? _expiry!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.toString() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Events copyWith({String? model, List<String>? images, String? eventname, String? details, String? location, String? date, String? registerUrl, int? expiry, amplify_core.TemporalTimestamp? createdAt}) {
    return Events._internal(
      id: id,
      model: model ?? this.model,
      images: images ?? this.images,
      eventname: eventname ?? this.eventname,
      details: details ?? this.details,
      location: location ?? this.location,
      date: date ?? this.date,
      registerUrl: registerUrl ?? this.registerUrl,
      expiry: expiry ?? this.expiry,
      createdAt: createdAt ?? this.createdAt);
  }
  
  Events copyWithModelFieldValues({
    ModelFieldValue<String>? model,
    ModelFieldValue<List<String>?>? images,
    ModelFieldValue<String>? eventname,
    ModelFieldValue<String>? details,
    ModelFieldValue<String>? location,
    ModelFieldValue<String>? date,
    ModelFieldValue<String>? registerUrl,
    ModelFieldValue<int>? expiry,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? createdAt
  }) {
    return Events._internal(
      id: id,
      model: model == null ? this.model : model.value,
      images: images == null ? this.images : images.value,
      eventname: eventname == null ? this.eventname : eventname.value,
      details: details == null ? this.details : details.value,
      location: location == null ? this.location : location.value,
      date: date == null ? this.date : date.value,
      registerUrl: registerUrl == null ? this.registerUrl : registerUrl.value,
      expiry: expiry == null ? this.expiry : expiry.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value
    );
  }
  
  Events.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _model = json['model'],
      _images = json['images']?.cast<String>(),
      _eventname = json['eventname'],
      _details = json['details'],
      _location = json['location'],
      _date = json['date'],
      _registerUrl = json['registerUrl'],
      _expiry = (json['expiry'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'model': _model, 'images': _images, 'eventname': _eventname, 'details': _details, 'location': _location, 'date': _date, 'registerUrl': _registerUrl, 'expiry': _expiry, 'createdAt': _createdAt?.toSeconds(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'model': _model,
    'images': _images,
    'eventname': _eventname,
    'details': _details,
    'location': _location,
    'date': _date,
    'registerUrl': _registerUrl,
    'expiry': _expiry,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EventsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EventsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final MODEL = amplify_core.QueryField(fieldName: "model");
  static final IMAGES = amplify_core.QueryField(fieldName: "images");
  static final EVENTNAME = amplify_core.QueryField(fieldName: "eventname");
  static final DETAILS = amplify_core.QueryField(fieldName: "details");
  static final LOCATION = amplify_core.QueryField(fieldName: "location");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final REGISTERURL = amplify_core.QueryField(fieldName: "registerUrl");
  static final EXPIRY = amplify_core.QueryField(fieldName: "expiry");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Events";
    modelSchemaDefinition.pluralName = "Events";
    
    modelSchemaDefinition.authRules = [
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
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["model", "createdAt"], name: "eventsByModelAndCreatedAt")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.MODEL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.IMAGES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.EVENTNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.DETAILS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.LOCATION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.REGISTERURL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.EXPIRY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Events.CREATEDAT,
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

class _EventsModelType extends amplify_core.ModelType<Events> {
  const _EventsModelType();
  
  @override
  Events fromJson(Map<String, dynamic> jsonData) {
    return Events.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Events';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Events] in your schema.
 */
class EventsModelIdentifier implements amplify_core.ModelIdentifier<Events> {
  final String id;

  /** Create an instance of EventsModelIdentifier using [id] the primary key. */
  const EventsModelIdentifier({
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
  String toString() => 'EventsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EventsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}