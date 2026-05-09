class RequestModel {
  final String bloodType;
  final String hospital;
  final String location;
  final String notes;
  final String patientName;
  final int priority;
  final int units;
  final DateTime? createdAt;

  RequestModel({
    required this.bloodType,
    required this.hospital,
    required this.location,
    required this.notes,
    required this.patientName,
    required this.priority,
    required this.units,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'bloodType': bloodType,
      'hospital': hospital,
      'location': location,
      'notes': notes,
      'patientName': patientName,
      'priority': priority,
      'units': units,
      'createdAt': createdAt,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> json) {
    return RequestModel(
      bloodType: json['bloodType'] ?? '',
      hospital: json['hospital'] ?? '',
      location: json['location'] ?? '',
      notes: json['notes'] ?? '',
      patientName: json['patientName'] ?? '',
      priority: json['priority'] ?? 0,
      units: json['units'] ?? 0,
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as dynamic).toDate()
          : null,
    );
  }
}