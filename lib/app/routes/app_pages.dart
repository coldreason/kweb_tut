import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kweb/app/bindings/create_article_binding.dart';
import 'package:kweb/app/bindings/enroll_course_binding.dart';
import 'package:kweb/app/bindings/manage_course_binding.dart';
import 'package:kweb/app/bindings/manage_student_binding.dart';
import 'package:kweb/app/bindings/view_article_binding.dart';
import 'package:kweb/app/ui/screens/check_article/check_article_screen.dart';
import 'package:kweb/app/ui/screens/create_article/create_article_screen.dart';
import 'package:kweb/app/ui/screens/enroll_course/enroll_course_screen.dart';
import 'package:kweb/app/ui/screens/manage_student_screen/manage_student_screen.dart';
import 'package:kweb/app/ui/screens/view_article/view_article_screen.dart';
import '../bindings/check_article_binding.dart';
import '../ui/screens/login/login_screen.dart';

import '../bindings/login_binding.dart';
import '../ui/screens/manage_course/manage_course_screen.dart';

part './app_routes.dart';

class AppPages {
  static List<GetPage> get pages => <GetPage>[
    GetPage(name: Routes.manageCourse, page: () => const ManageCourseScreen(),binding: ManageCourseBinding()),
    GetPage(name: Routes.login, page: () => const LoginScreen(),binding: LoginBinding()),
    GetPage(name: Routes.createArticle, page: () => const CreateArticleScreen(),binding: CreateArticleBinding()),
    GetPage(name: Routes.enrollCourse, page: () => const EnrollCourseScreen(), binding: EnrollCourseBinding()),
    GetPage(name: Routes.checkArticle, page: () => const CheckArticleScreen(),binding: CheckArticleBinding()),
    GetPage(name: Routes.viewArticle, page: () => const ViewArticleScreen(),binding: ViewArticleBinding()),
    GetPage(name: Routes.manageStudent, page: () => const ManageStudentScreen(),binding: ManageStudentBinding()),
  ];
}