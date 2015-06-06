   
// Hold mouse click to disable the filter temporarily

// The videoclip is from NASA: http://youtu.be/CBwdZ1yloHA

import processing.video.*;
Movie movie;

// Create the shader object
PShader ntsc;

void setup() {

  size(640, 360, P2D);
 
  // Load and play the video in a loop
  movie = new Movie(this, "iss.mov");
  movie.loop();
  
  // Load and configure the shader
  ntsc = loadShader("ntsc.glsl");
  ntsc.set("sketchSize", float(width), float(height));

}     

// Read each new frame of the movie
void movieEvent(Movie m) {
  m.read();
}

void draw() {  

  image(movie, 0, 0, width, height);

  if( !mousePressed ) {
    filter(ntsc);
  }
  
}
