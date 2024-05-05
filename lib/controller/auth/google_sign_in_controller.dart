import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/data/model/user_model.dart';

class AuthWithGoogle extends GetxController {
  var isSkipAuth = false.obs;
  var isAuth = false.obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(  );
  GoogleSignInAccount? googleSignInAccount;
  UserCredential? userCredential;
  var userModel = UserModel().obs;
  Future<void> loginWithGoogle() async {
    try {
      await googleSignIn.signOut();
      await googleSignIn.signIn().then((value) => googleSignInAccount = value);
      final isSignin = await googleSignIn.isSignedIn();
      if (isSignin) {
        print(googleSignInAccount);
        print("yesss");
        final authgoogle = await googleSignInAccount!.authentication;
        print(authgoogle);
        final credential = await GoogleAuthProvider.credential(
          idToken: authgoogle.idToken,
          accessToken: authgoogle.accessToken); 
             print(credential);
  await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        CollectionReference users =await firebaseFirestore.collection("users");
        print(users);

        final checkuser = await users.doc(googleSignInAccount!.email).get();

        if (checkuser.data() == null) {
        await  users.doc(googleSignInAccount!.email).set({
            "id": userCredential!.user!.uid,
            "name": googleSignInAccount!.displayName,
            "email": googleSignInAccount!.email,
            "status": "",
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updateTime": DateTime.now().toIso8601String(),
            // "chat": ""
          });
        } else {
         await  users.doc(googleSignInAccount!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          //  "updateTime": DateTime.now().toIso8601String(),
          });
        }

        // final curruser = await users.doc(googleSignInAccount!.email).get();
        // final curruserdata = curruser.data() as Map<String, dynamic>;

        // userModel(UserModel.fromJson(curruserdata));
        // userModel(UserModel(
        //     id: curruserdata["id"],
        //     name: curruserdata["name"],
        //     email: curruserdata["email"],
        //     status: curruserdata["status"],
        //     creationTime: curruserdata["creationTime"],
        //     lastSignInTime: curruserdata["lastSignInTime"],
        //     updatedTime: curruserdata["updatedTime"],
        //     chats: curruserdata["chats"]));
        isAuth.value = true;
        //   print("userCredential");

        //    print(userCredential);
        //  Get.offAllNamed(AppRoute.createProfile);
        // Get.offNamed(AppRoute.createProfile);
      } else {}
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await googleSignIn.signOut();
    Get.offAllNamed(AppRoute.login);
  }

  void addNewConnection(String friendEmail) async {
    bool flagNewConnection = false;
    var chat_id;

    CollectionReference chats = firebaseFirestore.collection("chats");
    CollectionReference users = firebaseFirestore.collection("users");

    final docUser = await users.doc(googleSignInAccount!.email).get();
    final docChats =
        await (docUser.data() as Map<String, dynamic>)["chats"] as List;

    if (docChats.length != 0) {
      docChats.forEach((singleChat) {
        if (singleChat["connection"] == friendEmail) {
          chat_id = singleChat["chat_id"];
        }
      });

      if (chat_id != null) {
        flagNewConnection = false;
      } else {
//chat_id == null
        flagNewConnection = true;
      }
    } else {
      flagNewConnection = true;
    }

    if (flagNewConnection) {
      final newchatDoc = await chats.add({
        "connections": [googleSignInAccount!.email, friendEmail],
        "total_chats": 0,
        "total_read": 0,
        "total_unread": 0,
        "chat": [],
        "lastTime": DateTime.now().toIso8601String(),
      });
      users.doc(googleSignInAccount!.email).update({
        "chats": {
          "connection": friendEmail,
          "chat_id": newchatDoc.id,
          "lastTime": DateTime.now().toIso8601String(),
        }
      });

      userModel.update((userModel) {
        userModel!.chats = [
          ChatUser(
            chatId: newchatDoc.id,
            connection: friendEmail,
            lastTime: DateTime.now().toIso8601String(),
          ),
        ];
      });
      chat_id = newchatDoc.id;
      userModel.refresh();
    }
    print(chat_id);
    //  Get.toNamed(AppRoute.chatpage, arguments: chat_id);
  }

////////////
// final authcontroller = Get.find< AuthWithGoogle >();
// authcontroller.addNewConnection(authcontroller.googleSignInAccount.value.email!);
// authcontroller.addNewConnection(controller.tempSearch[indaex]["email"]);

////////////
}
