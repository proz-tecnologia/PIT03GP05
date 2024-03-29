import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:planney/model/category.model.dart';

enum TransactionType {
  expence,
  receipt,
  operation,
}

enum UserAccounts {
  principal,
  others,
}

class Transaction {
  String? uid;
  final TransactionType type;
  final num value;
  final UserAccounts userAccount;
  final Category category;
  final String description;
  final DateTime date;

  Transaction({
    this.uid,
    required this.type,
    required this.value,
    required this.userAccount,
    required this.category,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.name,
      'value': value,
      'userAccount': userAccount.name,
      'category': category.toMap(),
      'description': description,
      'date': Timestamp.fromDate(date),
    };
  }

  factory Transaction.fromFirestore(Map<String, dynamic> map) {
    return Transaction(
      type: EnumToString.fromString(
              [TransactionType.expence, TransactionType.receipt], map['type'])
          as TransactionType,
      value: map['value'] as num,
      userAccount: EnumToString.fromString(
              [UserAccounts.principal, UserAccounts.others], map['userAccount'])
          as UserAccounts,
      category: Category.fromFirestore(map['category']),
      description: map['description'] as String,
      date: (map['date'] as Timestamp).toDate(),
    );
  }

  Transaction copyWith({
    String? uid,
    TransactionType? type,
    double? value,
    UserAccounts? userAccount,
    Category? category,
    String? description,
    DateTime? date,
  }) {
    return Transaction(
      uid: uid ?? this.uid,
      type: type ?? this.type,
      value: value ?? this.value,
      userAccount: userAccount ?? this.userAccount,
      category: category ?? this.category,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }
}
