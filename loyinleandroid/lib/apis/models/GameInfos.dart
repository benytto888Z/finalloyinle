class GameInfos {
  final int levelNB;
  final int circuitTouchNB;
  final bool hasTriggered;
  final bool startTurn;

  const GameInfos({
    required this.levelNB,
    required this.circuitTouchNB,
    required this.hasTriggered,
    required this.startTurn,
  });

  factory GameInfos.fromJson(Map<String, dynamic> json) => GameInfos(
    levelNB: json['levelNB'],
    circuitTouchNB: json['circuitTouchNB'],
    hasTriggered: json['hasTriggered'],
    startTurn: json['startTurn'],
  );

  Map<String, dynamic> toJson() => {
    'levelNB': levelNB,
    'circuitTouchNB': circuitTouchNB,
    'hasTriggered': hasTriggered,
    'startParty': startTurn,
  };

}