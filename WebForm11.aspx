﻿<!DOCTYPE html>
<html>
<head>
<title>sushanth</title>
</head>
<body>
<canvas id="c" width="500" height="300">
canvas { border: 1px solid #ccc }
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
    function midPointBtw(p1, p2) {
        return {
            x: p1.x + (p2.x - p1.x) / 2,
            y: p1.y + (p2.y - p1.y) / 2
        };
    }
    function getPattern() {
        var patternCanvas = document.createElement('canvas'),
            dotWidth = 20,
            dotDistance = 5,
            ctx = patternCanvas.getContext('2d');

        patternCanvas.width = 10; patternCanvas.height = 20;
        ctx.fillStyle = 'black';
        ctx.fillRect(0, 0, 5, 20);
        ctx.fillStyle = 'gold';
        ctx.fillRect(5, 0, 10, 20);
        return ctx.createPattern(patternCanvas, 'repeat');
    }

    var el = document.getElementById('c');
    var ctx = el.getContext('2d');

    ctx.lineWidth = 25;
    ctx.lineJoin = ctx.lineCap = 'round';
    ctx.strokeStyle = getPattern();

    var isDrawing, points = [];

    el.onmousedown = function (e) {
        isDrawing = true;
        points.push({ x: e.clientX, y: e.clientY });
    };

    el.onmousemove = function (e) {
        if (!isDrawing) return;

        points.push({ x: e.clientX, y: e.clientY });

        ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);

        var p1 = points[0];
        var p2 = points[1];

        ctx.beginPath();
        ctx.moveTo(p1.x, p1.y);

        for (var i = 1, len = points.length; i < len; i++) {
            var midPoint = midPointBtw(p1, p2);
            ctx.quadraticCurveTo(p1.x, p1.y, midPoint.x, midPoint.y);
            p1 = points[i];
            p2 = points[i + 1];
        }
        ctx.lineTo(p1.x, p1.y);
        ctx.stroke();
    };

    el.onmouseup = function () {
        isDrawing = false;
        points.length = 0;
    };
 </script>
    <h1>BRUSHES</h1>
<p>This is the Double colour line brush 11.</p>
    <p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>
</body>
</html>

