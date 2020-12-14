import processing.net.*;

color green=#139D11;
color red=#CB0808;
boolean myTurn=false;
Client myClient;
int[][]grid;

void setup() {
  
  size(300,400);
  grid=new int[3][3];
  myClient=new Client(this,"127.0.0.1",1234);
  strokeWeight(3);
  textAlign(CENTER,CENTER);
  textSize(30);
  
}

void draw() {
  if(myTurn)background(green);
  else background(red);
  for(int row=0;row<3;row++){
    for(int col=0;col<3;col++){
      drawXO(row,col);
    }
  }
  
  stroke(0);
  line(0,100,300,100);
  line(0,200,300,200);
  line(100,0,100,300);
  line(200,0,200,300);
  
  fill(0);
  text(mouseX+","+mouseY,150,350);
  
  if(myClient.available()>0){
    String incoming=myClient.readString();
    int r=int(incoming.substring(0,1));
    int c=int(incoming.substring(2,3));
    grid[r][c]=1;
    myTurn=true;
  }
}

void drawXO(int row,int col){
  pushMatrix();
  translate(row*100,col*100);
  if(grid[row][col] == 1){
    fill(255);
    ellipse(50,50,90,90);
  }else if (grid[row][col] == 2){
    fill(0);
    line(10,10,90,90);
    line(90,10,10,90);
  }
  popMatrix();
}

void mouseReleased() {
  int row=mouseX/100;
  int col=mouseY/100;
  if (grid[row][col]==0&&myTurn) {
    grid[row][col]=2;
    myClient.write(row+","+col);
    myTurn=false;
  }
}
