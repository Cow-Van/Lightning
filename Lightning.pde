final float[] BACKGROUND = new float[]{0, 0, 0};
final ArrayList<Bolt> bolts = new ArrayList();

void setup() {
  size(500, 500);
  strokeWeight(10);
}

void draw() {
  background(BACKGROUND[0], BACKGROUND[1], BACKGROUND[2]);
  
  for (int i = 0; i < bolts.size(); i++) {
    bolts.get(i).update();
  }
}

void mousePressed() {
  bolts.add(new Bolt((float) (Math.random() * (width - width / 5) + width / 5), -1));
}


class Bolt {
  private final float maxXOffset = (float) (width / 10 + Math.random() * 25 - 12.5);
  private final float maxYOffset = (float) (height / 10 + Math.random() * 25 - 12.5);
  private final float maxLineTicks = (float) (60 + Math.random() * 20 + 10);
  private final float[] lineColor = new float[]{255, 255, 255};
  private final ArrayList<float[]> lines = new ArrayList();
  
  public Bolt(float x, float y) {
    lines.add(new float[]{0, x, y, randX(x), randY(y)});
  }
  
  public void update() {
    if (lines.size() > 0 && lines.get(lines.size() - 1)[4] <= height + 50) {
      lines.add(new float[]{0, lines.get(lines.size() - 1)[3], lines.get(lines.size() - 1)[4], randX(lines.get(lines.size() - 1)[3]), randY(lines.get(lines.size() - 1)[4])});
    }
    
    for (int i = lines.size() - 1; i >= 0; i--) {
      float[] lineLines = lines.get(i);
      if (lineLines[0] > maxLineTicks) {
        lines.remove(lineLines);
        continue;
      }
      
      stroke(lineColor[0], lineColor[1], lineColor[2], lineAlpha(lineLines[0]));
      line(lineLines[1], lineLines[2], lineLines[3], lineLines[4]);
      lineLines[0]++;
    }
  }
  
  private float randX(float x) {
    return (float) (Math.random() * maxXOffset - (maxXOffset / 2)) + x;
  }
  
  private float randY(float y) {
    return (float) (Math.random() * maxYOffset) + y;
  }
  
  private float lineAlpha(float tick) {
    return 255 - ((tick / maxLineTicks) * 255);
  }
}
