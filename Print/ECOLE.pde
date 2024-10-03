int charIndex4 = textTypes[2].length()-1;  // Variable globale pour suivre la progression du texte
int frameDelay4 = 0;  // Délai entre chaque lettre

void Ecole() {
  int fontSize = 61;
  float lineSpacing = 0;  // Espacement personnalisé entre les lignes
  textFont(font3);
  textSize(fontSize);

  String[] lines = split(textTypes[2], '\n');  // Séparer le texte en lignes
  // Augmenter l'index en fonction du temps (avec le délai)
  /*if (frameCount % frameDelay4 == 0 && charIndex4 < textTypes[2].length()) {
    charIndex4++;
  }*/

  // Dessiner le rectangle bleu en arrière-plan
  fill(couleurFonce);
  noStroke();
  float rectY = height/6;            // Position Y du rectangle
  float rectHeight = 0;                 // Initialiser la hauteur
  rectHeight += (lines.length - 1) * lineSpacing;  // Ajouter l'espacement entre les lignes
  // Appliquer les transformations seulement au texte (rotation 90°)
  pushMatrix();
  translate(width, rectY + rectHeight / 4);
  rotate(HALF_PI); //Faire pivoter le texte de 90°

  int currentCharIndex = 0; //Pour suivre l'avancée dans les lignes
  for (int i = 0; i < lines.length; i++) {
    // Calcule la hauteur des lignes de texte
    float lineHeight = textAscent() + textDescent();
    int charsInLine = lines[i].length(); // Calculer combien de caractères sont affichés pour cette ligne
    int charsToShow = min(charIndex4 - currentCharIndex, charsInLine);
    charsToShow = max(charsToShow, 0);  // Assurez-vous que la valeur ne soit pas négative
    currentCharIndex += charsInLine + 1;  // Inclure le retour à la ligne

    // Dessiner le rectangle bleu qui suit le texte écrit
    float textWPartial = textWidth(lines[i].substring(0, charsToShow));
    rect(0, i * (lineHeight + lineSpacing), textWPartial, lineHeight);

    fill(couleurClair);
    text(lines[i].substring(0, charsToShow), 0, i * (lineHeight + lineSpacing) + textAscent()); //TEXTE

    //Remettre la couleur pour le rectangle bleu
    fill(couleurFonce);
  }

  popMatrix();  // Restaurer l'état initial du canevas pour ne pas affecter les autres éléments

  // Réinitialiser l'animation quand tout le texte a été affiché
  if (charIndex4 >= textTypes[2].length()) {
    charIndex4 = 0;  // Redémarrer
  }

  // Réinitialiser l'alignement par défaut (si besoin, ajuster selon votre sketch)
  textAlign(LEFT, BASELINE);
}
