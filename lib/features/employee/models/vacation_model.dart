class VacationModel {
  final String employeeId ;
  final int annualDay , sickDay , casualDay, deductDay ;

  VacationModel({
    required this.employeeId,
    required this.annualDay,
    required this.sickDay,
    required this.casualDay,
    required this.deductDay,
  });

  Map<String , dynamic> toJson(){
    return{
      'employeeId' : employeeId,
      'annualDay' : annualDay,
      'sickDay' : sickDay,
      'casualDay' : casualDay,
      'deductDay' : deductDay,
    };
  }

  factory VacationModel.fromJson(Map<String,dynamic> json){
    return VacationModel(
        employeeId: json['employeeId'],
        annualDay: json['annualDay'],
        sickDay: json['sickDay'],
        casualDay: json['casualDay'],
        deductDay: json['deductDay'],
    );
  }
}