class User{
  final int userId;
  final String name;
  final String username;
  final String email;
  final int yearsOfExperience;
  final String averageScore;
  final String practiceFrequency;
  final int scoreGoal;
  final int puttingGoal;
  final int approachGoal;
  final int shotGoal;
  final String passwordHash;

  const User({
    required this.userId,
    required this.name,
    required this.username,
    required this.email,
    required this.yearsOfExperience,
    required this.averageScore,
    required this.practiceFrequency,
    required this.scoreGoal,
    required this.puttingGoal,
    required this.approachGoal,
    required this.shotGoal,
    required this.passwordHash,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['userId'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        yearsOfExperience: json['yearsOfExperience'],
        averageScore: json['averageScore'],
        practiceFrequency: json['practiceFrequency'],
        scoreGoal: json['scoreGoal'],
        puttingGoal: json['puttingGoal'],
        approachGoal: json['approachGoal'],
        shotGoal: json['shotGoal'],
        passwordHash: json['passwordHash'],
      );

  Map<String, dynamic> toJson()=>{
        "userId" : userId,
        "name" : name,
        "username": username,
        "email" : email,
        "yearsOfExperience" : yearsOfExperience,
        "averageScore" : averageScore,
        "practiceFrequency" : practiceFrequency,
        "scoreGoal" : scoreGoal,
        "puttingGoal" : puttingGoal,
        "approachGoal" : approachGoal,
        "shotGoal" : shotGoal,
        "passwordHash" : passwordHash,
      };
}