class HomeModel {
  String? userName, userEmail, userId;

  HomeModel({this.userName, this.userEmail, this.userId});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
        userEmail: m1['userEmail'],
        userId: m1['userId'],
        userName: m1['userName']);
  }

  Map<String, dynamic> modelToMap() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userId': userId,
    };
  }
}
