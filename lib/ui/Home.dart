import 'package:first_flutter/model/questionBank.dart';
import 'package:first_flutter/util/hexcolor.dart';
import 'package:flutter/material.dart';
import '../model/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> moviesList = Movie.getMovies();
  final movies = [
    'The Godfather',
    'The Shawshank Redemption',
    'The Dark Knight',
    'The Godfather: Part II',
    '12 Angry Men',
    'Schindler\'s List',
    'The Lord of the Rings: The Return of the King',
    'Pulp Fiction',
    'The Good, the Bad and the Ugly',
    'Fight Club',
    "Power",
    "The Good guy"
  ];

  MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.blueGrey.shade900,
        body: ListView.builder(
            itemCount: moviesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  movieCard(moviesList[index], context),
                  Positioned(
                      top: 10.0,
                      child: movieImage(moviesList[index].images[0])),
                ],
              );
              // return Card(
              //   elevation: 5.0,
              //   color: Colors.white,
              //   child: ListTile(
              //     trailing: Text("..."),
              //     leading:CircleAvatar(
              //       child: Container(
              //         width: 200,
              //         height: 200,
              //         decoration: BoxDecoration(
              //          image: DecorationImage(
              //            image: NetworkImage(moviesList[index].images[0]),fit: BoxFit.cover
              //          ),
              //           borderRadius: BorderRadius.circular(13.9)
              //         ),
              //         child: null,
              //       ),
              //     ),
              //     title: Text("${moviesList[index].title}"),
              //     subtitle: Text("sub"),
              //     onTap: (){
              //       Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(movieName: "${moviesList[index].title}", movie: moviesList[index],)));
              //     },
              //     //onTap: ()=> debugPrint("Movie name: ${movies.elementAt(index)}"),
              //   ),
              // );
            }));
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(
          left: 60,
        ),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(movie.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white,
                            )),
                      ),
                      Text(
                        "Rating ${movie.imdRating}/10",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Released: ${movie.released}",
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.runtime,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(movie.rated, style: mainTextStyle())
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.title,
                      movie: movie,
                    )));
      },
    );
  }

  Widget movieImage(String imgUrl) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                imgUrl ?? 'https://picsum.photos/200/300',
              ),
              fit: BoxFit.cover)),
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(fontSize: 15.0, color: Colors.grey);
  }
}

//New route
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails(
      {super.key, required this.movieName, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      // body: Container(
      //   child: Center(
      //     child: ElevatedButton(
      //       onPressed: (){
      //         Navigator.pop(context);
      //       },
      //       child: Text("Go Back ${movie.director}"),
      //     ),
      //   ),
      // ) ,
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(
            posters: movie.images,
          )
        ],
      ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(thumbnail), fit: BoxFit.cover)),
              ),
            ),
            Icon(Icons.play_circle_fill_outlined,
                size: 100, color: Colors.white)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          height: 180,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(
            width: 15,
          ),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(10.0);
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var fontStyleforHeader = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 32,
    );
    return Column(
      children: [
        Text("${movie.year} . ${movie.genre}".toUpperCase(),
            style: styleForposter()),
        Text(
          "${movie.title}",
          style: fontStyleforHeader,
        ),
        Text.rich(TextSpan(
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            children: [
              TextSpan(text: movie.plot),
              TextSpan(
                  text: " More..",
                  style: TextStyle(
                      color: Colors.indigo, fontWeight: FontWeight.w600))
            ]))
      ],
    );
  }

  styleForposter() {
    return TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.green,
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie.actors),
          MovieField(field: "Awards ", value: movie.award),
          MovieField(
            field: "Language ",
            value: movie.language,
          ),
          MovieField(field: "MetaScore", value: movie.metascore),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$field :",
          style: TextStyle(
              color: Colors.black38, fontSize: 12, fontWeight: FontWeight.w300),
        ),
        Expanded(
            child: Text(
          value,
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
        ))
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List posters;

  const MovieDetailsExtraPosters({super.key, required this.posters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "More movie Poster".toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            color: Colors.black26,
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(posters[index]),
                              fit: BoxFit.cover)),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
              itemCount: posters.length),
        )
      ],
    );
  }
}

//END OF MOVIE APP========
// quiz
class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

//quiz app
class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    QuestionBank.name("What is the purpose of the US Constitution?", true),
    QuestionBank.name("What is the purpose of the US Constitution?", true),
    QuestionBank.name("What is the purpose of the US Constitution?", false),
    QuestionBank.name(
        "What is the Bill of Rights, and why was it added to the Constitution?",
        true),
    QuestionBank.name(
        "What are the three branches of government established by the Constitution, and what are their respective powers and responsibilities?",
        false),
    QuestionBank.name(
        "What is the significance of the 14th Amendment to the US Constitution?",
        false),
    QuestionBank.name(
        "What is the process for amending the US Constitution, and how many times has it been amended?",
        false),
    QuestionBank.name(
        "What are the qualifications for holding the office of President of the United States, as outlined in the Constitution?",
        true),
    QuestionBank.name(
        "How is the Supreme Court established and what is its role in interpreting the Constitution?",
        true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      //backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              "images/flag.png",
              width: 250,
              height: 180,
            )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid)),
                height: 120.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      //style: TextStyle(fontSize: 50.0, color: Colors.white),
                    ),
                  )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _previousQuestion(),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900,
                      foregroundColor: Colors.white,
                      elevation: 5),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(true),
                  child: Text("True "),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900,
                      foregroundColor: Colors.white,
                      elevation: 5),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false),
                  child: Text("False "),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900,
                      foregroundColor: Colors.white,
                      elevation: 5),
                ),
                ElevatedButton(
                  onPressed: () => _nextQuestion(),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900,
                      foregroundColor: Colors.white,
                      elevation: 5),
                ),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      debugPrint("yes is correct! ");
      final snackBar = SnackBar(
          backgroundColor: Colors.green,
          content: Text("correct"),
          duration: Duration(milliseconds: 200));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();
    } else {
      debugPrint("incorrect!");
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("wrong"),
        duration: Duration(milliseconds: 200),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
} //====== end of quiz app

//Bill_splitter
class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: _purple.withOpacity(0.1),
                  //Colors.purpleAccent.shade100,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Per Person",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: _purple),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                        style: TextStyle(
                            fontSize: 34.9,
                            color: _purple,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Colors.blueGrey, style: BorderStyle.solid)),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        prefixText: "Bill Amount ",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter >= 1) {
                                  _personCounter--;
                                } else {}
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: _purple.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Center(
                                  child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              )),
                            ),
                          ),
                          Text("$_personCounter"),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter >= 1) {
                                  _personCounter++;
                                } else if (_personCounter == 0) {
                                  _personCounter++;
                                } else {}
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: _purple.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  //Tip and the value
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tip",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                          style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "$_tipPercentage %",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _purple,
                            fontSize: 17.0),
                      ),
                      Slider(
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          min: 0,
                          max: 100,
                          divisions: 5,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

///////end
class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              _getCard(),
              _getAvatar(),
            ],
          )),
    );
  }

  _getCard() {
    return Container(
        width: 350,
        height: 200,
        margin: EdgeInsets.all(50.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oladayo",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text("OladayoAfolabi@outlook.com"),
            Text("welcome"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.percent_outlined), Text(" T: @ building")],
            )
          ],
        ));
  }

  _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent, width: 1.2),
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/200/300"),
            fit: BoxFit.cover),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("Hello again"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Button"),
      ),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint("you missed a call");
  }

  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("Email with");
              },
              icon: Icon(Icons.email)),
          IconButton(onPressed: _tapButton, icon: Icon(Icons.alarm)),
        ],
      ),
      backgroundColor: Colors.redAccent.shade100,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.call_missed),
          onPressed: () {
            final snackBar =
                SnackBar(content: Text("you missed a call from lobo"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "welcome"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "welcome"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "ac_unit"),
        ],
        onTap: (int index) {
          debugPrint("Tapped item:$index");
        },
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InkWell(
            //   child: Text("Tap me",
            //   style: TextStyle(fontSize: 23.4),),
            //   onTap: ()=>debugPrint("Tap me"),
            // ),
            CustomButton(),
            // InkWell(
            //   onTap: (){
            //     final snackBar=SnackBar(content: Text("welcome to second"));
            //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //   },
            //   child:Container(
            //     padding: EdgeInsets.all(10.0),
            //     decoration: BoxDecoration(
            //       color:Colors.amberAccent,
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //     child: Text("second button"),
            //   )
            // ),
            // InkWell(
            //  child: Container(
            //    child: Text("tap me twice",
            //    style: TextStyle(fontSize: 23.4)),),
            //   onTap:_tapButton,
            //  ),
          ],
        ),
      ),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // return Center(
//     //   child: Text("Hello flutter!",
//     //     textDirection: TextDirection.ltr,),
//     // );
//     return Material(
//       color: Colors.orange,
//
//       child: Center(
//           child: Text(
//             "Hello flutter",
//             textDirection: TextDirection.ltr,
//             style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 23.4,
//                 fontStyle: FontStyle.italic
//             ),
//           )),
//     );
//   }
// }
