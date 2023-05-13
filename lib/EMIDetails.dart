class EMIDetails {
  final int month;
  final double emi;
  final double interest;
  final double principalPaid;
  final double balance;
  final String date;

  EMIDetails({
    required this.month,
    required this.emi,
    required this.interest,
    required this.principalPaid,
    required this.balance,
    required this.date,
  });
}
