import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/snack_bar_manager/snack_bar_manager.dart';
import 'package:qrg/app/modules/repeaters/external/firebase/firebase_service_impl.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => FirebaseFirestore.instance, export: true),
    Bind.factory((i) => FirebaseAuth.instance, export: true),
    Bind.factory((i) => FirebaseServiceImpl(i()), export: true),
    Bind.factory((i) => SnackBarManager(), export: true),
  ];
}
