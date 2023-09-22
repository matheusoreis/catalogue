import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../controller/services/home/blog/blog_service.dart';
import '../../../../controller/state/home/blog/blog_state.dart';
import '../../../../models/home/blog/blog_model.dart';
import '../../../../shared/local_storage.dart';
import '../../../../shared/result.dart';

class BlogController extends Store<BlogState> {
  BlogController({
    required this.sharedPreferenceService,
    required this.blogService,
  }) : super(SuccessBlogState(blog: BlogModelData.empty()));

  final BlogService blogService;
  final SharedPreferenceService sharedPreferenceService;

  Future getBlog({
    required BuildContext context,
    required List<String> headers,
  }) async {
    setLoading(true);

    String? dataString = await sharedPreferenceService.loadString('userData');
    var dataMap = json.decode(dataString ?? '');

    final String authorization = dataMap['token'];

    await Future.delayed(const Duration(seconds: 1));

    final result = await blogService.getBlog(authorization: authorization, headers: headers);

    result.fold(
      success: (success) {
        update(
          SuccessBlogState(
            blog: success,
          ),
        );
      },
      failure: (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              failure.message,
            ),
          ),
        );
      },
    );
  }
}
