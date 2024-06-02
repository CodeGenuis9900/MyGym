class MuscleData {
  final String name;
  final double involvement; // This will be a percentage value between 0 and 1
  final String status; // "Rested" or "Tired"

  MuscleData({required this.name, required this.involvement, required this.status});
}
