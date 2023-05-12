import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:frontend_api/cubit/cubit.dart';
import 'package:frontend_api/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components.dart';

 var idController=TextEditingController();
 var nameController=TextEditingController();
 var emailController=TextEditingController();
 var genderController=TextEditingController();
 var ageController=TextEditingController();
 var updateIdController=TextEditingController();
 var updateNameController=TextEditingController();
 var updateEmailController=TextEditingController();
 var updateGenderController=TextEditingController();
 var updateAgeController=TextEditingController();



class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=MainCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.red,
            appBar: AppBar(
              title: const Text('Cloud Frontend Api',style: TextStyle(
                color: Colors.black
              ),),
              centerTitle: true,
              backgroundColor: Colors.redAccent,

            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConditionalBuilder(
                condition: cubit.dockerModel!=null,
                builder: (context)=>ListView.separated(
                    itemBuilder: (context,index)=>view(cubit.va[index],context),
                    separatorBuilder: (context,index)=> Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    itemCount: cubit.va.length
                ),
                fallback: (context)=>const Center(child: CircularProgressIndicator(),),

              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Add data'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              defaultFormField(
                                  controller: idController,
                                  obscure: false,
                                  keyboardType:TextInputType.number,
                                  label: 'id',

                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'You Should add data';
                                    }
                                    return null;

                                  }
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                  controller: nameController,
                                  obscure: false,
                                  keyboardType:TextInputType.text,
                                  label: 'name',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'You Should add data';
                                    }
                                    return null;

                                  }
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                  controller: emailController,
                                  obscure: false,
                                  keyboardType:TextInputType.text,
                                  label: 'email',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'You Should add task';
                                    }
                                    return null;

                                  }
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                  controller: genderController,
                                  obscure: false,
                                  keyboardType:TextInputType.text,
                                  label: 'gender',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'You Should add gender';
                                    }
                                    return null;

                                  }
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                  controller: ageController,
                                  obscure: false,
                                  keyboardType:TextInputType.number,
                                  label: 'age',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'You Should add age';
                                    }
                                    return null;

                                  }
                              ),

                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: (){
    if(!(idController.text.isEmpty||nameController.text.isEmpty||emailController.text.isEmpty||genderController.text.isEmpty||ageController.text.isEmpty)){
                                cubit.addData(
                                    id: idController.text,
                                    name:nameController.text,
                                    email: emailController.text,
                                    gender: genderController.text,
                                    age: ageController.text,
                                );
                                idController.clear();
                                nameController.clear();
                                emailController.clear();
                                genderController.clear();
                                ageController.clear();
                                Navigator.pop(context);
                              }},

                              child: const Text(
                                  'Add'
                              )
                          ),
                          TextButton(
                              onPressed: (){
                                idController.clear();
                                nameController.clear();
                                emailController.clear();
                                genderController.clear();
                                ageController.clear();
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                              )
                          ),
                        ],
                      );
                    });
              },
              tooltip: 'Add',
              child: const Icon(Icons.add,color: Colors.white,),

            ),



          );

        }

    );
  }
}

Widget view(model,context){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 40,
                child: Text(
                  'Id:${model['id']}',
                  style: const TextStyle(
                      fontSize: 20
                  ),
                ),

              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name:${model['name']}',
                    style: const TextStyle(fontSize: 20,color: Colors.black,),
                  ),
                  Text(
                    'Email:${model['email']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 20,color: Colors.black,),
                  ),
                  Text(
                    'Gender:${model['gender']}',
                    style: const TextStyle(fontSize: 20,color: Colors.black,),
                  ),
                  Text(
                    'Age:${model['age']}',
                    style: const TextStyle(fontSize: 20,color: Colors.black,),
                  ),


                ],
              ),
            ),


            IconButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Add data'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              defaultFormField(
                                  controller: updateIdController,
                                  obscure: false,
                                  keyboardType:TextInputType.number,
                                  label: '${model['id']}',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'You Should add data';
                                    }
                                    return null;

                                  }
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                  controller: updateNameController,
                                  obscure: false,
                                  keyboardType:TextInputType.text,
                                  label: '${model['name']}',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'You Should add data';
                                    }
                                    return null;

                                  }
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                  controller: updateEmailController,
                                  obscure: false,
                                  keyboardType:TextInputType.text,
                                  label: '${model['email']}',
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'You Should add data';
                                    }
                                    return null;

                                  }
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                  controller: updateGenderController,
                                  obscure: false,
                                  keyboardType:TextInputType.text,
                                  label: model['gender'],
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'You Should add data';
                                    }
                                    return null;

                                  }
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                  controller: updateAgeController,
                                  obscure: false,
                                  keyboardType:TextInputType.number,
                                  label: model['age'],
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'You Should add data';
                                    }
                                    return null;

                                  }
                              ),

                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: (){
                                MainCubit.get(context).updateData(
                                  id1: model['id'],
                                  id2: updateIdController.text,
                                  name: updateNameController.text,
                                  email: updateEmailController.text,
                                  gender: updateGenderController.text,
                                  age: updateAgeController.text,
                                );
                                updateAgeController.clear();
                                updateGenderController.clear();
                                updateEmailController.clear();
                                updateNameController.clear();
                                updateIdController.clear();
                                Navigator.pop(context);
                              },
                              child: const Text(
                                  'Update'
                              )
                          ),
                          TextButton(
                              onPressed: (){
                                updateAgeController.clear();
                                updateGenderController.clear();
                                updateEmailController.clear();
                                updateNameController.clear();
                                updateIdController.clear();
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                              )
                          ),
                        ],
                      );
                    });
              },
              tooltip: 'Update',
              icon: const Icon(Icons.refresh_outlined),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: (){
                MainCubit.get(context).deleteData(id: model['id']);
              },
              tooltip: 'Delete',
              icon: const Icon(Icons.remove),
            ),

          ],
        ),
      ],
    ),
  );
}
