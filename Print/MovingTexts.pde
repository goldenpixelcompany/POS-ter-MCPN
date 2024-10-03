void generateTexts() {
  int maxTries = int(random(5, 30));   println(maxTries);//MODIFIABLE
  float[] probabilities = {0.7, 0.6, 0.5, 0.4, 0.3, 0.05}; // Probabilités de génération
  int[] importance = {1, 2, 3, 4, 5, 6}; // Importance associée à chaque type
  int[] generatedCounts = new int[6]; // Compte combien de fois chaque texte a été généré
  int[] maxGeneration = {7, 7, 7, 7, 7, 7}; // Limite de génération par type
  int totalTries = 0;

  while (totalTries < maxTries) {
    for (int i = 0; i < generatedCounts.length; i++) { // Utiliser generatedCounts.length pour éviter l'erreur
      if (generatedCounts[i] < maxGeneration[i]) {
        if (random(1) < probabilities[i]) { // Probabilité de génération
          // Générer l'objet TextObject
          float x = random(width);
          float y = random(height);
          float amplitude = random(20, 100); //AMPLITUDE DU MOUVEMENT
          String direction = random(1) < 0.7 ? "horizontal" : "vertical"; //INCLINAISON ALEATOIRE
          int movementType = int(random(1, 4)); // Type de mouvement entre 1 et 3
          float size = generateSizeByImportance(importance[i]);
          texts.add(new TextObject(textTypes[i], importance[i], size, movementType, x, y, amplitude, direction)); // Ajouter l'objet texte à la liste
          generatedCounts[i]++; // Incrémenter le compteur pour ce type de texte
        }
      }
    }
    totalTries++;
  }
}

  //Probabilités de taille pour chaque importance
  float generateSizeByImportance(int importance) {
  float[][] sizeChances = {
    {0.6, 0.3, 0.05, 0.03, 0.01, 0.01}, //Titre : 60% de chance d'avoir 100, 30% pour 60, etc.
    {0.4, 0.4, 0.1, 0.05, 0.03, 0.02}, //Date : Plus de chances pour 60
    {0.3, 0.4, 0.2, 0.05, 0.03, 0.02}, //Lieu
    {0.2, 0.3, 0.3, 0.1, 0.05, 0.05}, //Invité
    {0.1, 0.2, 0.3, 0.2, 0.1, 0.1}, //Organisateur
    {0.05, 0.1, 0.2, 0.3, 0.2, 0.15},  //Description
    {0.05, 0.1, 0.2, 0.3, 0.2, 0.15}  //Description
  };

  float[] chances = sizeChances[importance - 1];
  float rand = random(1);
  if (rand < chances[0]) return 40;
  if (rand < chances[0] + chances[1]) return 20;
  if (rand < chances[0] + chances[1] + chances[2]) return 15;
  if (rand < chances[0] + chances[1] + chances[2] + chances[3]) return 10;
  if (rand < chances[0] + chances[1] + chances[2] + chances[3] + chances[4]) return 5;
  return 16;
}


class TextObject { // TextObject class
    String content;
    int importance;
    float size;
    int movementType;
    float x, y;
    float amplitude;
    String displayDirection;
    color textColor;  
    float originalX, originalY;

    TextObject(String content, int importance, float size, int movementType, float x, float y, float amplitude, String displayDirection) {
        this.content = content;
        this.importance = importance;
        this.size = size;
        this.movementType = movementType;
        this.x = x;
        this.y = y;
        this.originalX = x;
        this.originalY = y;
        this.amplitude = amplitude;
        this.displayDirection = displayDirection;
        this.textColor = couleurFonce; // Tous les textes sont mobiles, donc couleur foncée par défaut
    }

    void update() {
        // Appliquer le mouvement basé sur le type de mouvement
        switch (movementType) {
            case 1: // Zigzag
            case 2: // Straight angles
            case 3: // Z shape
                moveInDiagonal();
                break;
        }

        // Garder le texte à l'intérieur du canvas
        this.x = constrain(this.x, 0, width - textWidth(content));
        this.y = constrain(this.y, 0, height - textAscent() - textDescent());
    }

    void display() {
        textFont(font1);
        textSize(size); // Définir la taille en fonction de l'importance

        // Définir la couleur du texte
        fill(color(couleurFonce, 150)); // Couleur sombre avec un peu de transparence pour tous les textes

        // Afficher le texte
        if (displayDirection.equals("horizontal")) {
            text(content, x, y);
        } else {
            pushMatrix();
            translate(x, y);
            rotate(HALF_PI);
            text(content, 0, 0);
            popMatrix();
        }
    }

    // Fonctions de mouvement
    float speed = 0.5; // Vitesse de mouvement
    float angle; // Angle de mouvement

    void moveInDiagonal() {
        // Choisir un angle aléatoire à chaque mise à jour
        angle = random(TWO_PI); 

        // Déplacement diagonal avec plus d'amplitude
        this.x += cos(angle) * speed * this.amplitude; 
        this.y += sin(angle) * speed * this.amplitude;

        // Garder le texte à l'intérieur du canvas
        this.x = constrain(this.x, 0, width);
        this.y = constrain(this.y, 100, height);
    }
}
