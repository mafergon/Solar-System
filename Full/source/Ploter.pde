String data[] = new String[4500000];
color c[] = new color[10];
void setup(){
  size(800,720);
  String lines[] = loadStrings("output.txt");
  for (int i = 0; i < lines.length; i++){
     data[i] = lines[i]; 
  }
  for (int i = 0; i< c.length; i++){
     c[i] = color(random(0,255), random(0,255), random(0,255));
  }
  background(0);
}

int contador = 0;
void draw(){
  
  
  for (int i = 0; i < c.length; i++){
     fill (c[i]);
     noStroke();
     float x = float(data[contador*20+(i*2)]);
     float y = float(data[contador*20+(i*2)+1]);
     float posx = map(x,-10,10,0,width);
     float posy = map(y,-10,10,0,height);
     ellipse(posx,posy,4,4);
  }
  
  contador ++;
}