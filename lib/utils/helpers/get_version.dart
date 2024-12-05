import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GetVersionDetails {
  Future<String> getAppInfo() async {
    // Retrieve package information
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // Extract details
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    // Return information as a map
    return version;
  }
}
