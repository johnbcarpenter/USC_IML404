// global attributes automatically set by processing
uniform mat4 projection;
uniform mat4 modelview;

// uniform set in your processing code
uniform float weight;

// VBO attributes automatically set by processing
attribute vec4 position;
attribute vec4 color;
attribute vec2 offset;

// outputs from vertex shader (this), inputs to fragment shader
varying vec4 vertColor;
varying vec2 texCoord;

void main() {
  vec4 pos = modelview * position;
  vec4 clip = projection * pos;
  gl_Position = clip + projection * vec4(offset, 0, 0);
  vertColor = color;

  // // FADE_BY_DISTANCE
  // float camdist = length(pos.xyz/pos.w); // camera distance to [width*0.5, height*0.5, 0]
  // // NOTE: for height = 720, camera eye z = (height/2.0) / ~0.57735 = ~624  
  // const float fade_start_dist = 400.0;
  // const float fade_end_dist = 800.0;
  // const float fade_to = 0.2; // the most faded it gets
  // float attn = smoothstep(fade_end_dist, fade_start_dist, camdist);
  // vertColor.a *= mix(1.0, attn*attn, 1.0 - fade_to);

  texCoord = (vec2(0.5) + offset / weight);
}