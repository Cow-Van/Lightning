final float[] BACKGROUND = new float[]{0, 0, 0};
final ArrayList<HashMap> bolts = new ArrayList();

final float[] lineColor = new float[]{255, 255, 255};

void setup() {
  size(500, 500);
  strokeWeight(10);
}

void draw() {
  background(BACKGROUND[0], BACKGROUND[1], BACKGROUND[2]);
  
  if (bolts.size() > 0) {
    update(bolts.get(0));
  }
}

void mousePressed() {
  float x = (float) (Math.random() * (width - width / 5) + width / 5);
  float y = -1;
  float maxXOffset = randMaxXOffset();
  float maxYOffset = randMaxYOffset();
  
  ArrayList<float[]> lines = new ArrayList();
  lines.add(new float[]{0, x, y, randX(maxXOffset, x), randY(maxYOffset, y)});
  
  HashMap bolt = new HashMap();
  bolt.put("maxXOffset", maxXOffset);
  bolt.put("maxYOffset", maxYOffset);
  bolt.put("maxLineTicks", randMaxLineTick());
  bolt.put("lines", lines);
  
  bolts.add(bolt);
}

float randMaxXOffset() {
  return (float) (width / 8 + Math.random() * 25);
}

float randMaxYOffset() {
  return (float) (height / 10 + Math.random() * 25);
}

float randMaxLineTick() {
  return (float) (30 + Math.random() * 20 - 10);
}

boolean update(HashMap bolt) {
  float maxXOffset = (float) bolt.get("maxXOffset");
  float maxYOffset = (float) bolt.get("maxYOffset");
  float maxLineTicks = (float) bolt.get("maxLineTicks");
  ArrayList<float[]> lines = (ArrayList<float[]>) bolt.get("lines");
  
  if (lines.size() > 0 && lines.get(lines.size() - 1)[4] <= height + 50) {
    lines.add(new float[]{0, lines.get(lines.size() - 1)[3], lines.get(lines.size() - 1)[4], randX(maxXOffset, lines.get(lines.size() - 1)[3]), randY(maxYOffset, lines.get(lines.size() - 1)[4])});
  }
  
  for (int i = lines.size() - 1; i >= 0; i--) {
    float[] line = lines.get(i);
    if (line[0] > maxLineTicks) {
      lines.remove(line);
      continue;
    }
    
    stroke(lineColor[0], lineColor[1], lineColor[2], lineAlpha(maxLineTicks, line[0]));
    line(line[1], line[2], line[3], line[4]);
    line[0]++;
  }
  
  return lines.size() == 0;
}

float randX(float maxXOffset, float x) {
  return (float) (Math.random() * maxXOffset - (maxXOffset / 2)) + x;
}

float randY(float maxYOffset, float y) {
  return (float) (Math.random() * maxYOffset) + y;
}

float lineAlpha(float maxLineTicks, float tick) {
  return 255 - ((tick / maxLineTicks) * 255);
}
