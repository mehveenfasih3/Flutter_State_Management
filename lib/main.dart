
import 'package:flutter/material.dart';
import 'package:flutter_state_management/subjects.dart';

void main() {
  runApp(const MaterialApp(home: MyhomePage()));
}

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  late final TextEditingController subjectController;
  late final TextEditingController dateController;
  @override
  void initState() {
    subjectController = TextEditingController();
    dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    subjectController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subjects = SubjectBook();
  
    
    return Scaffold(
      appBar: AppBar(title: const Text('Subject Book(State Management)')),
      body: ValueListenableBuilder(
        valueListenable: subjects,
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final _subject = subjects.subject(atIndex: index)!;
              return Dismissible(
                key: Key(_subject.id),
                onDismissed: (direction) {
                  subjects.remove(subject: _subject);
                } ,
                child: ListTile(
                  title: Text(_subject.subject),
                  subtitle: Text(_subject.date),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  TextField(
                    controller: subjectController,
                    decoration: const InputDecoration(hintText: 'Subject'),
                  ),
                  TextField(
                    controller: dateController,
                    decoration: const InputDecoration(hintText: 'Date'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      SubjectBook().add(
                        subject: Subject(
                          subject: subjectController.text,
                          date: dateController.text,
                        ),
                      );
                      Navigator.pop(context);
                      subjectController.clear();
                      dateController.clear();
                    },
                    child: const Text('Add Subject'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
