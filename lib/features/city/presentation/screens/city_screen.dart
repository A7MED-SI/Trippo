import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trippo/features/city/presentation/bloc/city_bloc/city_bloc.dart';
import 'package:trippo/features/city/presentation/widgets/loading.dart';
import 'package:trippo/features/map/presentation/widgets/map_list_image.dart';
import 'package:trippo/injection.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/asset_svg.dart';
import '../../../../core/widgets/main_indicator.dart';
import '../widgets/overview_page.dart';

class CityScreen extends StatefulWidget {
  static const String routeName = 'city_screen';
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> with TickerProviderStateMixin {
  late final TabController tabController;
  late CityBloc cityBloc;
  @override
  void initState() {
    cityBloc = CityBloc(
        getThingsToDoCityUseCase: serviceLocator(),
        getRestaurantsOfCityUseCase: serviceLocator(),
        getHotelsOfCityUseCase: serviceLocator(),
        getCityByIdUseCase: serviceLocator())
      ..add(const GetCityEvent(cityId: 1));
      // ..add(const GetHotelsOfCityEvent(cityId: 0))
      // ..add(const GetRestaurantsOfCityEvent(cityId: 0))
      // ..add(const GetThingsToDoCityEvent(cityId: 0));
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => cityBloc,
      child: Scaffold(
        body: BlocBuilder<CityBloc, CityState>(
          builder: (context, state) {
            if (state.cityStatus == GetCityStatus.loading ||
                state.cityStatus == GetCityStatus.initial) {
                   log("Load");
              return const LoadingScreen();
            } else if (state.cityStatus == GetCityStatus.failure) {
              log("Fail");
              //TODO:create fail Bloc
              return Container();
            } else {
              return SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder: (context, _) {
                    return [
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverSafeArea(
                          sliver: SliverAppBar(
                            pinned: true,
                            floating: true,
                            snap: true,
                            foregroundColor: Theme.of(context).primaryColor,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            elevation: 0,
                            leading: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: AssetSvg(
                                SvgImages.arrowBackward,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            flexibleSpace: FlexibleSpaceBar(
                              titlePadding:
                                  EdgeInsets.only(bottom: size.width * .15),
                              centerTitle: true,
                              title: Text(
                                state.city.name ?? "City Name",
                                style: AppTextStyles.styleWeight600(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            actions: const [
                              Padding(
                                padding: EdgeInsetsDirectional.only(end: 8),
                                child: Icon(Icons.search),
                              )
                            ],
                            bottom: TabBar(
                              controller: tabController,
                              isScrollable: true,
                              indicator: MainIndicator(
                                indicatorHeight: size.width * .007,
                                indicatorColor: Theme.of(context).primaryColor,
                                indicatorSize: MainIndicatorSize.normal,
                              ),
                              indicatorPadding: EdgeInsetsDirectional.only(
                                end: size.width * .05,
                                bottom: 4,
                              ),
                              labelPadding: EdgeInsetsDirectional.only(
                                top: size.width * .025,
                                bottom: size.width * .035,
                                end: size.width * .06,
                              ),
                              labelStyle: AppTextStyles.styleWeight600(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                              unselectedLabelStyle:
                                  AppTextStyles.styleWeight400(fontSize: 16),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .05),
                              unselectedLabelColor:
                                  Theme.of(context).primaryColor,
                              labelColor: Theme.of(context).primaryColor,
                              tabs: const [
                                Text(
                                  'Overview',
                                ),
                                Text(
                                  'Hotels',
                                ),
                                Text(
                                  'Things to do',
                                ),
                                Text(
                                  'Restaurants',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: tabController,
                    children: [
                      OverviewPage(tabController: tabController),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return MapListImage();
                        },
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return MapListImage();
                        },
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return MapListImage();
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
