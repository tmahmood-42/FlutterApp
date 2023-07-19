import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Slang {
  final CollectionReference slangCollection =
      FirebaseFirestore.instance.collection("Slang_Collection");

  Future<List<Map<String, dynamic>>> fetchDocuments() async {
    final QuerySnapshot slangSnapshot = await slangCollection
        .doc("A")
        .collection("A_Word")
        .get();
    final List<QueryDocumentSnapshot> slangDocuments = slangSnapshot.docs;
    final List<Map<String, dynamic>> fetchedWords = [];

    for (final QueryDocumentSnapshot slangDoc in slangDocuments) {
      final Map<String, dynamic>? data =
          slangDoc.data() as Map<String, dynamic>?;
      if (data != null) {
        final String actualWord = data['Actual Word'];
        final String definition = data['Definition'];
        final String word = data['Word'];
        fetchedWords.add({
          'Actual Word': actualWord,
          'Definition': definition,
          'Word': word,
        });
      }
    }

    return fetchedWords;
  }
}


class DisplaySlang extends StatelessWidget {
  final Slang slang = Slang();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Slang'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: slang.fetchDocuments(),
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

          final List<Map<String, dynamic>> slangData = snapshot.data ?? [];

          return ListView.builder(
            itemCount: slangData.length,
            itemBuilder: (context, index) {
              final slangItem = slangData[index];
              final String actualWord = slangItem['Actual Word'];
              final String definition = slangItem['Definition'];
              final String word = slangItem['Word'];
              final String actualWordLabel = 'Actual Word:';
              final String definitionLabel = 'Definition:';
              final String wordLabel = 'Word:';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$word'),
                  Text('$definitionLabel $definition'),
                  Text('$actualWordLabel $actualWord'),
                  Divider(), // Optional divider to separate each item
                ],
              );
            },
          );
        },
      ),
    );
  }
}
