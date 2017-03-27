import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Ploter extends PApplet {

String data[] = new String[4500000];
int c[] = new int[10];
public void setup(){
  
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
public void draw(){
  
  
  for (int i = 0; i < c.length; i++){
     fill (c[i]);
     noStroke();
     float x = PApplet.parseFloat(data[contador*20+(i*2)]);
     float y = PApplet.parseFloat(data[contador*20+(i*2)+1]);
     float posx = map(x,-10,10,0,width);
     float posy = map(y,-10,10,0,height);
     ellipse(posx,posy,4,4);
  }
  
  contador ++;
}
  public void settings() {  size(800,720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ploter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
