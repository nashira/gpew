precision highp float;
uniform float time;
varying vec2 vCoords;

${noise3d}

float fn(vec3 coords) {
  return snoise(coords * 1.);
}

void main() {
  gl_FragColor = vec4(fn(vec3(vCoords, time)),
    fn(vec3(vCoords.y, time, vCoords.x)),
    fn(vec3(time, vCoords.x, vCoords.y)), 1.);

  // gl_FragColor = vec4(time, time, time, 1.);
  // gl_FragColor = vec4(time, time, time, 1.);
}