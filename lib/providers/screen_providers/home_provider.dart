import 'package:flutter/cupertino.dart';
import 'package:fullmark_task/models/teacher_model.dart';
import 'package:fullmark_task/repositories/teachers_repository.dart';

class HomeProvider with ChangeNotifier {
  List<TeacherModel> teachers = [];
  bool isLoading = true;
  String? error;
  late int selectedTeacherId;

  getTeachers() {
    if(isLoading == false) {
      isLoading = true;
      error = null;
      notifyListeners();
    }
    TeacherRepository().getTeachers(
      onSuccess: (data) => teachers.addAll(data),
      onError: (e) => error = e,
      onComplete: () {
        isLoading = false;
        notifyListeners();
      }
    );
  }
}
