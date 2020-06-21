

class Task {
  final int id;
  final String title;
  final String description;
  final String dateTime;

  Task({this.id, this.title, this.description, this.dateTime});

  
  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'title': title,
      'description': description,
      'dateTime': dateTime,
    };
  }

 

 
  
 
}
