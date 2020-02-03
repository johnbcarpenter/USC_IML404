// processing shader tutorial: https://processing.org/tutorials/pshader/

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

// uniform automatically set by processing
uniform sampler2D sprite;

// output from the vertex shader
varying vec4 vertColor;
varying vec2 texCoord;

void main() {
  gl_FragColor = texture2D(sprite, texCoord) * vertColor;
}