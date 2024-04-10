import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopping_app/providers/favorite_provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final favoriteList = provider.favorite;

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Favorites",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: favoriteList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                setState(() {
                                  favoriteList.removeAt(index);
                                });
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            )
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            favoriteList[index].name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            favoriteList[index].description,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.red.shade100,
                            backgroundImage:
                                AssetImage(favoriteList[index].image),
                          ),
                          trailing: Text(
                            '\$${favoriteList[index].price}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          tileColor: Colors.white,
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
