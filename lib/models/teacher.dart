import 'teacher_info.dart';

class Teacher {
  final int id;
  final List<TeacherInfo> infos;

  Teacher(this.id, this.infos);

  static List<Teacher> fetchAll() {
    return [
      Teacher(1, [
        TeacherInfo('assets/images/teacher_1.png', 'Jackie', 'Chen', '23',
            'ajakjhdkahdjahksdhka'),
        TeacherInfo('assets/images/teacher_2.png', 'James', 'Smith', '36',
            '1231423424234234234'),
      ])
    ];
  }
}
