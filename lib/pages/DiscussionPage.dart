import 'package:flutter/material.dart';

class Discussionpage extends StatelessWidget {
  const Discussionpage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Book Discussions'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  _buildDiscussionEntry(
                      context,
                      'The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life',
                      'Book Relations: Self-Help, Philosophy',
                      'Posted 50 minutes ago by booklover123 (0 comments)'
                  ),
                  _buildDiscussionEntry(
                      context,
                      'To Kill a Mockingbird: The Most Poignant Novel of Our Time',
                      'Book Relations: Classic, Historical Fiction',
                      'Posted 4 hours ago by literaryenthusiast (0 comments)'
                  ),
                  _buildDiscussionEntry(
                      context,
                      '1984 and Its Relevance Today',
                      'Book Relations: Dystopian, Political Fiction',
                      'Posted Today, 1:23 AM by thoughtprovoker (0 comments)'
                  ),
                  _buildDiscussionEntry(
                      context,
                      'The Great Gatsby: A Timeless Classic',
                      'Book Relations: Classic, Novel',
                      'Posted Yesterday, 4:15 PM by classicreader (0 comments)'
                  ),
                  _buildDiscussionEntry(
                      context,
                      'Becoming: A Journey of Self-Discovery',
                      'Book Relations: Biography, Memoir',
                      'Posted 4 hours ago by nonfictionfan (0 comments)'
                  ),
                  _buildDiscussionEntry(
                      context,
                      'The Catcher in the Rye: A Tale of Teenage Angst',
                      'Book Relations: Classic, Young Adult',
                      'Posted Today, 7:06 AM by rebelreader (0 comments)'
                  ),
                  _buildDiscussionEntry(
                      context,
                      'The Hobbit: An Adventure Through Middle Earth',
                      'Book Relations: Fantasy, Adventure',
                      'Posted Yesterday, 7:28 PM by fantasyfanatic (0 comments)'
                  ),
                  _buildDiscussionEntry(
                      context,
                      'Pride and Prejudice: Romance and Society',
                      'Book Relations: Classic, Romance',
                      'Posted Yesterday, 8:16 AM by janefan (0 comments)'
                  ),
                  _buildDiscussionEntry(
                      context,
                      'Sapiens: A Brief History of Humankind',
                      'Book Relations: History, Science',
                      'Posted Today, 6:45 PM by historybuff (0 comments)'
                  ),
                  _buildDiscussionEntry(
                      context,
                      'Educated: A Memoir of Triumph',
                      'Book Relations: Memoir, Education',
                      'Posted 3 hours ago by scholarlyreader (0 comments)'
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscussionEntry(BuildContext context, String title, String relation, String details) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DiscussionDetailsPage(title: title, relation: relation, details: details)),
        );
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              relation,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 2),
            Text(
              details,
              style: TextStyle(color: Colors.grey),
            ),
            Divider(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class DiscussionDetailsPage extends StatefulWidget {
  final String title;
  final String relation;
  final String details;

  const DiscussionDetailsPage({Key? key, required this.title, required this.relation, required this.details}) : super(key: key);

  @override
  _DiscussionDetailsPageState createState() => _DiscussionDetailsPageState();
}

class _DiscussionDetailsPageState extends State<DiscussionDetailsPage> {
  List<String> comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.relation,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.details,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Comments:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
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
    );
  }

  final TextEditingController commentController = TextEditingController();
}
