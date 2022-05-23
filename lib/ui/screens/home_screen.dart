import 'package:flutter/material.dart';
import 'package:spotify_ui/ui/widgets/album_card.dart';
import 'package:spotify_ui/ui/widgets/song_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: const BoxDecoration(
              color: Color(0xFf1C7A74),
            ),
          ),
            SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                  ],
                )
              ),
              child:SafeArea(child:Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                            "Recently Played",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Row(
                            children: const [
                              ImageIcon(
                                AssetImage('assets/icons/history.png'),
                              ),
                              SizedBox(width: 16),
                              ImageIcon(
                                AssetImage('assets/icons/settings.png'),
                              ),
                            ],
                          ),
                       ]
                    ),
                  ),
                    SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const  EdgeInsets.all(16),
                      child: Row(
                         children: const [
                            AlbumCardWidget(
                            label: "Best Mode",
                            image: AssetImage("assets/images/album7.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCardWidget(
                            label: "Motivation Mix",
                            image: AssetImage("assets/images/album2.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCardWidget(
                            label: "Top 50-Global",
                            image: AssetImage("assets/images/top50.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCardWidget(
                            label: "Power Gaming",
                            image: AssetImage("assets/images/album1.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCardWidget(
                            label: "Top songs - Global",
                            image: AssetImage("assets/images/album9.jpg"),
                          ),
                         ]
                      ),
                   ),
                   const SizedBox(height: 32),
                     Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Good evening",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              RowAlbumCard(
                                label: "Top 50 - Global",
                                image: AssetImage("assets/images/top50.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Best Mode",
                                image: AssetImage("assets/images/album1.jpg"),
                              ),
                            ],
                          ),
                        ]
                      ),
                    ),
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Based on your recent listening",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                         SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children:const  [
                              SongCardWidget(
                                image: AssetImage("assets/images/album8.jpg"),
                              ),
                               SizedBox(width: 16),
                               SongCardWidget(
                                image: AssetImage("assets/images/album5.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCardWidget(
                               image: AssetImage("assets/images/album6.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCardWidget(
                                image: AssetImage("assets/images/album1.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCardWidget(
                                image: AssetImage("assets/images/album3.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCardWidget(
                                image: AssetImage("assets/images/album10.jpg"),
                              ),
                            ]
                          ),
                        ),
                      ],
                      
                     ),
                     SizedBox(height: 16),
                ]
              ) ,)


            )
          )
          ],
      ),
    );
  }
}
class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Text(label)
          ],
        ),
      ),
    );
  }
}