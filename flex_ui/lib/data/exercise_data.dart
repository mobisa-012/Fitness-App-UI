class ExerciseData {
  final String title;
  final int seconds;
  final double progress;
  final String pic;
  final String video;
  final String description;
  final List<String> steps;

  ExerciseData(
      {required this.description,
      required this.pic,
      required this.seconds,
      required this.progress,
      required this.title,
      required this.video,
      required this.steps});

  @override
  String toString() {
    return 'ExerciseData(title: $title, seconds: $seconds, progress: $progress, video: $video)';
  }
}
