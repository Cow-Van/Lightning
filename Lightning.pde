import java.util.List;

final float[] BACKGROUND = new float[]{0, 0, 0};
final List<Bolt> bolts = new ArrayList();

void setup() {
  size(500, 500);
  strokeWeight(10);
}

void draw() {
  background(BACKGROUND[0], BACKGROUND[1], BACKGROUND[2]);
  fill(255);
  text("Hello", 100, 100);
  
  for (Bolt bolt : bolts) {
    bolt.update();
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
  private final List<float[]> lines = new ArrayList();
  
  public Bolt(float x, float y) {
    lines.add(new float[]{0, x, y, randX(x), randY(y)});
  }
  
  public void update() {
    if (lines.size() > 0 && lines.get(lines.size() - 1)[4] <= height + 50) {
      lines.add(new float[]{0, lines.get(lines.size() - 1)[3], lines.get(lines.size() - 1)[4], randX(lines.get(lines.size() - 1)[3]), randY(lines.get(lines.size() - 1)[4])});
    }
    
    for (int i = lines.size() - 1; i >= 0; i--) {
      float[] line = lines.get(i);
      if (line[0] > maxLineTicks) {
        lines.remove(line);
        continue;
      }
      
      stroke(lineColor[0], lineColor[1], lineColor[2], lineAlpha(line[0]));
      line(line[1], line[2], line[3], line[4]);
      line[0]++;
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
