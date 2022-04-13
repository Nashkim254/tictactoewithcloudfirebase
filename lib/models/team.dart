import 'dart:convert';

import 'package:flutter/foundation.dart';

class Team {
  final String teamName;
  final String teamUid;
  final String playerUid;
  final String credits;
  final String ownerName;
  final String numPlayer;
  final String matchesWon;
  final String matchesLost;
  final String matchesDraw;
  final String roundDifference;
  final String points;
  final String completeMatches;
  final String upcomingMatches;
  final String teamAbbreviation;
  Team({
    required this.teamName,
    required this.teamUid,
    required this.playerUid,
    required this.credits,
    required this.ownerName,
    required this.numPlayer,
    required this.matchesWon,
    required this.matchesLost,
    required this.matchesDraw,
    required this.roundDifference,
    required this.points,
    required this.completeMatches,
    required this.upcomingMatches,
    required this.teamAbbreviation,
  });

  Team copyWith(
      {String? teamName,
      String? teamUid,
      String? playerUid,
      String? credits,
      String? ownerName,
      String? numPlayer,
      String? matchesWon,
      String? matchesLost,
      String? matchesDraw,
      String? roundDifference,
      String? points,
      String? completeMatches,
      String? upcomingMatches,
      String? teamAbbreviation}) {
    return Team(
        teamName: teamName ?? this.teamName,
        teamUid: teamUid ?? this.teamUid,
        playerUid: playerUid ?? this.playerUid,
        credits: credits ?? this.credits,
        ownerName: ownerName ?? this.ownerName,
        numPlayer: numPlayer ?? this.numPlayer,
        matchesWon: matchesWon ?? this.matchesWon,
        matchesLost: matchesLost ?? this.matchesLost,
        matchesDraw: matchesDraw ?? this.matchesDraw,
        roundDifference: roundDifference ?? this.roundDifference,
        points: points ?? this.points,
        completeMatches: completeMatches ?? this.completeMatches,
        upcomingMatches: upcomingMatches ?? this.upcomingMatches,
        teamAbbreviation: teamAbbreviation ?? this.teamAbbreviation);
  }

  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'teamUid': teamUid,
      'playerUid': playerUid,
      'credits': credits,
      'ownerName': ownerName,
      'numPlayer': numPlayer,
      'matchesWon': matchesWon,
      'matchesLost': matchesLost,
      'matchesDraw': matchesDraw,
      'roundDifference': roundDifference,
      'points': points,
      'completeMatches': completeMatches,
      'upcomingMatches': upcomingMatches,
      'teamAbbreviation': teamAbbreviation
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
        teamName: map['teamName'],
        teamUid: map['teamUid'],
        playerUid: map['playerUid'],
        credits: map['credits'],
        ownerName: map['ownerName'],
        numPlayer: map['numPlayer'],
        matchesWon: map['matchesWon'] ?? 0,
        matchesLost: map['matchesLost'] ?? 0,
        matchesDraw: map['matchesDraw'] ?? 0,
        roundDifference: map['roundDifference'] ?? 0,
        points: map['points'] ?? 0,
        completeMatches: map['completeMatches'] ?? 0,
        upcomingMatches: map['upcomingMatches'] ?? 0,
        teamAbbreviation: map['teamAbbreviation']);
  }


    Team.fromJson(Map<String, Object?> json)
    : this(
        teamName: json['teamName']! as String,
        teamUid: json['teamUid']! as String,
        playerUid: json['playerUid']! as String,
        credits: json['credits']! as String,
        ownerName: json['ownerName']! as String,
        numPlayer: json['numPlayer']! as String,
        matchesWon: json['matchesWon']! as String,
        matchesLost: json['matchesLost']! as String,
        matchesDraw: json['matchesDraw']! as String,
        roundDifference: json['roundDifference']! as String,
        points: json['points']! as String,
        completeMatches: json['completeMatches']! as String,
        upcomingMatches: json['upcomingMatches']! as String,
        teamAbbreviation: json['teamAbbreviation']! as String,
        
      );
  Map<String, Object?> toJson() {
    return {
      'teamName': teamName,
      'teamUid': teamUid,
      'playerUid': playerUid,
      'credits': credits,
      'ownerName': ownerName,
      'numPlayer': numPlayer,
      'matchesWon': matchesWon,
      'matchesLost': matchesLost,
      'matchesDraw': matchesDraw,
      'roundDifference': roundDifference,
      'points': points,
      'completeMatches': completeMatches,
      'upcomingMatches': upcomingMatches,
      'teamAbbreviation': teamAbbreviation,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Team &&
        other.teamName == teamName &&
        other.teamUid == teamUid &&
        other.playerUid == playerUid &&
        other.credits == credits &&
        other.ownerName == ownerName &&
        other.numPlayer == numPlayer &&
        other.matchesWon == matchesWon &&
        other.matchesLost == matchesLost &&
        other.matchesDraw == matchesDraw &&
        other.roundDifference == roundDifference &&
        other.points == points &&
        other.completeMatches ==completeMatches &&
        other.upcomingMatches == upcomingMatches &&
        other.teamAbbreviation == teamAbbreviation;
  }

  @override
  int get hashCode {
    return teamName.hashCode ^
        teamUid.hashCode ^
        playerUid.hashCode ^
        credits.hashCode ^
        ownerName.hashCode ^
        numPlayer.hashCode ^
        matchesWon.hashCode ^
        matchesLost.hashCode ^
        matchesDraw.hashCode ^
        roundDifference.hashCode ^
        points.hashCode ^
        completeMatches.hashCode ^
        upcomingMatches.hashCode ^
        teamAbbreviation.hashCode;
  }
}