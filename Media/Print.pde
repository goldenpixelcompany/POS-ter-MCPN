String pdfPath = sketchPath("output.pdf"); // Chemin absolu vers le PDF

void convertPDF() {
  String outputFilePath = sketchPath("output_converted.pdf"); // Chemin vers le fichier de sortie
  // Commande Ghostscript pour la conversion
  String command = "gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=\"" + outputFilePath + "\" -dPDFFitPage -dDEVICEWIDTHPOINTS=1690 -dDEVICEHEIGHTPOINTS=1134 \"" + pdfPath + "\"";

  try {
    // Exécuter la commande
    Process process = Runtime.getRuntime().exec(command);
    process.waitFor(); // Attendre la fin du processus

    // Afficher un message de succès
    println("Conversion terminée avec succès.");
  } catch (Exception e) {
    // Gérer les exceptions
    e.printStackTrace();
  }
}
