import 'package:animation_load_progress/animation_load_progress.dart';
import 'package:domaingen/core/viewmodels/domain_result_viewmodel.dart';
import 'package:domaingen/core/views/barcode_view.dart';
import 'package:domaingen/core/views/base_view.dart';
import 'package:flutter/material.dart';

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
                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                      child: Column(children: [
                        TextFormField(
                          key: _key,
                          decoration: InputDecoration(
                              hintText: 'Cari Domain',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
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
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Cari Domain',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
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
                                    MediaQuery.of(context).size.height / 1.3,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: data.domain!.result!.length,
                                    itemBuilder: (BuildContext context, i) {
                                      var domainList = data.domain!.result![i];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BarcodeView(
                                                  valueBarcode: domainList.name,
                                                ),
                                              ));
                                        },
                                        child: Card(
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
        ),
      ),
    );
  }
}
