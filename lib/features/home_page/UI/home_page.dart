import 'package:flutter/material.dart';
import 'package:watermyplants/features/home_page/Bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watermyplants/features/home_page/UI/add_plant_page.dart';
import 'package:watermyplants/features/home_page/UI/plant_tile.dart';
import 'package:watermyplants/features/info_page/UI/info_page.dart';
import 'package:watermyplants/features/shop_page/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeBloc.add(HomeAddPlantButtonNavigateEvent());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Water My Plants',
        ),
        actions: [
          IconButton(
              onPressed: () {
                homeBloc.add(HomeShopButtonNavigateEvent());
              },
              icon: const Icon(Icons.shopping_bag_outlined)),
          IconButton(
              onPressed: () {
                homeBloc.add(HomeInfoButtonNavigateEvent());
              },
              icon: const Icon(Icons.library_books_outlined))
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToAddPlantState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddPlantPage(
                          homeBloc: homeBloc,
                        )));
          } else if (state is HomeNavigateToShopState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopPage()));
          } else if (state is HomeNavigateToInfoState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InfoPage()));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(color: Colors.teal),
                ),
              );
            case HomeLoadedSuccessState:
              final successState = state as HomeLoadedSuccessState;
              return Scaffold(
                  body: ListView.builder(
                      itemCount: successState.plants.length,
                      itemBuilder: (context, index) {
                        return PlantTile(
                          homePlantModel: successState.plants[index],
                          homeBloc: homeBloc,
                        );
                      }));
            case HomeErrorState:
              return const Scaffold(
                body: Center(
                  child: Text(
                    'ERROR',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            default:
              return const Center(
                child: Text(
                  'Add Plants',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              );
          }
        },
      ),
    );
  }
}
