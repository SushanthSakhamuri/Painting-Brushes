<!DOCTYPE html>
<html>
<head>
<title>sushanth</title>
</head>
<body>
<canvas id="c" width="500" height="600">
style="border:1px solid #ccc;">
</canvas>
<script>
    function zoomin() {
        var myImg = document.getElementById("c");
        var currWidth = myImg.clientWidth;
        if (currWidth == 700) {
            alert("Maximum zoom-in level reached.");
        } else {
            myImg.style.width = (currWidth + 50) + "px";
        }
    }
    function zoomout() {
        var myImg = document.getElementById("c");
        var currWidth = myImg.clientWidth;
        if (currWidth == 50) {
            alert("Maximum zoom-out level reached.");
        } else {
            myImg.style.width = (currWidth - 50) + "px";
        }
    }
var el = document.getElementById('c');
var ctx = el.getContext('2d');
var isDrawing;

el.onmousedown = function(e) {
  isDrawing = true;
  ctx.lineWidth = 30;
  ctx.lineJoin = ctx.lineCap = 'round';
  ctx.shadowBlur = 60;
  ctx.shadowColor = 'rgb(0, 0, 0)';
  ctx.moveTo(e.clientX, e.clientY);
  ctx.fillstyle='green';
};
el.onmousemove = function(e) {
  if (isDrawing) {
    ctx.lineTo(e.clientX, e.clientY);
    ctx.stroke();
	ctx.fillstyle('GREEN');
  }
};
el.onmouseup = function() {
  isDrawing = false;
};
</script>
<h1>BRUSHES</h1>
<p>This is the brush 1.</p>
    <p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>
</body>
</html>