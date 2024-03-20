import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String newsApiBaseUrl = "https://newsapi.org/v2";
const String apiKey = "8dd9939f8fbe49d3a6b042003ac6a080";
const String country = "us";
const String category = "general";
const String defaultImg =
    "https://img.freepik.com/free-photo/businessman-standing-reading-newspaper_53876-13961.jpg?t=st=1710767659~exp=1710771259~hmac=22d108d882fa131c9ace10ac464fb60e7684bbecd090d86dc36c6e9412a72817&w=1800";
const EdgeInsets defaultPW = EdgeInsets.symmetric(horizontal: 20);

//horenztl divider line
Divider get divider => Divider(
      thickness: 0.3.w,
    );

//colors
const Color fbClr = Color.fromARGB(202, 24, 118, 242);
