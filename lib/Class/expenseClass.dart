class ExpenseClass {
  String amount;
  String ddVal;

  ExpenseClass({required this.amount, required this.ddVal});
  factory ExpenseClass.fromMap(Map<String, dynamic> map) {
    return ExpenseClass(
      amount: map['amount'],
      ddVal: map['dropdown'],
    );
  }
}
