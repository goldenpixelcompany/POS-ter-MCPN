void Titre() {
  int fontSize = 50;
  fill(couleurFonce);
  textFont(font2);
  textSize(fontSize);
  textAlign(LEFT); 
  // Affichage du premier texte statique (première partie du titre)
  fill(couleurFonce);
  textLeading(fontSize/1.2);//modifiable//
  text(textTypes[3], 40, height/5.5); //INVITE(E)

 
  textFont(font1);
  fill(couleurFonce);
  textSize(fontSize);
  rect(45, 0, width, 100);//taille de bandeau supérieur //titre
  fill(couleurClair);
  textLeading(fontSize);
  text(textTypes[0], 45, 45);  // Premier texte statique
}
