float xPos1 = width;  // Position initiale du premier texte (droite à gauche)
float xPos2 = width;  // Position initiale du deuxième texte (gauche à droite)

void Titre() {
  int fontSize = 50;
  fill(couleurFonce);
  textFont(font2);
  textSize(fontSize);
  textLeading(fontSize/2);  
  textAlign(LEFT);
  // Affichage du texte statique
  fill(couleurFonce);text(textTypes[3], 46, height/5.5);
  // Affichage du texte défilant
  textFont(font1); fill(couleurFonce); textSize(fontSize);
  rect(50,0,width,100);//rect de background
  float text2Width = textWidth(textTypes[0]);  // Largeur du texte défilant
  xPos1 -= 2;  // Vitesse de défilement vers la gauche
  xPos2 += 1.5;  // Vitesse de défilement vers la droite
  
  // Réinitialisation des positions pour le défilement infini
  if (xPos1 < -text2Width) {
    xPos1 += text2Width;  // Réinitialiser pour suivre le premier texte
  }
  if (xPos2 > width) {
    xPos2 -= text2Width;  // Réinitialiser pour suivre le deuxième texte
  }
  fill(couleurClair);
  // Afficher le texte qui défile de droite à gauche
  text(textTypes[0], xPos1, 45);  // Premier texte défilant
  text(textTypes[0], xPos1 + text2Width, 45);  // Deuxième texte pour continuité  
  // Afficher le texte qui défile de gauche à droite
  text(textTypes[0], xPos2, 95);  // Premier texte défilant dans l'autre sens
  text(textTypes[0], xPos2 - text2Width, 95);  // Deuxième texte pour continuité70
}
