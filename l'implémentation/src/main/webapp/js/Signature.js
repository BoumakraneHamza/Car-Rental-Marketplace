var  ctx, flag = false,
    prevX = 0,
    currX = 0,
    prevY = 0,
    currY = 0,
    dot_flag = false;

var x = "black",
    y = 2;
canvas = document.getElementById('can');
form = document.querySelector(".signature").querySelector("form");
console.log(form);
saver = form.querySelector("#image");
var bounds = canvas.getBoundingClientRect();
function init() {
    canvas = document.getElementById('can');
    ctx = canvas.getContext("2d");
    w = canvas.width;
    h = canvas.height;

    canvas.addEventListener("mousemove", function (e) {
        findxy('move', e)
    }, false);
    canvas.addEventListener("mousedown", function (e) {
        findxy('down', e)
    }, false);
    canvas.addEventListener("mouseup", function (e) {
        findxy('up', e)
    }, false);
    canvas.addEventListener("mouseout", function (e) {
        findxy('out', e)
    }, false);
}

function draw() {
    ctx.beginPath();
    ctx.moveTo(prevX, prevY);
    ctx.lineTo(currX, currY);
    ctx.strokeStyle = x;
    ctx.lineWidth = y;
    ctx.stroke();
    ctx.closePath();
}

form.addEventListener("submit",(e)=>{
	e.preventDefault();
	var imageurl = canvas.toDataURL("image/png" , 0.9);
	var image = new Image();
	image.src=imageurl;
	saver.value=image.src;
	form.submit();
});
function clearPad(){
	ctx.clearRect(0,0,w,h);
}
function findxy(res, e) {
    if (res == 'down') {
        prevX = currX;
        prevY = currY;
        currX = e.pageX - bounds.left - scrollX;
        currY = e.pageY - bounds.top - scrollY;

        flag = true;
        dot_flag = true;
        if (dot_flag) {
            ctx.beginPath();
            ctx.fillStyle = x;
            ctx.fillRect(currX, currY, 2, 2);
            ctx.closePath();
            dot_flag = false;
        }
    }
    if (res == 'up' || res == "out") {
        flag = false;
    }
    if (res == 'move') {
        if (flag) {
            prevX = currX;
            prevY = currY;
            currX = e.pageX - bounds.left - scrollX;
            currY = e.pageY - bounds.top - scrollY;
            draw();
        }
    }
}
const pad = document.querySelector(".signature");
function show(){
	pad.style.visibility="visible";
}
function hide(){
	pad.style.visibility="hidden";
}