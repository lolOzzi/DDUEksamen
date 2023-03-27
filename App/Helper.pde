
class Helper {

  ArrayList<PImage> loadImages(String folderPath) {
    ArrayList<PImage> images = new ArrayList<PImage>();
    File folder = new File(dataPath(folderPath));
    File[] files = folder.listFiles();

    for (File file : files) {
      if (file.isFile() && file.getName().endsWith(".png")) {
        PImage image = loadImage(file.getAbsolutePath(), "png");
        images.add(image);
      }
    }

    return images;
  }
}
