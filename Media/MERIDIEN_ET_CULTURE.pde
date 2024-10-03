int charIndex = 0;  // Indice pour le caractère en cours
int frameDelay = 2;  // Délai en frames entre chaque caractère

void MerdienCulture() {
  int fontSize = 25;  // Taille de police
  textLeading(fontSize);// Appliquer l'espacement entre les lignes
  textFont(font2);
  textSize(fontSize);// Appliquer la taille de police
  // Augmenter l'index en fonction du temps (avec le délai)
  if (frameCount % frameDelay == 0 && charIndex < textTypes[6].length()) {
    charIndex++;
  }
  for (int j = 0; j < 3; j++) { // Répéter trois fois l'affichage du texte
    int currentCharIndex = 0; 
    String[] lines = split(textTypes[6], '\n'); // Garder la séparation ici pour l'itération
    for (int i = 0; i < lines.length; i++) {
      float lineHeight = textAscent() + textDescent();  // Calcule la hauteur des lignes de texte
      float posY = height/2.5 + j * (lines.length * fontSize) + i * fontSize; //changer la position proprement.
      int charsInLine = lines[i].length(); // Calculer combien de caractères sont affichés pour cette ligne
      int charsToShow = min(charIndex - currentCharIndex, charsInLine);
      charsToShow = max(charsToShow, 0);  // Assurez-vous que la valeur ne soit pas négative
      currentCharIndex += charsInLine;
      // Dessiner le rectangle bleu pour suivre le texte écrit
      float textWPartial = textWidth(lines[i].substring(0, charsToShow));
      fill(couleurFonce);
      noStroke();
      rect(width/3, posY, textWPartial, lineHeight);
      // Dessiner le texte progressivement en blanc
      fill(couleurClair);
      text(lines[i].substring(0, charsToShow), width/3, posY + textAscent());
    }
  }
  // Réinitialiser l'animation quand tout le texte a été affiché
  if (charIndex >= textTypes[6].length()) { 
    charIndex = 0;
  }
}
