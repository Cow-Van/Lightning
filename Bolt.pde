import java.util.List;

class Bolt {
  private final float maxXOffset = width / 20;
  private final float maxYOffset = height / 20;
  private final float maxLineTicks = 100;
  private final float[] lineColor = new float[]{255, 255, 255};
  private final List<float[]> lines = new ArrayList();
  
  public Bolt(float x, float y) {
    lines.add(new float[]{0, x, y, randX(x), randY(y)});
  }
  
  public void update() {
    for (int i = lines.size() - 1; i >= 0; i--) {
      float[] line = lines.get(i);
      if (line[0] > maxLineTicks) {
        lines.remove(line);
        continue;
      }
      
      stroke(lineColor[0], lineColor[1], lineColor[2], lineAlpha(line[0]));
      line(line[1], line[2], line[3], line[4]);
      line[0]++;
      System.out.println(lineAlpha(line[0]));
    }
  }
  
  private float randX(float x) {
    return (float) (Math.random() * maxXOffset - (maxXOffset / 2)) + x;
  }
  
  private float randY(float y) {
    return (float) (Math.random() * maxYOffset - (maxYOffset / 2)) + y;
  }
  
  private float lineAlpha(float tick) {
    return 255 - ((tick / maxLineTicks) * 255);
  }
}
