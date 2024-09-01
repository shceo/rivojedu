import 'package:edu/src/domain/blocs/user_bloc/user_bloc.dart';
import 'package:edu/src/domain/models/form_status.dart';
import 'package:edu/src/domain/models/user_model.dart';
import 'package:edu/src/ui/pages/screens/auth/widgets/button_container.dart';
import 'package:edu/src/ui/pages/screens/auth/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateUserDataScreen extends StatefulWidget {
  const UpdateUserDataScreen({
    super.key,
    required this.title,
    this.hintTextOne = "",
    this.hintTextTwo = "",
    required this.userModel,
  });

  final String title;
  final String hintTextOne;
  final String hintTextTwo;
  final UserModel userModel;

  @override
  State<UpdateUserDataScreen> createState() => _UpdateUserDataScreenState();
}

class _UpdateUserDataScreenState extends State<UpdateUserDataScreen> {
  final TextEditingController controllerOne = TextEditingController();
  final TextEditingController controllerTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text(
              widget.hintTextOne,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            TextFieldContainer(
              keyBoardType: TextInputType.text,
              controller: controllerOne,
              hintText: widget.hintTextOne,
            ),
            20.verticalSpace,
            Text(
              widget.hintTextTwo,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            TextFieldContainer(
              keyBoardType: TextInputType.text,
              controller: controllerTwo,
              hintText: widget.hintTextTwo,
            ),
            const Spacer(),
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state.status == FormStatus.success) {
                  context.read<UserBloc>().add(
                        GetUserData(),
                      );
                  Navigator.pop(context);
                }
                if(state.status == FormStatus.error){
                  Fluttertoast.showToast(msg: state.errorMessage);
                }
              },
              builder: (context, state) {
                return ButtonContainer(
                  title: "Saqlash",
                  onTap: () {
                    UserModel updateData = widget.userModel.copyWith(
                      name: controllerOne.text,
                      surname: controllerTwo.text
                    );
                    context.read<UserBloc>().add(
                          PutUserData(userModel: updateData),
                        );
                  },
                  isLoading: state.status == FormStatus.loading,
                );
              },
            ),
            30.verticalSpace
          ],
        ),
      ),
    );
  }
}
