// To parse this JSON data, do
//
//     final trialModel = trialModelFromJson(jsonString);

import 'dart:convert';

List<TrialModel> trialModelFromJson(String str) => List<TrialModel>.from(json.decode(str).map((x) => TrialModel.fromJson(x)));

String trialModelToJson(List<TrialModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrialModel {
    TrialModel({
        required this.id,
        required this.title,
        required this.symptoms,
        required this.status,
        required this.category,
        required this.startDate,
        required this.endDate,
        required this.phase,
        required this.type,
        required this.summary,
        required this.gender,
        required this.age,
        required this.inclusionCriteria,
        required this.exclusionCriteria,
        required this.outcomeMeasures,
        required this.consentInformation,
        required this.hospitalName,
        required this.zipCode,
        required this.state,
        required this.contactRole,
        required this.contactName,
        required this.contactPhone,
        required this.contactEmail,
        required this.investigators,
        required this.treatmentArm,
    });

    final String id;
    final String title;
    final String symptoms;
    final String status;
    final String category;
    final String startDate;
    final String endDate;
    final String phase;
    final String type;
    final String summary;
    final String gender;
    final int age;
    final List<String> inclusionCriteria;
    final List<String> exclusionCriteria;
    final String outcomeMeasures;
    final List<String> consentInformation;
    final String hospitalName;
    final String zipCode;
    final String state;
    final String contactRole;
    final String contactName;
    final String contactPhone;
    final String contactEmail;
    final List<Investigator> investigators;
    final List<Investigator> treatmentArm;

    factory TrialModel.fromJson(Map<String, dynamic> json) => TrialModel(
        id: json["id"],
        title: json["title"],
        symptoms: json["symptoms"],
        status: json["status"],
        category: json["category"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        phase: json["phase"],
        type: json["type"],
        summary: json["summary"],
        gender: json["gender"],
        age: json["age"],
        inclusionCriteria: List<String>.from(json["inclusionCriteria"].map((x) => x)),
        exclusionCriteria: List<String>.from(json["exclusionCriteria"].map((x) => x)),
        outcomeMeasures: json["outcomeMeasures"],
        consentInformation: List<String>.from(json["consentInformation"].map((x) => x)),
        hospitalName: json["hospitalName"],
        zipCode: json["zipCode"],
        state: json["state"],
        contactRole: json["contactRole"],
        contactName: json["contactName"],
        contactPhone: json["contactPhone"],
        contactEmail: json["contactEmail"],
        investigators: List<Investigator>.from(json["investigators"].map((x) => Investigator.fromJson(x))),
        treatmentArm: List<Investigator>.from(json["treatmentArm"].map((x) => Investigator.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "symptoms": symptoms,
        "status": status,
        "category": category,
        "startDate": startDate,
        "endDate": endDate,
        "phase": phase,
        "type": type,
        "summary": summary,
        "gender": gender,
        "age": age,
        "inclusionCriteria": List<dynamic>.from(inclusionCriteria.map((x) => x)),
        "exclusionCriteria": List<dynamic>.from(exclusionCriteria.map((x) => x)),
        "outcomeMeasures": outcomeMeasures,
        "consentInformation": List<dynamic>.from(consentInformation.map((x) => x)),
        "hospitalName": hospitalName,
        "zipCode": zipCode,
        "state": state,
        "contactRole": contactRole,
        "contactName": contactName,
        "contactPhone": contactPhone,
        "contactEmail": contactEmail,
        "investigators": List<dynamic>.from(investigators.map((x) => x.toJson())),
        "treatmentArm": List<dynamic>.from(treatmentArm.map((x) => x.toJson())),
    };
}

class Investigator {
    Investigator({
        required this.name,
        required this.department,
        required this.profile,
    });

    final String name;
    final String department;
    final String profile;

    factory Investigator.fromJson(Map<String, dynamic> json) => Investigator(
        name: json["name"],
        department: json["department"],
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "department": department,
        "profile": profile,
    };
}
