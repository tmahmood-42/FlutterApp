import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormalQuestions {
  // Get a reference to the "Formal_Questions" collection.
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Formal_Questions");

  // Method to fetch documents from the collection.
  Future<List<Map<String, dynamic>>> fetchDocuments() async {
    final QuerySnapshot snapshot = await collectionReference.get();

    // Process the snapshot.
    final List<QueryDocumentSnapshot> documents = snapshot.docs;
    final List<Map<String, dynamic>> fetchedQuestions = [];

    for (final QueryDocumentSnapshot document in documents) {
      // Deserialize the document data.
      final Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

      // Do something with the data.
      if (data != null) {
        fetchedQuestions.add(data);
      }
    }

    return fetchedQuestions;
  }
}

class DisplayFQ extends StatefulWidget {
  const DisplayFQ({Key? key}) : super(key: key);

  @override
  _DisplayFQState createState() => _DisplayFQState();
}

class _DisplayFQState extends State<DisplayFQ> {
  final FormalQuestions formalQuestions = FormalQuestions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E1DD),
      appBar: AppBar(
        backgroundColor: Color(0xFF415A77),
        title: Text('Display Formal Questions'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: formalQuestions.fetchDocuments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error occurred while fetching data'),
            );
          }

          final List<Map<String, dynamic>> questions = snapshot.data ?? [];

          return ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final question = questions[index];

              return ListTile(
                title: Text(question['Question']),
                subtitle: Text(question['Answer']),
              );
            },
          );
        },
      ),
    );
  }
}
