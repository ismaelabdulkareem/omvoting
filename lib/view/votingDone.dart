import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:omvoting/index.dart';
import 'package:omvoting/viewModel/candListApp2_viewModel.dart';

class CandidateVoteDone extends StatefulWidget {
  final String candidateName;
  final String candidateParty;
  final String candidatenumber;
  final int candidateVote;
  final String candidatePic;
  final String candidateEdu;
  final String candidateExp;
  final String candidateDisc;

  const CandidateVoteDone({
    super.key,
    required this.candidateName,
    required this.candidateParty,
    required this.candidatenumber,
    required this.candidateVote,
    required this.candidatePic,
    required this.candidateEdu,
    required this.candidateExp,
    required this.candidateDisc,
  });

  @override
  State<CandidateVoteDone> createState() => _CandidateVoteDoneState();
}

class _CandidateVoteDoneState extends State<CandidateVoteDone> {
  final CandView_Model _viewModel3 = CandView_Model();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              margin: const EdgeInsets.only(
                  top: 15, bottom: 25, right: 20, left: 20),
              decoration: const BoxDecoration(
                boxShadow: [],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 43, 20, 170), // Border color
                        width: 3.0,
                        // Border width
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(widget.candidatePic),
                        fit: BoxFit
                            .cover, // Adjust this based on your preference
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          child: Text(
                            'Voting to  ${widget.candidateName} successfully submitted',
                            style: const TextStyle(
                                fontFamily: 'georgia',
                                fontSize: 14,
                                color: Colors.green),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          child: Text(
                            // 'Candidate Number :  ${widget.candidatenumber} ',
                            'Thank you for your participating',
                            style: TextStyle(
                              fontFamily: 'georgia',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 183, 241, 22),
                                  Color.fromRGBO(243, 228, 14, 0.004)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              width: 3,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${widget.candidateVote}',
                              style: const TextStyle(
                                  fontFamily: 'georgia',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const Text(
                          'Votes',
                          style: TextStyle(fontFamily: 'georgia'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 240, 66, 66),
                  foregroundColor: Colors.white,
                ),
                child: const Text('See Results'),
                onPressed: () {
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyWidgetIndex(2)),
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
