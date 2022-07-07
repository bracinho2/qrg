import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/authentication_store.dart/authentication_store_impl.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/presenter/list_page/widgets/ivg_detail_widget.dart';
import 'package:qrg/app/modules/ivgs/presenter/list_page/widgets/ivg_location_widget.dart';

class IvgCard extends StatelessWidget {
  final IvgEntity ivgEntity;
  const IvgCard({
    Key? key,
    required this.ivgEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = Modular.get<AuthenticationImpl>();
    String? callSign;
    final user = _auth.loggedUser;
    if (user != null) {
      callSign = user.name;
    }
    return Card(
      //elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: InkWell(
        onTap: callSign == ivgEntity.informedBy
            ? () {
                Modular.to.pushNamed('/repeaters/add/', arguments: ivgEntity);
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(height: 1),
              IvgDetail(
                avatar: 'assets/images/station_avatar.jpeg',
                indicativo: ivgEntity.callSign,
                modo: ivgEntity.protocol,
                qrg: ivgEntity.qrg,
                tone: ivgEntity.tone,
              ),
              const SizedBox(height: 1),
              IvgLocation(
                cidade: ivgEntity.city,
                estado: ivgEntity.state,
                pais: ivgEntity.country,
                abrangencia: ivgEntity.coverage,
                grid: ivgEntity.grid,
                informante: ivgEntity.informedBy,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
