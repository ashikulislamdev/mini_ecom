import 'package:mini_ecom/views/shared/export.dart';
import 'package:mini_ecom/views/shared/export_package.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 3, vsync: this);

  @override
  void initState() {
    tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png"
  ];

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    var productProvider = Provider.of<ProductNotifier>(context);
    productProvider.getMale();
    productProvider.getFemale();
    productProvider.getKids();

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: dSize.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: dSize.height * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              filter();
                            },
                            child: const Icon(
                              Icons.filter_list_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      )),
                  TabBar(
                      padding: EdgeInsets.zero,
                      indicatorColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.5),
                      tabs: const [
                        Tab(text: "Man Shoes"),
                        Tab(text: "Women Shoes"),
                        Tab(text: "Kids Shoes"),
                      ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: dSize.height * 0.175,
                right: 12,
                left: 16,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(controller: tabController, children: [
                  ProductByCatWidget(male: productProvider.male, dSize: dSize),
                  ProductByCatWidget(
                      male: productProvider.female, dSize: dSize),
                  ProductByCatWidget(male: productProvider.kids, dSize: dSize),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() async {
    double _value = 100;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.84,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black38),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Column(
                children: [
                  const CustomSpacer(),
                  Text(
                    "Filter",
                    style: appStyle(40, Colors.black, FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  Text(
                    "Gender",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      CategoryBtn(btnColor: Colors.black, label: "Male"),
                      CategoryBtn(btnColor: Colors.grey, label: "Female"),
                      CategoryBtn(btnColor: Colors.grey, label: "Kids"),
                    ],
                  ),
                  const CustomSpacer(),
                  Text(
                    "Category",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      CategoryBtn(btnColor: Colors.black, label: "Shoes"),
                      CategoryBtn(btnColor: Colors.grey, label: "Apparrals"),
                      CategoryBtn(btnColor: Colors.grey, label: "Accessori"),
                    ],
                  ),
                  const CustomSpacer(),
                  Text(
                    "Price",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  Slider(
                    value: _value,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                    thumbColor: Colors.black,
                    max: 500,
                    divisions: 50,
                    label: _value.toString(),
                    secondaryTrackValue: 200,
                    onChanged: (double value) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Brand",
                    style: appStyle(20, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 80,
                    child: ListView.builder(
                      itemCount: brand.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 1,
                                  spreadRadius: 4,
                                  color: Colors.grey.shade200,
                                  offset: const Offset(0, 1),
                                )
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            height: 60,
                            width: 80,
                            child: Image.asset(brand[index]),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
