int[][] grid;

void setup() {
  
  size(300,400);
  grid=new int[3][3];
  strokeWeight(3);
  textAlign(CENTER,CENTER);
  textSize(30);
  
}

void draw() {
  
  int row=0;
  int col=0;
  while (row<3) {
    drawXO(row,col);
    col++;
    if (col==3) {
      col = 0;
      row++;
      println("");
    }
  }
  
  stroke(0);
  line(0,100,300,100);
  line(0,200,300,200);
  line(100,0,100,300);
  line(200,0,200,300);
  
  fill(0);
  text(mouseX+","+mouseY,150,350);
  
}

void drawXO(int row,int col) {
  pushMatrix();
  translate(row*100,col*100);
  if (grid[row][col] == 1) {
    fill(255);
    ellipse(50,50,90,90);
  } else if (grid[row][col] == 2) {
    fill(0);
    line(10,10,90,90);
    line(90,10,10,90);
  }
  popMatrix();
}

void mouseReleased() {
  int row=mouseX/100;
  int col=mouseY/100;
  if (grid[row][col]==0) {
    grid[row][col]=1;
  }
}
