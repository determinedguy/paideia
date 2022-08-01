import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paideia/presentation/widgets/drawer_menu.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(routeName),
      appBar: AppBar(
        title: const Text('Paideia'),
      ),
      body: BlocProvider(
        create: (context) => studentListBloc,
        child: HomeContentSection(),
      ),
    );
  }
}

class HomeContentSection extends StatefulWidget {
  const HomeContentSection({Key? key}) : super(key: key);

  @override
  HomeContentSectionState createState() =>
      HomeContentSectionState();
}

class HomeContentSectionState extends State<HomeContentSection> {
  late StudentListBloc studentListBloc;

  @override
  void initState() {
    studentListBloc = BlocProvider.of<studentListBloc>(context);
    studentListBloc.add(LoadStudentListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: BlocBuilder(
        bloc: studentListBloc,
        builder: (context, state) {
          if (state is StudentListInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Now Playing',
                    style: kHeading6,
                  ),
                  StudentList(studentListBloc.nowPlaying),
                  _buildSubHeading(
                    title: 'Popular',
                    onTap: () => Navigator.pushNamed(
                        context, PopularStudentsPage.ROUTE_NAME),
                  ),
                  StudentList(studentListBloc.popular),
                  _buildSubHeading(
                    title: 'Top Rated',
                    onTap: () => Navigator.pushNamed(
                        context, TopRatedStudentsPage.ROUTE_NAME),
                  ),
                  StudentList(studentListBloc.topRated),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class StudentList extends StatelessWidget {
  final List<Student> students;

  StudentList(this.students);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final student = students[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StudentDetailPage.ROUTE_NAME,
                  arguments: student.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${student.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: students.length,
      ),
    );
  }
}
