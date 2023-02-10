import 'package:flutter/material.dart';
import 'package:saral_lagani/model/adbl_model.dart';

class Heading extends StatelessWidget {
  final Map<String, List<Asset>>? mapData;
  const Heading({Key? key, required this.mapData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        particulars(context),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2.5,
              child: builder(),
            ),
          ],
        )
      ],
    ));
  }

  ListView builder() {
    return ListView.builder(
                itemCount: mapData!.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (mapData!.values.elementAt(index).isNotEmpty) {
                    return Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: 1.5,
                          color: Colors.black,
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width / 5),
                                  child: Text(mapData!.keys.elementAt(index),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16))),
                            ),
                            numberData(context, index),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                });
  }

  SizedBox numberData(BuildContext context, int index) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 110,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mapData!.values.elementAt(index).length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                const Divider(
                  color: Colors.black,
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${mapData!.values.elementAt(index)[i].assetValue} ",
                  ),
                ),
              ],
            );
          }),
    );
  }

  Column particulars(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Particulars',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2,
          child: ListView.builder(
              itemCount: mapData!.values.first.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const Divider(
                      color: Colors.black,
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          mapData!.values.first
                              .elementAt(index)
                              .assetName
                              .toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis)),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
