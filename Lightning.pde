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
  
  for (int i = 0; i < bolts.size(); i++) {
    fill(255);
    text(bolts.size(), 200 + i * 10, 200 + i * 10);
    bolts.get(i).update();
    fill(255);
    text("Bat", 400, 400);
  }
}

void mousePressed() {
  fill(255);
  text("Bar", 300, 100);
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
    fill(255);
    text("Bing", 400, 100);
    if (lines.size() > 0 && lines.get(lines.size() - 1)[4] <= height + 50) {
      lines.add(new float[]{0, lines.get(lines.size() - 1)[3], lines.get(lines.size() - 1)[4], randX(lines.get(lines.size() - 1)[3]), randY(lines.get(lines.size() - 1)[4])});
    }
    fill(255);
    text("Bop", 200, 100);
    
    for (int i = lines.size() - 1; i >= 0; i--) {
      fill(255);
      text("E", 300 + i * 10, 300 + i * 10);
      float[] line = lines.get(i);
      if (line[0] > maxLineTicks) {
        fill(255);
        text("C", 350 + i * 10, 300 + i * 10);
        lines.remove(line);
        continue;
      }
      
      fill(255);
      text("M", 100 + i * 10, 400 + i * 10);
      stroke(lineColor[0], lineColor[1], lineColor[2], lineAlpha(line[0]));
      fill(255);
      text(line[1], 100 + i * 10, 300 + i * 10);
      text(line[2], 200 + i * 10, 300 + i * 10);
      text(line[3], 300 + i * 10, 300 + i * 10);
      text(line[4], 400 + i * 10, 300 + i * 10);
      fill(255);
      text("L", 150 + i * 10, 150 + i * 10);
      line[0]++;
      fill(255);
      text("I", 350 + i * 10, 300 + i * 10);
    }
  }
  
  private float randX(float x) {
    return (float) (Math.random() * maxXOffset - (maxXOffset / 2)) + x;
  }
  
  private float randY(float y) {
    return (float) (Math.random() * maxYOffset) + y;
  }
  
  private float lineAlpha(float tick) {
    fill(255);
    text("LINE_A", 200, 400);
    return 255 - ((tick / maxLineTicks) * 255);
  }
}
