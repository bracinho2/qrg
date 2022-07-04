import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class IvgEntity {
  final String id;
  final String callSign;
  final String city;
  final String state;
  final String country;
  final String grid;
  final String qrg;
  final String tone;
  final String coverage;
  final String protocol;
  final String informedBy;
  final bool active;
  final bool operation;

  IvgEntity({
    required this.id,
    required this.callSign,
    required this.city,
    required this.state,
    required this.country,
    required this.grid,
    required this.qrg,
    required this.tone,
    required this.coverage,
    required this.protocol,
    required this.informedBy,
    required this.active,
    required this.operation,
  });
}

//errors
abstract class Failure implements Exception {
  String get message;
}

abstract class IGetIvgRepository {
  Future<Either<Failure, List<IvgEntity>>> call();
}

class ErrorMessage extends Failure {
  @override
  final String message;
  ErrorMessage({required this.message});
}

//abstract use case
abstract class IGetAllIvgUsecase {
  Future<Either<Failure, List<IvgEntity>>> call();
}

class GetAllIvgUsecase implements IGetAllIvgUsecase {
  final IGetIvgRepository _iGetIvgRepository;

  GetAllIvgUsecase(this._iGetIvgRepository);
  @override
  Future<Either<Failure, List<IvgEntity>>> call() async {
    return await _iGetIvgRepository();
  }
}

//datasource
abstract class IGetAllIvgsDatasource {
  Future<List<Map<String, dynamic>>> call();
}

class GetIvgRepository implements IGetIvgRepository {
  final IGetAllIvgsDatasource _iGetAllIvgDatasource;

  GetIvgRepository(this._iGetAllIvgDatasource);
  @override
  Future<Either<Failure, List<IvgEntity>>> call() async {
    final response = await _iGetAllIvgDatasource();
    try {
      return Right(response.map(IvgEntityMapper.fromMap).toList());
    } catch (failure) {
      return Left(
        ErrorMessage(message: 'Erro no Repositório dos IVG\'s'),
      );
    }
  }
}

class IvgEntityMapper extends IvgEntity {
  IvgEntityMapper({
    required String id,
    required String callSign,
    required String city,
    required String state,
    required String country,
    required String grid,
    required String qrg,
    required String tone,
    required String coverage,
    required String protocol,
    required String informedBy,
    required bool active,
    required bool operation,
  }) : super(
          id: id,
          callSign: callSign,
          city: city,
          state: state,
          country: country,
          grid: grid,
          qrg: qrg,
          tone: tone,
          coverage: coverage,
          protocol: protocol,
          informedBy: informedBy,
          active: active,
          operation: operation,
        );

  static Map<String, dynamic> toMap(IvgEntity repeaterEntity) {
    return {
      'id': repeaterEntity.id,
      'callSign': repeaterEntity.callSign,
      'city': repeaterEntity.city,
      'state': repeaterEntity.state,
      'country': repeaterEntity.country,
      'grid': repeaterEntity.grid,
      'qrg': repeaterEntity.qrg,
      'tone': repeaterEntity.tone,
      'coverage': repeaterEntity.coverage,
      'protocol': repeaterEntity.protocol,
      'informedBy': repeaterEntity.informedBy,
      'active': repeaterEntity.active.toString(),
      'operational': repeaterEntity.operation.toString(),
    };
  }

  factory IvgEntityMapper.fromMap(Map<String, dynamic> map) {
    return IvgEntityMapper(
      id: map['id'],
      callSign: map['callSign'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      grid: 'grid',
      qrg: map['qrg'],
      tone: map['tone'],
      coverage: map['coverage'],
      protocol: map['protocol'],
      informedBy: map['informedBy'],
      active: map['active'] != 'true' ? false : true,
      operation: map['operational'] != 'true' ? false : true,
    );
  }
}

abstract class IRemoteStorage {
  Future<List<Map<String, dynamic>>> call({required String collectionPath});
  Future<bool> add(
      {required String collectionPath, required Map<String, dynamic> map});
  Future<bool> update(
      {required String collectionPath, required Map<String, dynamic> map});
}

class GetAllIvgsDataSourceImpl implements IGetAllIvgsDatasource {
  final IRemoteStorage _firebaseService;

  GetAllIvgsDataSourceImpl(this._firebaseService);
  @override
  Future<List<Map<String, dynamic>>> call() async {
    final response = await _firebaseService.call(collectionPath: 'ivgs');

    return response;
  }
}

class FirebaseServiceImpl implements IRemoteStorage {
  final FirebaseFirestore _firestore;

  FirebaseServiceImpl(this._firestore);
  @override
  Future<List<Map<String, dynamic>>> call(
      {required String collectionPath}) async {
    final response = await _firestore.collection(collectionPath).get();

    final lista = response.docs.map((doc) {
      final map = {
        'id': doc.reference.id,
        ...doc.data(),
      };

      return map;
    }).toList();

    return lista;
  }

  @override
  Future<bool> add(
      {required String collectionPath,
      required Map<String, dynamic> map}) async {
    await _firestore.collection(collectionPath).add(map);

    return true;
  }

  @override
  Future<bool> update({
    required String collectionPath,
    required Map<String, dynamic> map,
  }) async {
    final id = map['id'];
    map.remove('id');

    await _firestore.collection(collectionPath).doc(id).update(map);
    return true;
  }
}
