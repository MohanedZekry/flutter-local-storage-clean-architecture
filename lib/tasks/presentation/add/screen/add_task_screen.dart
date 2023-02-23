import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterhive/core/widgets/app_bar_widget.dart';
import 'package:flutterhive/tasks/data/models/tasks_model.dart';
import 'package:flutterhive/tasks/presentation/add/controller/add_task_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/values/dimens.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Add New Task'),
      body: BlocConsumer<AddTaskBloc, AddTaskState>(
        listener: (context, state) {
          state.when(initial: () => null,
              loading: () => null,
              success: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Added Successfully"),
                ));
                GoRouter.of(context).go(AppRouter.root);
              },
              failed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Error Occurred"),
              ))
          );
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsets.symmetric(vertical: pad18, horizontal: pad15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 60,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                      controller: _nameController,
                      validator: (val) =>
                      val!.isEmpty ? 'Please enter task name' : null,
                      decoration:  InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)
                          ),
                        ),
                        labelText: 'New Task',
                        counterText: '',
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.7),
                            width: 0,
                          ),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(15)
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)
                          ),
                        ),

                        fillColor: Colors.grey.withOpacity(0.1),
                        prefixIcon: Icon(
                          Icons.info_outline_rounded, color: Colors.blue.withOpacity(.8),),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: pad15),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 60,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                          controller: _detailsController,
                          validator: (val) =>
                          val!.isEmpty ? 'Please enter task details' : null,
                          decoration:  InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)
                              ),
                            ),
                            labelText: 'Details',
                            counterText: '',
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.7),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(15)
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)
                              ),
                            ),

                            fillColor: Colors.grey.withOpacity(0.1),
                            prefixIcon: Icon(
                              Icons.info_outline_rounded, color: Colors.blue.withOpacity(.8),),
                          ),
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: pad18),
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(pad10),
                          textStyle: const TextStyle(
                            color: Color.fromRGBO(0, 160, 227, 1),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(pad8),
                            side: const BorderSide(
                                color: Color.fromRGBO(0, 160, 227, 1)
                            ),
                          ),
                        ),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            context.read<AddTaskBloc>().add(
                                AddNewTaskEvent(
                                    TasksModel(
                                        title: _nameController.text,
                                        description: _detailsController.text
                                    )
                                )
                            );
                          }
                        },
                        child: const Text("Add Task",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
