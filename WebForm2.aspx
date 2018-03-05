<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication3.WebForm2" %>

<!DOCTYPE html>
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
    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    var el = document.getElementById('c');
    var ctx = el.getContext('2d');

    ctx.lineWidth = 1;
    ctx.lineJoin = ctx.lineCap = 'round';
    ctx.strokeStyle = 'purple';

    var isDrawing, lastPoint;

    el.onmousedown = function (e) {
        isDrawing = true;
        lastPoint = { x: e.clientX, y: e.clientY };
    };

    el.onmousemove = function (e) {
        if (!isDrawing) return;

        ctx.beginPath();

        ctx.moveTo(lastPoint.x - getRandomInt(0, 2), lastPoint.y - getRandomInt(0, 2));
        ctx.lineTo(e.clientX - getRandomInt(0, 2), e.clientY - getRandomInt(0, 2));
        ctx.stroke();

        ctx.moveTo(lastPoint.x, lastPoint.y);
        ctx.lineTo(e.clientX, e.clientY);
        ctx.stroke();

        ctx.moveTo(lastPoint.x + getRandomInt(0, 2), lastPoint.y + getRandomInt(0, 2));
        ctx.lineTo(e.clientX + getRandomInt(0, 2), e.clientY + getRandomInt(0, 2));
        ctx.stroke();

        lastPoint = { x: e.clientX, y: e.clientY };
    };

    el.onmouseup = function () {
        isDrawing = false;
    };
    </script>
    <h1>BRUSHES</h1>
<p>This is the brush 2.</p>
</body>
</html>
<p>
        <button type="button" onclick="zoomin()"> Zoom In</button>
        <button type="button" onclick="zoomout()"> Zoom Out</button>
    </p>
</body>
</html>
