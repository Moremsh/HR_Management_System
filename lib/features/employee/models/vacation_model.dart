class VacationModel {
  int annualDay , sickDay , casualDay, deductDay ;

  VacationModel({
    required this.annualDay,
    required this.sickDay,
    required this.casualDay,
    required this.deductDay,
  });

  static VacationModel get empty => VacationModel(annualDay: 0, sickDay: 0, casualDay: 0, deductDay: 0);

  Map<String , dynamic> toJson(VacationModel vacation){
    return{
      'annualDay' : vacation.annualDay,
      'sickDay' : vacation.sickDay,
      'casualDay' : vacation.casualDay,
      'deductDay' : vacation.deductDay,
    };
  }

  factory VacationModel.fromJson(Map<String,dynamic> json){
    return VacationModel(
        annualDay: json['annualDay'],
        sickDay: json['sickDay'],
        casualDay: json['casualDay'],
        deductDay: json['deductDay'],
    );
  }
}