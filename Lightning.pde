final float[] BACKGROUND = new float[]{0, 0, 0};
final List<Bolt> bolts = new ArrayList();

void setup() {
  size(500, 500);
  strokeWeight(10);
}

void draw() {
  background(BACKGROUND[0], BACKGROUND[1], BACKGROUND[2]);
  
  for (Bolt bolt : bolts) {
    bolt.update();
  }
}

void mousePressed() {
  bolts.add(new Bolt((float) (Math.random() * (width - width / 5) + width / 5), -1));
}
