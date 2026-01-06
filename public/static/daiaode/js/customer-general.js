/** @format */
window.onload = function () {
    var arr = ['君科云电商'];
    var index = Math.floor(Math.random() * arr.length);
    document.getElementById('insertContent').innerHTML = '技术支持：<a href="https://www.junke158.com" target="_blank">' + arr[index] + '</a>';
};
