

import 'dart:convert';

AdblModel adblModelFromJson(String str) => AdblModel.fromJson(json.decode(str));

//String adblModelToJson(AdblModel adblModel) => json.encode(AdblModel.toJson());

class AdblModel {
    AdblModel({
        this.assets,
    });

    final Map<String, List<Asset>>? assets;

    factory AdblModel.fromJson(Map<String, dynamic> json) => AdblModel(
        assets: Map.from(json["assets"]!).map((k, v) => MapEntry<String, List<Asset>>(k, List<Asset>.from(v.map((x) => Asset.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "assets": Map.from(assets!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
    };
}

class Asset {
    Asset({
        this.id,
        this.sector,
        this.assetName,
        this.assetValue,
        this.year,
        this.symbol,
    });

    final int? id;
    final Sector? sector;
    final String? assetName;
    final double? assetValue;
    final String? year;
    final Symbol? symbol;

    factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        id: json["id"],
        sector: sectorValues.map[json["sector"]]!,
        assetName: json["asset_name"],
        assetValue: json["asset_value"]?.toDouble(),
        year: json["year"],
        symbol: symbolValues.map[json["symbol"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sector": sectorValues.reverse[sector],
        "asset_name": assetName,
        "asset_value": assetValue,
        "year": year,
        "symbol": symbolValues.reverse[symbol],
    };
}

enum Sector { COMMERCIAL_BANKS }

final sectorValues = EnumValues({
    "Commercial Banks": Sector.COMMERCIAL_BANKS
});

enum Symbol { ADBL }

final symbolValues = EnumValues({
    "ADBL": Symbol.ADBL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
