var Octree;

(function () {
  Octree = function () {

  }

  Octree.prototype.getTextureSize = function (cubeSize) {
    var d = Utils.getPotSize(cubeSize);

    return {
      size: cubeSize,
      slicesPerRow: d.w,
      numRows: d.h,
      width: d.w * cubeSize,
      height: d.h * cubeSize
    }
  }

  Octree.prototype.slice = function (size, lod) {
    var m = Math.pow(2, lod);
    var lsize = size / m;
    for (var i = 0; i < 1; i+=1/32) {
      var s = Math.floor(i * lsize);
      var s1 = s + 1;
      console.log(i, s * m, s1 * m - 1)
    }
  }


}());