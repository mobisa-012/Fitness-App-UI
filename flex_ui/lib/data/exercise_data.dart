class ExerciseData {
  final String title;
  final String minutes;
  final double progress;
  final String image;
  final String video;
  final String description;

  ExerciseData(
      {required this.description,
      required this.image,
      required this.minutes,
      required this.progress,
      required this.title,
      required this.video});

  @override
  String toString() {
    return 'ExerciseData(title: $title, minutes: $minutes, progress: $progress, video: $video)';
  }
}
