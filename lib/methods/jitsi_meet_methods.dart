import 'package:firebase_auth/firebase_auth.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:open_meet/methods/auth_methods.dart';
import 'package:open_meet/methods/firestoremethods.dart';

class MeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void creatNewMeet(
      {required String roomName,
      bool isAudioMuted = true,
      bool video = true,
      String username = ""}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = video;
      if (roomName.isNotEmpty) {
        _firestoreMethods.addToMeetingHistory(roomName);
      }
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
