import processing.pdf.*; // Importer pour le format PDF
boolean recordingPDF = false;

int frameCounter=0;//pour la vidéo

import java.util.Calendar;  // Importer les classes Java pour la gestion des dates
import java.util.Date;
Calendar targetDate; // Variable globale pour la date cible

import java.util.ArrayList;
ArrayList<TextObject> texts = new ArrayList<TextObject>();

//logo ENSAD PSL MNC
PShape svg;

color[] tonsClairs = new color[8]; color couleurClair;  // Couleur claire choisie
color[] tonsFonces = new color[8]; color couleurFonce;  // Couleur foncée choisie

PFont font1;
PFont font2; 
PFont font3;
PFont font4;

String[] textTypes = {"Dans le parc des machines\nélectrico-numériques / ",
            /*1*/         "18.10.2024",
            /*2*/         "Ecole des Arts Décoratifs\nde Paris ",
            /*3*/          "Fanny Lopez",
            /*4*/          "MCPN",
            /*5*/          "31 rue d'Ulm\n75005 PARIS",
            /*6*/          "MERIDIEN CULTURE\nPRATIQUE NUMERIQUE"};

void setup() {
  size(600, 800);
  generateTexts(); //init de la génération des textes en background//
  
  targetDate = Calendar.getInstance();
  targetDate.set(2024, Calendar.OCTOBER, 18, 0, 0, 0); //SETUP la date de la conférence//
  
  font1 = createFont("VG5000-Regular.otf", 20);
  font2 = createFont("Satoshi-Bold", 20);
  font3 = createFont("Satoshi-Regular", 20);
  font4 = createFont("Satoshi-Black", 20);
  
  // Couleur choisies au hasard 
  tonsClairs[0] = color(232, 72, 52);  // Exemple de couleurs claires
  tonsClairs[1] = color(117, 251, 120);
  tonsClairs[2] = color(134, 237, 217);
  tonsClairs[3] = color(215, 171, 57);
  tonsClairs[4] = color(250, 226, 233);
  tonsClairs[5] = color(231, 252, 254);
  tonsClairs[6] = color(242, 242, 242);
  tonsClairs[7] = color(208, 197, 97);
  
  // Initialisation des tons foncés
  tonsFonces[0] = color(58, 112, 69);  // Exemple de couleurs foncées
  tonsFonces[1] = color(102, 51, 0);
  tonsFonces[2] = color(33, 33, 33);
  tonsFonces[3] = color(125, 48, 20);
  tonsFonces[4] = color(57, 28, 130);
  //tonsFonces[5] = color(0, 51, 102);
  //tonsFonces[6] = color(51, 0, 102);
  //tonsFonces[7] = color(102, 0, 102);
  //Sélection d'une couleur claire et d'une couleur foncée au hasard
  couleurClair = tonsClairs[int(random(8))];
  couleurFonce = tonsFonces[int(random(8))];
  
  svg = loadShape("image.svg"); //Charger le logo ENSAD PSL
  for (int i = 0; i < svg.getChildCount(); i++) {
    PShape child = svg.getChild(i);
    child.setFill(couleurFonce);  //Modifier la couleur de remplissage de chaque élément
  }
}

void draw() {
  // Vérifiez si vous devez enregistrer en PDF
  if (recordingPDF) {
    beginRecord(PDF, "output.pdf");
    //EXPORT TERMINE
  }
  background(couleurClair);
  for (TextObject tObj : texts) { // Afficher les textes dynamiques (en mouvement)
    tObj.update();
    tObj.display();
  }    
  //AFFICHER LES INFORMATIONS AVEC LEUR ANIMATIONS
  MerdienCulture();
  LOGO();
  shape(svg, textWidth(textTypes[4]), height-170, 170, 170); //afficher le logo
  date_adresse();
  Ecole();
  Titre();
  if (recordingPDF) {
    endRecord();
    recordingPDF = false; // Arrêter l'enregistrement après avoir terminé
    saveFrame("data/Frames/frame-" + nf(frameCounter, 4) + ".png");
    frameCounter++;
    //convertPDF();
  }
}

void keyPressed(){
   switch(key){
   case 's': 
     recordingPDF = true; //triggred le record
     break;
   }
   
}
void keyReleased(){
   switch(key){
   case 's': 
     recordingPDF = false; // termine l'enregistrement
     break;
   } 
}
