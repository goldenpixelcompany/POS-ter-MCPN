void LOGO() {
  String Text2 = "MPCN";  //Variante avec P et N interchangés
  int fontSize = 120; //MODIFIABLE
  textFont(font2); //MODIFIABLE
  textSize(fontSize); //MODIFIABLE
  textLeading(fontSize*0.8); //MODIFIABLE
  //SET LE TEMPS
  int timeInterval = 1000; //MODIFIABLE
  int time = (millis() / timeInterval) % 4;// Réinitialisation toutes les 4 fois l'intervalle de temps
  String currentText = ((millis() / timeInterval) % 2 == 0) ? textTypes[4] : Text2; //alterne toutes les secondes entre MPCN et MCPN
  for (int i = 0; i < 3; i++) { // Afficher chaque ligne en fonction du temps écoulé
    if (time > i) {  // Afficher une nouvelle ligne tous les intervalles de temps
      fill(couleurFonce);
      text(currentText, -fontSize / 10, height - height/5 + i * 2 * fontSize / 3); // changer la position proprement      
    }
  }
}
