void LOGO() {
  String Text2 = "MPCN";  // Variante avec P et N interchangés
  int fontSize = 120;  // Taille de la police
  textFont(font2);  // Appliquer la police
  textSize(fontSize);  // Appliquer la taille de police
  textLeading(fontSize * 0.8);  // Espacement entre les lignes

  // Texte à afficher (choisissez celui que vous préférez entre textTypes[4] et Text2)
  String currentText = textTypes[4];  // Ou Text2 si vous préférez

  for (int i = 0; i < 3; i++) {  // Répéter trois fois l'affichage du texte
    fill(couleurFonce);
    text(currentText, -fontSize / 10, height - height / 5 + i * 2 * fontSize / 3);  // Afficher le texte sans animation
  }
}
