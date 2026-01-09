class MounthlyExcussesModel {
  final int lateDay , exitDay , errandDay ;

  MounthlyExcussesModel({
    required this.lateDay,
    required this.exitDay,
    required this.errandDay,
  });

  static MounthlyExcussesModel get empty => MounthlyExcussesModel(errandDay: 0, exitDay: 0, lateDay: 0);

  Map<String,dynamic> toJson(MounthlyExcussesModel mounthlyExcusses){
    return{
      'lateDay' : mounthlyExcusses.lateDay,
      'exitDay' : mounthlyExcusses.exitDay,
      'errandDay' : mounthlyExcusses.errandDay,
    };
  }

  factory MounthlyExcussesModel.fromJson(Map<String,dynamic> json){
    return MounthlyExcussesModel(
        lateDay: json['lateDay'],
        exitDay: json['exitDay'],
        errandDay: json['errandDay']
    );
  }


}