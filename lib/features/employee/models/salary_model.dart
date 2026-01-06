class SalaryModel{
  final String employeeId ;
  final double housingAllowance, transportAllowance, baseSalary;

  SalaryModel({
    required this.employeeId,
    required this.housingAllowance,
    required this.transportAllowance,
    required this.baseSalary,
});

  double totalSalary(){return housingAllowance + transportAllowance + baseSalary;}

  Map<String,dynamic> toJson(SalaryModel salary){
    return{
      'housingAllowance' : salary.housingAllowance,
      'transportAllowance' : salary.transportAllowance,
      'baseSalary' : salary.baseSalary,
    };
  }

  factory SalaryModel.fromJson(Map<String,dynamic> json){
    return SalaryModel(
        employeeId: json['employeeId'],
        housingAllowance: json['housingAllowance'],
        transportAllowance: json['transportAllowance'],
        baseSalary: json['baseSalary']
    );
  }


}