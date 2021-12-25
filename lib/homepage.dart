import 'package:flutter/material.dart';
import './products.dart';
import './productitem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Dominos',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://1000logos.net/wp-content/uploads/2021/01/Dominos-logo.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Pizzahut',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://1000logos.net/wp-content/uploads/2017/05/Pizza-Hut-Logo-1999.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Burger King',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://www.designyourway.net/blog/wp-content/uploads/2019/10/s1-3-7.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Subway',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://d26eb5y2jukpbz.cloudfront.net/ebs/archive/2019/media/OS_DE19085M_10.jpg',
    ),
    Product(
      id: 'p5',
      title: 'CCD',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://www.logotaglines.com/wp-content/uploads/2021/06/Cafe-Coffee-Day-Logo-slogan-tagline-founder.png',
    ),
    Product(
      id: 'p6',
      title: 'MacD',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://1000logos.net/wp-content/uploads/2017/03/McDonalds-Logo-1975.jpg',
    ),
    Product(
      id: 'p7',
      title: 'fasos',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://img.indiefolio.com/1200x630/filters:format(webp):fill(transparent)/project/thumb/103b1ab880a36fd419c31408ac506324.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Rolls Mania',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://pbs.twimg.com/profile_images/1171382778056736768/anEE1Qo7_400x400.jpg',
    ),
    Product(
      id: 'p9',
      title: 'Kaventers',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/09/32/44/cb/logo.jpg',
    ),
    Product(
      id: 'p10',
      title: 'KFC',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'https://1000logos.net/wp-content/uploads/2017/03/Kfc_logo.png',
    ),
    Product(
      id: 'p11',
      title: 'Oven Story',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://play-lh.googleusercontent.com/V3UUzurrfYRckyv8JQ6EqhB972GXgmFOCEJkDF884o_cOITGWAfPWqemkNIY8Wp3d7Y',
    ),
    Product(
      id: 'p12',
      title: 'TacoBell',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/hgRu36yguybcDeZLsZybEA-1200-80.jpg',
    ),
    Product(
      id: 'p13',
      title: 'StarBucks',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'http://assets.stickpng.com/images/58428cc1a6515b1e0ad75ab1.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 1],
              colors: [Colors.deepPurple[200], Colors.white])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          centerTitle: true,
          title: Text(
            'Choose a Restaurant',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: loadedProducts.length,
          itemBuilder: (ctx, i) => ProductItem(
            loadedProducts[i].id,
            loadedProducts[i].title,
            loadedProducts[i].imageUrl,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
        ),
      ),
    );
  }
}
