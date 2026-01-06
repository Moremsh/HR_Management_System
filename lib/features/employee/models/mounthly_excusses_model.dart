class MounthlyExcussesModel {
  final String employeeId ;
  final int lateDay , exitDay , errandDay ;

  MounthlyExcussesModel({
    required this.employeeId,
    required this.lateDay,
    required this.exitDay,
    required this.errandDay,
  });

  Map<String,dynamic> toJson(MounthlyExcussesModel mounthlyExcusses){
    return{
      'employeeId' : mounthlyExcusses.employeeId,
      'lateDay' : mounthlyExcusses.lateDay,
      'exitDay' : mounthlyExcusses.exitDay,
      'errandDay' : mounthlyExcusses.errandDay,
    };
  }

  factory MounthlyExcussesModel.fromJson(Map<String,dynamic> json){
    return MounthlyExcussesModel(
        employeeId: json['employeeId'],
        lateDay: json['lateDay'],
        exitDay: json['exitDay'],
        errandDay: json['errandDay']
    );
  }


}