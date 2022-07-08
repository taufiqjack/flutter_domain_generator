import 'package:animation_load_progress/animation_load_progress.dart';
import 'package:domaingen/core/constans/custom_colors.dart';
import 'package:domaingen/core/viewmodels/domain_result_viewmodel.dart';
import 'package:domaingen/core/views/barcode_view.dart';
import 'package:domaingen/core/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String domain = '';
  bool isAsync = false;
  TextEditingController domainSearch = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<DomainResultViewmodel>(
      onModelReady: (data) async {},
      builder: (context, data, child) => AnimationLoadProgress(
        inAsyncCall: isAsync,
        height: 50,
        width: 50,
        colorList: [Colors.yellow.shade700],
        child: Scaffold(
          backgroundColor: white,
          body: data.domain == null
              ? SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                      child: Column(children: [
                        Image.asset(
                          'assets/images/domainku.png',
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.height / 5,
                        ),
                        TextFormField(
                          onChanged: (_) async {
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              data.getDomain(domainSearch.text, context);
                              isAsync = false;
                            });
                          },
                          key: _key,
                          decoration: InputDecoration(
                            hintText: 'ketik nama domain',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontStyle: FontStyle.italic),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // suffixIcon: InkWell(
                            //   child: const Icon(
                            //     Icons.cancel,
                            //     color: Colors.black54,
                            //   ),
                            //   onTap: () {
                            //     domainSearch.clear();
                            //   },
                            // ),
                          ),
                          controller: domainSearch,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(8),
                        //       color: Colors.green.shade600),
                        //   height: 50,
                        //   width: 100,
                        //   child: TextButton(
                        //       onPressed: () async {
                        //         setState(() {
                        //           isAsync = true;
                        //           Future.delayed(
                        //               const Duration(milliseconds: 1500), () {
                        //             data.getDomain(domainSearch.text, context);
                        //             isAsync = false;
                        //           });
                        //         });
                        //       },
                        //       child: const Center(
                        //         child: Text(
                        //           'cari',
                        //           style: TextStyle(color: Colors.white),
                        //         ),
                        //       )),
                        // ),
                      ])))
              : SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                    child: Column(children: [
                      Image.asset(
                        'assets/images/domainku.png',
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.height / 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'ketik nama domain',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontStyle: FontStyle.italic),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          // suffixIcon: InkWell(
                          //   child: const Icon(
                          //     Icons.cancel,
                          //     color: Colors.black54,
                          //   ),
                          //   onTap: () {
                          //     domainSearch.clear();
                          //   },
                          // ),
                        ),
                        onChanged: (_) {
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            data.getDomain(domainSearch.text, context);
                            isAsync = false;
                          });
                        },
                        controller: domainSearch,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(8),
                      //       color: Colors.green.shade600),
                      //   height: 50,
                      //   width: 100,
                      //   child: TextButton(
                      //       onPressed: () {
                      //         setState(() {
                      //           isAsync = true;
                      //           Future.delayed(
                      //               const Duration(milliseconds: 1500), () {
                      //             data.getDomain(domainSearch.text, context);
                      //             isAsync = false;
                      //           });
                      //         });
                      //       },
                      //       child: const Center(
                      //         child: Text(
                      //           'cari',
                      //           style: TextStyle(color: Colors.white),
                      //         ),
                      //       )),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      domainSearch.text.isEmpty
                          ? const Center(
                              child: Text('Loading...'),
                            )
                          : SingleChildScrollView(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 1.73,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: data.domain!.result!.length,
                                    itemBuilder: (BuildContext context, i) {
                                      var domainList = data.domain!.result![i];
                                      return InkWell(
                                        onTap: () {},
                                        child: domainList.availability ==
                                                'registered'
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 12),
                                                child: Container(
                                                  height: 43,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color:
                                                              lightGreyThree),
                                                      color: lightGreyFour),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        '${domainList.name}'
                                                            .toLowerCase(),
                                                        style: const TextStyle(
                                                            color: blackTwo),
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            color: greyOne),
                                                        child: TextButton(
                                                            onPressed: () {},
                                                            child: const Center(
                                                              child: Text(
                                                                'Whois',
                                                                style: TextStyle(
                                                                    color:
                                                                        white),
                                                              ),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Card(
                                                elevation: 0,
                                                color:
                                                    domainList.availability ==
                                                            'registered'
                                                        ? Colors.grey.shade300
                                                        : Colors.white,
                                                margin: const EdgeInsets.only(
                                                    bottom: 12,
                                                    left: 0,
                                                    right: 0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  side: const BorderSide(
                                                      color: lightGrey),
                                                ),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 43,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Text('${domainList.name}'
                                                              .toLowerCase()),
                                                          Text(
                                                            '${domainList.availability}',
                                                            style: const TextStyle(
                                                                color:
                                                                    darkGreen),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Container(
                                                            height: 43,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius: const BorderRadius
                                                                            .only(
                                                                        bottomLeft: Radius.circular(
                                                                            5)),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color:
                                                                          darkGreen,
                                                                    ),
                                                                    color:
                                                                        darkGreen),
                                                            child: const Center(
                                                              child: Text(
                                                                'Beli Domain',
                                                                style: TextStyle(
                                                                    color:
                                                                        white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Container(
                                                            height: 43,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              5),
                                                                    ),
                                                                    border: Border.all(
                                                                        color:
                                                                            blueTwo),
                                                                    color:
                                                                        blueTwo),
                                                            child: const Center(
                                                              child: Text(
                                                                'Beli Paket Hosting',
                                                                style: TextStyle(
                                                                    color:
                                                                        white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                      );
                                    }),
                              ),
                            ),
                    ]),
                  ),
                ),
          bottomNavigationBar: Container(
            height: 75,
            width: double.infinity,
            color: const Color(0xff27313f),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/jetorbit_logo.png',
                      color: Colors.white,
                      height: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Cari Domain Murah dan Cepat\nMenyediakan 94 domain keren untuk kamu temukan',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void snackbar() {
    showTopSnackBar(
        context,
        const CustomSnackBar.info(
          message: 'Maaf, domain telah terdaftar',
          messagePadding: EdgeInsets.all(5),
        ));
  }
}
