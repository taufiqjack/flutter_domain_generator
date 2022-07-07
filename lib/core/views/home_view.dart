import 'package:animation_load_progress/animation_load_progress.dart';
import 'package:domaingen/core/viewmodels/domain_result_viewmodel.dart';
import 'package:domaingen/core/views/barcode_view.dart';
import 'package:domaingen/core/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                          key: _key,
                          decoration: InputDecoration(
                              hintText: 'ketik nama domain',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontStyle: FontStyle.italic),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              suffixIcon: InkWell(
                                child: const Icon(
                                  Icons.cancel,
                                  color: Colors.black54,
                                ),
                                onTap: () {
                                  domainSearch.clear();
                                },
                              )),
                          controller: domainSearch,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green.shade600),
                          height: 50,
                          width: 100,
                          child: TextButton(
                              onPressed: () async {
                                setState(() {
                                  isAsync = true;
                                  Future.delayed(
                                      const Duration(milliseconds: 1500), () {
                                    data.getDomain(domainSearch.text, context);
                                    isAsync = false;
                                  });
                                });
                              },
                              child: const Center(
                                child: Text(
                                  'cari',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
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
                            suffixIcon: InkWell(
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.black54,
                              ),
                              onTap: () {
                                domainSearch.clear();
                              },
                            )),
                        controller: domainSearch,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green.shade600),
                        height: 50,
                        width: 100,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                isAsync = true;
                                Future.delayed(
                                    const Duration(milliseconds: 1500), () {
                                  data.getDomain(domainSearch.text, context);
                                  isAsync = false;
                                });
                              });
                            },
                            child: const Center(
                              child: Text(
                                'cari',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
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
                                    MediaQuery.of(context).size.height / 1.95,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: data.domain!.result!.length,
                                    itemBuilder: (BuildContext context, i) {
                                      var domainList = data.domain!.result![i];
                                      return InkWell(
                                        onTap: () {
                                          domainList.availability ==
                                                  'registered'
                                              ? Fluttertoast.showToast(
                                                  msg:
                                                      'Domain telah terdaftar!')
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        BarcodeView(
                                                      valueBarcode:
                                                          domainList.name,
                                                    ),
                                                  ));
                                        },
                                        child: Card(
                                          color: domainList.availability ==
                                                  'registered'
                                              ? Colors.grey.shade300
                                              : Colors.white,
                                          margin: const EdgeInsets.only(
                                              bottom: 10, left: 0, right: 0),
                                          child: ListTile(
                                            title: Text('${domainList.name}'),
                                            subtitle: Text(
                                                '${domainList.availability}'),
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
}
