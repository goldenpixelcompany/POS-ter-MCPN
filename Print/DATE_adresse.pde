void date_adresse() {
  // Calculer la différence en millisecondes
  int fontSize = 60;
  int heightRect = height/12;
  int heightPos = height/5; //variables pour faire descendre tout d'un coup
  //DATE de la conférence
  fill(couleurFonce); noStroke(); rect(0, heightPos, width, heightRect); //rectangle de fond  
  textSize(fontSize); fill(couleurClair); text(textTypes[1], width/80, heightPos + heightRect/1.20); 
  
  //LIEU ECOLE//
  float textWidth  = textWidth(textTypes[1]); 
  fill(couleurClair); textFont(font4); textSize(fontSize/2.5); textLeading(fontSize/2.5); text(textTypes[5], textWidth*1.05, heightPos + heightRect/2.2);

  //TIMER avant la conférence
  for ( int i =0; i <4;i++){  
  textFont(font1);textSize(fontSize/1.75); fill(couleurFonce); stroke(255); text("Amphi Rodin 18H00", 0, heightPos + heightRect*1.5+i*30);
  }
}
