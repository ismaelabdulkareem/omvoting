import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:omvoting/component/candidates.dart';
import 'package:omvoting/model/candList_app2_model.dart';
import 'package:omvoting/viewModel/candListApp2_viewModel.dart';

class MyWidgetHome extends StatefulWidget {
  const MyWidgetHome({super.key});

  @override
  _MyWidgetHomeState createState() => _MyWidgetHomeState();
}

class _MyWidgetHomeState extends State<MyWidgetHome> {
  final CandView_Model _viewModel = CandView_Model();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchAllCand();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Form(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
                child: TextFormField(
                  style: const TextStyle(
                    fontFamily: 'georgia',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Search',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                    fillColor: Color.fromARGB(255, 247, 227, 227),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: StreamBuilder<List<CandListApp2_Model>>(
                stream: _viewModel.allCandList.stream,
                builder: (context, snapshot) {
                  if (_viewModel.isLoading.value &&
                      snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final List<CandListApp2_Model>? candidates = snapshot.data;

                  if (candidates == null || candidates.isEmpty) {
                    return const Center(child: Text('No candidates available'));
                  }

                  return ListView.builder(
                    itemCount: candidates.length,
                    itemBuilder: (context, index) {
                      final candidate = candidates[index];
                      return newCandidate(
                        candidateName: candidate.candName,
                        candidateParty: candidate.candPart,
                        candidatenumber: candidate.candNo,
                        candidateVote: candidate.candVotes.toString(),
                        candidatePic: candidate.candImg,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
