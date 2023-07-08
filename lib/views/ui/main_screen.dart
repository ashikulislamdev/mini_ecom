import 'package:mini_ecom/views/shared/export_package.dart';
import 'package:mini_ecom/views/shared/export.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          body: pageList[mainScreenNotifier.pageIndex],
          backgroundColor: const Color(0xFFE2E2E2),
          bottomNavigationBar: const BottomNav(),
        );
      },
    );
  }
}
