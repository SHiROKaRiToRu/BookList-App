import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNewsContainer(
              context,
              'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1588843906l/52861201._SY475_.jpg',
              'Top 10 Fantasy Novels to Read in 2024',
              'Discover the top 10 fantasy novels you should add to your reading list in 2024. From epic sagas to enchanting tales, there\'s something for every fantasy lover.',
              'Book Critic',
              '42,123 views',
            ),
            _buildNewsContainer(
              context,
                'https://upload.wikimedia.org/wikipedia/en/a/a7/God_Emperor_of_Dune-Frank_Herbert_%281981%29_First_edition.jpg',
                'Exploring the World of Sci-Fi: Must-Read Books',
                'Delve into the fascinating world of science fiction with these must-read books that push the boundaries of imagination and technology.',
                'Sci-Fi Fanatic',
                '38,456 views'
            ),
            _buildNewsContainer(
                context,
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1589881197l/52867387._SY475_.jpg',
                'Historical Fiction: Novels That Bring History to Life',
                'Immerse yourself in these historical fiction novels that transport you to different eras and offer a glimpse into the past through compelling narratives.',
                'History Buff',
                '27,889 views'
            ),
            _buildNewsContainer(
              context,
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1586399012l/50093704._SY475_.jpg',
                'Romantic Reads: Books to Warm Your Heart',
                'Find your next favorite love story with these romantic reads that promise to warm your heart and sweep you off your feet.',
                'Romance Reader',
                '54,321 views'
            ),
            _buildNewsContainer(
              context,
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1559332442l/44582454._SY475_.jpg',
                'Thriller Novels That Will Keep You on the Edge of Your Seat',
                'Get ready for a rollercoaster ride with these thrilling novels that are packed with suspense, twists, and turns.',
                'Thriller Enthusiast',
                '61,245 views'
            ),
            _buildNewsContainer(
              context,
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1575987260l/50225678.jpg',
                'Mystery Books: Unraveling the Best Whodunits',
                'Put on your detective hat and dive into these mystery books that will keep you guessing until the very end.',
                'Mystery Maven',
                '47,358 views'
            ),
            _buildNewsContainer(
              context,
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1592943641l/52090948._SY475_.jpg',
                'Young Adult Fiction: Best Picks for Teens',
                'Check out these top young adult fiction picks that are perfect for teens looking for relatable characters and engaging stories.',
                'YA Expert',
                '33,210 views'
            ),
            _buildNewsContainer(
              context,
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1585639107l/48842183.jpg',
                'Non-Fiction Books: Expanding Your Knowledge',
                'Broaden your horizons with these non-fiction books that cover a wide range of topics and offer insightful perspectives.',
                'Knowledge Seeker',
                '29,874 views'
            ),
            _buildNewsContainer(
              context,
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1583200162l/52539131._SX318_SY475_.jpg',
                'Graphic Novels: Visual Storytelling at Its Best',
                'Explore the captivating world of graphic novels where art and storytelling combine to create unforgettable experiences.',
                'Graphic Guru',
                '22,489 views'
            ),
            _buildNewsContainer(
              context,
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1584401917l/53103895.jpg',
                'Children\'s Books: Inspiring a Love for Reading',
                'Introduce young readers to the joy of reading with these delightful children\'s books that inspire imagination and curiosity.',
                'Kid\'s Lit Lover',
                '18,345 views'
            ),
            _buildNewsContainer(
              context,
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1592943641l/52090948._SY475_.jpg',
                'Classic Literature: Timeless Tales',
                'Rediscover classic literature with these timeless tales that have shaped the literary world and continue to captivate readers.',
                'Literary Scholar',
                '51,678 views'
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsContainer(BuildContext context, String imageUrl, String title, String description, String author, String views) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(
              imageUrl: imageUrl,
              title: title,
              description: description,
              author: author,
              views: views,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'by $author',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        views,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsDetailPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String author;
  final String views;

  const NewsDetailPage({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.author,
    required this.views,
  });

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  List<String> comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'by ${widget.author}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.views,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Comments:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  // Display comments here
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: comments.map((comment) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(comment),
                    )).toList(),
                  ),
                  // Add comment box
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Write a comment...',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            setState(() {
                              comments.add('Posted just now: ${commentController.text}');
                              commentController.clear();
                            });
                          },
                        ),
                      ),
                      controller: commentController,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final TextEditingController commentController = TextEditingController();
}

void main() {
  runApp(MaterialApp(
    home: homepage(),
  ));
}
