import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_api/api_handler.dart';
import 'package:flutter_web_api/model.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;

class EditPage extends StatefulWidget {
  final User user;
  const EditPage({super.key, required this.user});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  ApiHandler apiHandler = ApiHandler();
  late http.Response response;

  void updateData() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final user = User(
        userId: widget.user.userId,
        name: data['name'],
        username: data['username'] ?? widget.user.username,
        email: data['email'],
        yearsOfExperience: int.parse(data['yearsOfExperience']),
        averageScore: data['averageScore'] ?? widget.user.averageScore,
        practiceFrequency: data['practiceFrequency'] ?? widget.user.practiceFrequency,
        scoreGoal: data['scoreGoal'] ?? widget.user.scoreGoal,
        puttingGoal: data['puttingGoal'] ?? widget.user.puttingGoal,
        approachGoal: data['approachGoal'] ?? widget.user.approachGoal,
        shotGoal: data['shotGoal'] ?? widget.user.shotGoal,
        passwordHash: widget.user.passwordHash,
      );

      response = await apiHandler.updateUser(
        userId: widget.user.userId,
        user: user,
      );
    }

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Page"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 118, 29, 202),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: updateData,
        child: const Text('Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView( // Wrap with SingleChildScrollView to avoid overflow
          child: FormBuilder(
            key: _formKey,
            initialValue: {
              'name': widget.user.name,
              'email': widget.user.email,
              'username': widget.user.username,
              'yearsOfExperience': widget.user.yearsOfExperience.toString(),
              'averageScore': widget.user.averageScore,
              'practiceFrequency': widget.user.practiceFrequency, // Corrected spelling
              'scoreGoal': widget.user.scoreGoal.toString(),
              'puttingGoal': widget.user.puttingGoal.toString(),
              'approachGoal': widget.user.approachGoal.toString(),
              'shotGoal': widget.user.shotGoal.toString(),
              'password': widget.user.passwordHash.toString(),
            },
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'name',
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                FormBuilderTextField(
                  name: 'username',
                  decoration: const InputDecoration(labelText: 'User Name'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                FormBuilderTextField(
                  name: 'email',
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                FormBuilderTextField(
                  name: 'yearsOfExperience',
                  decoration: const InputDecoration(labelText: 'Years of Experience'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.integer(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                FormBuilderTextField(
                  name: 'averageScore',
                  decoration: const InputDecoration(labelText: 'Average Score'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.integer(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                FormBuilderTextField(
                  name: 'practiceFrequency', // Corrected spelling
                  decoration: const InputDecoration(labelText: 'Practice Frequency'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.integer(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                FormBuilderTextField(
                  name: 'scoreGoal',
                  decoration: const InputDecoration(labelText: 'Score Goal'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.integer(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                FormBuilderTextField(
                  name: 'puttingGoal',
                  decoration: const InputDecoration(labelText: 'Putting Goal'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.integer(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                FormBuilderTextField(
                  name: 'approachGoal',
                  decoration: const InputDecoration(labelText: 'Approach Goal'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.integer(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                FormBuilderTextField(
                  name: 'shotGoal',
                  decoration: const InputDecoration(labelText: 'Shot Goal'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.integer(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                FormBuilderTextField(
                  name: 'passwordHash',
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                      FormBuilderValidators.maxLength(12),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
