class ImageClass {
  final String? full;

  ImageClass({required this.full});

  String getPassiveImageUri() {
    return "https://ddragon.leagueoflegends.com/cdn/13.9.1/img/passive/$full";
  }  
  
  String getSpellImageUri() {
    return "https://ddragon.leagueoflegends.com/cdn/13.9.1/img/spell/$full";
  }
}
