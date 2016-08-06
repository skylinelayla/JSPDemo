/**
 * Created by SHIKUN on 2016/8/6.
 */
var square = function (x) {
    return x * x
};
var o = {a: 1, b: {c: 1}};
var q = o.a;
var d = o.b.c;

var o2 = Object.create(null);
var o3 = Object.create(Object.prototype);
o = {x: 1, y: {z: [false, null, ""]}};
s = JSON.stringify(o);

window.location("http://www.baidu.com");
