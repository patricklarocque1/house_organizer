class SupervisorStats {
  final int houseCount;
  final int residentCount;
  final int listCount;
  final int tasksPending;
  final int tasksInProgress;
  final int tasksCompleted;
  final int tasksOverdue;

  const SupervisorStats({
    required this.houseCount,
    required this.residentCount,
    required this.listCount,
    required this.tasksPending,
    required this.tasksInProgress,
    required this.tasksCompleted,
    required this.tasksOverdue,
  });
}
