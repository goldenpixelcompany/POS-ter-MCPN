void compileVideo() { //Capture compilation de la video
  try {   
    String framesFolderPath = sketchPath("data/Frames");// Chemin du dossier des frames   
    String videoFolderPath = sketchPath("video");// Chemin du dossier pour enregistrer la vidéo  
    File videoFolder = new File(videoFolderPath); // Créer le dossier "video" s'il n'existe pas
    if (!videoFolder.exists()) {
      videoFolder.mkdirs(); // Créer le dossier si nécessaire
    }
    String ffmpegPath = "/opt/homebrew/bin/ffmpeg"; //chemin de commande FFmpeg CHANGER SI BESOIN
    // Commande FFmpeg qui se lance en bash dans le terminal
    String ffmpegCommand = ffmpegPath + " -y -r 24 -f image2 -start_number 30 -i \"" + framesFolderPath + "/frame-%04d.png\" -vcodec libx264 -crf 25 -pix_fmt yuv420p \"" + videoFolderPath + "/output_video.mp4\"";
     
    ProcessBuilder pb = new ProcessBuilder("bash", "-c", ffmpegCommand); // Exécution de la commande dans le répertoire du sketch
    pb.directory(new File(sketchPath())); // Exécute la commande dans le dossier du sketch
    pb.inheritIO();
    Process process = pb.start();
    process.waitFor();  // Exécution de la commande dans le répertoire du sketch
    
    println("Vidéo compilée avec succès dans le dossier Video");
  } catch (Exception e) {
    e.printStackTrace();
  }
} 
