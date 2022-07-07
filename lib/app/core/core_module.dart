import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/services/firebase_firestore/firebase_service_impl.dart';
import 'package:qrg/app/core/snack_bar_manager/snack_bar_manager.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => FirebaseFirestore.instance, export: true),
    Bind.factory((i) => FirebaseAuth.instance, export: true),
    Bind.factory((i) => FirebaseServiceImpl(i()), export: true),
    Bind.factory((i) => SnackBarManager(), export: true),
  ];
}
