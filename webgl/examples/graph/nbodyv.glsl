
precision highp float;

const float xsize = #{xsize};
const float ysize = #{ysize};
const float xiter = #{xiter};
const float yiter = #{yiter};
const float ymax = #{ymax};

uniform sampler2D positionTexture;
uniform sampler2D forceTexture;

uniform float xstart;
uniform float ystart;
uniform float dt;

attribute vec2 coords;

varying vec3 vPos;

vec3 bruteForce(vec3 pos) {
  vec3 f = vec3(0.);
  for (float y = yiter; y < ymax; y += ysize) {
    for (float x = xiter; x < 1.0; x += xsize) {
      vec4 otherPosition = texture2D(positionTexture, vec2(x + xstart, y + ystart));
      vec3 diff = otherPosition.xyz - pos.xyz;
      float a = dot(diff, diff) + 0.000001;
      f += diff / a;
    }
  }
  return f * 0.01;
}

void main() {
  vec3 pos = texture2D(positionTexture, coords).xyz;
  vec3 force = texture2D(forceTexture, coords).xyz;

  vec3 f = bruteForce(pos);

  vPos = pos - f * dt + force;

  gl_Position = vec4(coords * 2. - 1., 0.0, 1.0);
}
