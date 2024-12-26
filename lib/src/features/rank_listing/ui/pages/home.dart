import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/sizes/app_sizes.dart';
import '../../../../router/route_names.dart';
import '../../../ranking/domain/model/ranking.dart';
import '../view_models/listing_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController scrollController = ScrollController();
  final ListingViewModel listingViewModel = ListingViewModel();

  List<Ranking> get rankings => listingViewModel.items;

  @override
  void initState() {
    super.initState();
    listingViewModel.addListener(() {
      setState(() {});
    });

    listingViewModel.loadRankings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(context.namedLocation(RouteNames.ranking)),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          listingViewModel.loadRankings();
        },
        child: rankings.isEmpty
            ? const Center(child: Icon(Icons.block, size: Sizes.p64))
            : CustomScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(
                                Sizes.p8,
                              ),
                              child: Text(
                                'Ranking ${rankings[index].id}',
                              ),
                            ),
                            if (index != rankings.length - 1)
                              Divider(
                                indent: MediaQuery.sizeOf(context).width * 0.08,
                                endIndent:
                                    MediaQuery.sizeOf(context).width * 0.08,
                              ),
                          ],
                        );
                      },
                      childCount: rankings.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
