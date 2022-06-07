import 'package:domaingen/core/viewmodels/domain_result_viewmodel.dart';
import 'package:domaingen/core/views/base_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String domain = 'jack';
  TextEditingController domainSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<DomainResultViewmodel>(
      onModelReady: (data) async {
        await data.getDomain(domainSearch.text, context);
      },
      builder: (context, data, child) => Scaffold(
        body: data.domain == null
            ? SingleChildScrollView(
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
                            onPressed: () async {
                              data.getDomain(domainSearch.text, context);
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
                          onPressed: () async {
                            data.getDomain(domainSearch.text, context);
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
                        ? const CircularProgressIndicator()
                        : SingleChildScrollView(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 1.3,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data.domain!.result!.length,
                                  itemBuilder: (BuildContext context, i) {
                                    var domainList = data.domain!.result![i];
                                    return ListTile(
                                      title: Text('${domainList.name}'),
                                      subtitle:
                                          Text('${domainList.availability}'),
                                    );
                                  }),
                            ),
                          ),
                  ]),
                ),
              ),
      ),
    );
  }
}
