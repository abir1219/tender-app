class AllTendersModel {
  List<Active>? active;
  List<Completed>? completed;
  List<Todo>? todo;
  List<NewTender>? newTender;

  AllTendersModel({this.active, this.completed, this.todo});

  AllTendersModel.fromJson(Map<String, dynamic> json) {
    if (json['active'] != null) {
      active = <Active>[];
      json['active'].forEach((v) {
        active!.add(Active.fromJson(v));
      });
    }
    // if (json[''] != null) {
    //   active = <Active>[];
    //   json['active'].forEach((v) {
    //     active!.add(Active.fromJson(v));
    //   });
    // }
    if (json['completed'] != null) {
      completed = <Completed>[];
      json['completed'].forEach((v) {
        completed!.add(Completed.fromJson(v));
      });
    }
    if (json['todo'] != null) {
      todo = <Todo>[];
      json['todo'].forEach((v) {
        todo!.add(Todo.fromJson(v));
      });
    }
  }
}

class NewTender {
  String? tender;
  String? sId;
  String? date;

  NewTender({this.tender, this.sId, this.date});

  NewTender.fromJson(Map<String, dynamic> json) {
    tender = json['tender'];
    sId = json['_id'];
    date = json['date'];
  }
}

class Active {
  String? tender;
  String? sId;
  String? date;

  Active({this.tender, this.sId, this.date});

  Active.fromJson(Map<String, dynamic> json) {
    tender = json['tender'];
    sId = json['_id'];
    date = json['date'];
  }

}

class Completed{
  String? tender;
  String? id;
  String? date;

  Completed({this.tender, this.id, this.date});

  Completed.fromJson(Map<String,dynamic> json){
    tender = json['tender'];
    id = json['_id'];
    date = json['date'];
  }
}

class Todo{
  String? tender;
  String? id;
  String? date;

  Todo({this.tender, this.id, this.date});

  Todo.fromJson(Map<String,dynamic> json){
    tender = json['tender'];
    id = json['_id'];
    date = json['date'];
  }
}