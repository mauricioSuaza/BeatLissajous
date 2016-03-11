int angle=0;
float x, y;
//float radius = 200;
float ang=0;
float i=random(5,10);
float j=random(5);
float time=0;
float step=0.5;

float magnify = 300; // This is how big we want the rose to be.
float rotation = 0; // rotation : this is basically how far round the circle we are going to go
float radius = 0; // radius : this is basically how far from the origin we are.
//int elements = 256;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 
int k=10;
float rInc=0;
float rotInc=0.004;

Maxim maxim;
AudioPlayer player;
float power=0;
//float threshold = 0.35;// vary this until the square appears on the beats
float threshold = 0.3;// vary this until the square appears on the beats
int wait = 0;
boolean playit = false;
PVector beat;



void setup(){

  background(0);
  size(displayWidth,displayHeight);
  strokeWeight(2);
  stroke(255);
  frameRate(25);
  
  maxim = new Maxim(this);
  player = maxim.loadFile("NadieNunca.wav");
  player.setLooping(true);
  player.setAnalysing(true);
  
  beat= new PVector(0.6,1.1);
  

}

void draw(){
  
  
  
  if (playit) {
   
    player.play(); 
    power = player.getAveragePower(); 
   // ellipse(mouseX,mouseY,power*500,power*500);
  
    
    if (power>threshold  ) {
      rInc=power/30;
      rotInc=power/4;
      
      
  
 //  wait=8;
    beat=new PVector(power*3.13,power*3.2);
  }
  //wait--;
  }
  
  if (rInc>0){
   rInc-=rInc/(power*100);
   rotInc-=rotInc/(random(1,32));
  }

fill(0,80);
rect(0,0,1400,800);


 
  translate(width*0.5,height*0.5);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.

radius+=rInc;

rotation+=rotInc;
 
 float spacing = TWO_PI/6;
 
pushMatrix();
//translate(x,y);


//rotate(radians(angle));
 

fill(0,2);


 time+=step;

 rotate(spacing*rotation);
 
  translate(0,sin(spacing*k*radius)*250);

for (int j=0;j<60;j++){
  // translate(sin(spacing*j*radius)*100, 0);
   
 scale(1.05*random(beat.x,beat.y));
rotate(radians(time));
strokeWeight(0.2);
rect(j,j,j*6,j*6);
ellipse(j,j,j*9,j*9);
 
 }
 popMatrix();
 
// translate(width*0.1,height*0.1);
 
 pushMatrix();
//  translate(width*0.75,height*0.75);
  
 rotate(spacing*rotation);
translate(sin(spacing*k*radius)*250,0);
 for (int j=0;j<60;j++){
  // translate(sin(spacing*j*radius)*100, 0);
   
 scale(random(beat.x,beat.y));
rotate(radians(time*1.5));
strokeWeight(0.2);
rect(j,j,j*6,j*6);
ellipse(j,j,j*9,j*9);
 
 }
 popMatrix();
 
 pushMatrix();
//  translate(width*0.75,height*0.75);
  
 rotate(spacing +1.75*PI*rotation);
translate(sin(spacing*k*radius)*250,0);
 for (int j=0;j<60;j++){
  // translate(sin(spacing*j*radius)*100, 0);
   
 scale(random(beat.x,beat.y));
rotate(radians(time*2));
strokeWeight(0.2);
rect(j,j,j*6,j*6);
ellipse(j,j,j*9,j*9);
 
 }
 popMatrix();
 
 pushMatrix();
//  translate(width*0.75,height*0.75);
  
 rotate(spacing*rotation+PI/3);
translate(0,sin(spacing*k*radius)*250);
 for (int j=0;j<60;j++){
  // translate(sin(spacing*j*radius)*100, 0);
   
 scale(1.1*random(beat.x,beat.y));
rotate(radians(time*0.5));
strokeWeight(0.2);
rect(j,j,j*6,j*6);
ellipse(j,j,j*9,j*9);
 
 }
 popMatrix();
 

 
 beat= new PVector(0.6,1.1);
 
if (time==25||time<0){
step*=-1;
}

k+=0.02;





angle+=i;
ang+=j;

if(ang>=360){
 // background(0);
//ang=0;
//angle=0;
i=random(6,8);
j=random(1,2);


}


if (radius==0.5){
  
  radius=0;

rInc+=random(0.002);


};

if (rotation==0.2){
  rotation=0;
  rotInc=random(0.005);

}


}

void mousePressed() {
  
    playit = !playit;
    
    if (playit) {

         player.play(); 
 
    } else {
     
     player.stop(); 
      
    }
  
}

void keyPressed(){
if (keyCode==32) {
saveFrame("img#####.jpg");
}
}




