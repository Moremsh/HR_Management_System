class SalaryModel{
  final int housingAllowance, transportAllowance, baseSalary;

  SalaryModel({
    required this.housingAllowance,
    required this.transportAllowance,
    required this.baseSalary,
});

  static SalaryModel get empty => SalaryModel(housingAllowance: 0, transportAllowance: 0, baseSalary: 0);

  int get totalSalary => housingAllowance + transportAllowance + baseSalary;

  Map<String,dynamic> toJson(SalaryModel salary){
    return{
      'housingAllowance' : salary.housingAllowance,
      'transportAllowance' : salary.transportAllowance,
      'baseSalary' : salary.baseSalary,
    };
  }

  factory SalaryModel.fromJson(Map<String,dynamic> json){
    return SalaryModel(
        housingAllowance: json['housingAllowance'],
        transportAllowance: json['transportAllowance'],
        baseSalary: json['baseSalary']
    );
  }


}