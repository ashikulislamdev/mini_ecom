import 'package:mini_ecom/views/shared/export.dart';
import 'package:mini_ecom/views/shared/export_package.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<dynamic> cart = [];

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCart();

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, size: 30, color: Colors.black),
                ),
                Text("My Cart",
                    style: appStyle(36, Colors.black, FontWeight.bold)),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    itemCount: cartProvider.cart.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final data = cartProvider.cart[index];

                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      spreadRadius: 5,
                                      blurRadius: 0.3,
                                      offset: const Offset(0, 1)),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: CachedNetworkImage(
                                            imageUrl: data['imageUrl'],
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -2,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.035,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.085,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                12)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 3,
                                                      spreadRadius: 1,
                                                      offset:
                                                          const Offset(0, 1),
                                                      color:
                                                          Colors.grey.shade100)
                                                ]),
                                            child: GestureDetector(
                                              onTap: () {
                                                cartProvider
                                                    .deleteCart(data['key']);
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            MainScreen())));
                                              },
                                              child: const Icon(
                                                Icons.delete_outline,
                                                size: 27,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['name'],
                                            style: appStyle(16, Colors.black,
                                                FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            data['category'],
                                            style: appStyle(14, Colors.grey,
                                                FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                data['price'],
                                                style: appStyle(
                                                    18,
                                                    Colors.black,
                                                    FontWeight.bold),
                                              ),
                                              const SizedBox(width: 16),
                                              Text(
                                                "Size",
                                                style: appStyle(
                                                    16,
                                                    Colors.black,
                                                    FontWeight.w700),
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                "${data['sizes']}",
                                                style: appStyle(
                                                    18,
                                                    Colors.black,
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                cartProvider.increment();
                                              },
                                              child: Container(
                                                color: Colors.black,
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Text(data['qty'].toString()),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                  color: Colors.grey,
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CheckOutBtn(
                  btnLabel: "Procced to checkout",
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
