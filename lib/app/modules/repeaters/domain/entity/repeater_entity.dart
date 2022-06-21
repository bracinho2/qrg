class RepeaterEntity {
  String id;
  String callSign;
  String city;
  String state;
  String country;
  String grid;

  String tx;
  String rx;
  String tone;
  String coverage;
  String protocol;

  String informedBy;
  bool active;
  bool operation;

  RepeaterEntity({
    required this.id,
    required this.callSign,
    required this.city,
    required this.state,
    required this.country,
    required this.grid,
    required this.tx,
    required this.rx,
    required this.tone,
    required this.coverage,
    required this.protocol,
    required this.informedBy,
    required this.active,
    required this.operation,
  });

  @override
  String toString() {
    return 'RepeaterEntity(id: $id, callSign: $callSign, city: $city, state: $state, country: $country, grid: $grid, tx: $tx, rx: $rx, tone: $tone, coverage: $coverage, protocol: $protocol,  informedBy: $informedBy, active: $active, operation: $operation)';
  }
}
