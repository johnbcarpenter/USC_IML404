// basic point shader from https://processing.org/tutorials/pshader/

uniform mat4 projection;
uniform mat4 modelview;

// VBO attributes set by processing
attribute vec4 position;
attribute vec4 color;
attribute vec2 offset;

// outputs from vertex shader (this), inputs to fragment shader
varying vec4 vertColor;

void main() {
  vec4 pos = modelview * position;
  vec4 clip = projection * pos;

  gl_Position = clip + projection * vec4(offset, 0, 0);

  vertColor = color;
}