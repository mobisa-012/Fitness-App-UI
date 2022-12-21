class ExerciseData {
  final String title;
  final int seconds;
  final double progress;
  final String pic;
  final String image;
  final String description;
  final List<String> steps;

  ExerciseData(
      {required this.description,
      required this.pic,
      required this.seconds,
      required this.progress,
      required this.title,
      required this.image,
      required this.steps});

  @override
  String toString() {
    return 'ExerciseData(title: $title, seconds: $seconds, progress: $progress, image: $image)';
  }
}
