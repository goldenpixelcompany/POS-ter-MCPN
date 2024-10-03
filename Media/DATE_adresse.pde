void date_adresse() {
  // Obtenir la date actuelle
  Calendar now = Calendar.getInstance();
  // Calculer la différence en millisecondes
  long diffInMillis = targetDate.getTimeInMillis() - now.getTimeInMillis();
  // Convertir la différence en secondes, minutes, heures et jours
  long diffInSeconds = diffInMillis / 1000;
  long seconds = diffInSeconds % 60;
  long minutes = (diffInSeconds / 60) % 60;
  long hours = (diffInSeconds / 3600) % 24;
  long days = diffInSeconds / (3600 * 24);
  String timerText = String.format("%02d jours %02d:%02d:%02d", days, hours, minutes, seconds); // Formater le texte du timer avec String.format
  
  int fontSize = 60;
  int heightRect = height/12;
  int heightPos = height/5;

  float fadeSpeed = 5; //MODIFIABLE
  float alpha = 128 + 127 * sin(millis() * 0.002 * fadeSpeed); 

  //DATE de la conférence
  fill(couleurFonce); noStroke(); rect(0, heightPos, width, heightRect); //rectangle de fond  
  textSize(fontSize); fill(couleurClair, alpha); text(textTypes[1], width/80, heightPos + heightRect/1.20); 
  
  //LIEU ECOLE//
  float textWidth  = textWidth(textTypes[1]); 
  fill(couleurClair); textFont(font4); textSize(fontSize/2.5); textLeading(fontSize/2.5); text(textTypes[5], textWidth*1.05, heightPos + heightRect/2.2);

  //TIMER avant la conférence
  for ( int i =0; i <4;i++){  
  textFont(font1);textSize(fontSize/1.75); fill(couleurFonce); stroke(255); text("Dans "+timerText, 0, heightPos + heightRect*1.5+i*30);
  }
}
