
class ParlourModelClass{
  var name;
  late bool isSelected;

  ParlourModelClass(this.name, this.isSelected);
  Map<String, dynamic> toJson(){
    return {
      "name": this.name,
      "isSelected": this.isSelected,
    };
  }
}