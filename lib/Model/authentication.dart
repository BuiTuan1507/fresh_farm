import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseAuth {// lớp
  Future<String> signIn(String email, String password);// khai báo 1 lớp future đăng nhập

  Future<String> signUp(String email, String password);// khai báo 1 lớp future đăng ký

  Future<FirebaseUser> getCurrentUser();// lấy uid của người dùng hiện tại

  Future<void> sendEmailVerification();// gửi xác thực tới email

  Future<void> signOut();// goi signOut của firebase

  Future<bool> isEmailVerified();// check mail co dung k
  Future<String> getEmail();
  Future<String> getName();
  Future<String> getPhotoURL();
  Future<String> updateEmail();
  Future<List> updateProfile();


}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


// đăng nhập
  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }
// đăng ký
  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    userUpdateInfo.displayName = "tuan";
    await result.user.updateProfile(userUpdateInfo);
    await result.user.reload();

    FirebaseUser user = result.user;

    return user.uid;
  }
// lấy thông tin người dùng
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }
// đăng xuất
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
//gửi thông tin email xác thực
  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }
// kiểm tra xác thực email
  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  @override
  Future<String> getEmail() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.email;
  }

  @override
  Future<String> updateEmail() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.updateEmail("email@gmail.com");
    user.reload();
    return user.email;
  }

  @override
  Future<List> updateProfile() async  {
    FirebaseUser user = await _firebaseAuth.currentUser();
    List userInfo = user.providerData;
    return userInfo;
  }

  @override
  Future<String> getName() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.displayName;
  }

  @override
  Future<String> getPhotoURL() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.photoUrl;
  }



  

}