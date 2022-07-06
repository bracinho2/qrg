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

  @override
  String toString() {
    return 'IvgEntity(id: $id, callSign: $callSign, city: $city, state: $state, country: $country, grid: $grid, qrg: $qrg, tone: $tone, coverage: $coverage, protocol: $protocol, informedBy: $informedBy, active: $active, operation: $operation)';
  }
}
