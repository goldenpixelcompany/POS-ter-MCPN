void MerdienCulture() {
  int fontSize = 25;  // Taille de police
  textLeading(fontSize);  // Appliquer l'espacement entre les lignes
  textFont(font2);
  textSize(fontSize);  // Appliquer la taille de police

  // Afficher tout le texte dès le début
  for (int j = 0; j < 3; j++) { // Répéter trois fois l'affichage du texte
    String[] lines = split(textTypes[6], '\n');  // Garder la séparation ici pour l'itération
    for (int i = 0; i < lines.length; i++) {
      float lineHeight = textAscent() + textDescent();  // Calcule la hauteur des lignes de texte
      float posY = height/2.5 + j * (lines.length * fontSize) + i * fontSize;  // Changer la position proprement.
      int charsInLine = lines[i].length();  // Calculer combien de caractères sont dans chaque ligne

      // Dessiner le rectangle bleu pour suivre le texte écrit
      float textWPartial = textWidth(lines[i].substring(0, charsInLine));  // Calculer la largeur du texte
      fill(couleurFonce);
      noStroke();
      rect(width/3, posY, textWPartial, lineHeight);  // Dessiner le rectangle en arrière-plan

      // Dessiner tout le texte en blanc
      fill(couleurClair);
      text(lines[i], width/3, posY + textAscent());
    }
  }
}
