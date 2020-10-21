/* common_util.js */
var _globalToatl = 0;
var _timeout = 10000;
function showGlobalLoading() {
	$("#tips").children("span").removeClass().addClass("info");
	$("#tips").show();
	_globalToatl++;
}
function showGlobalLoading(tips) {
	$("#tips").children("span").removeClass().addClass("info");
	$("#tips").children("span").text(tips);
	_globalToatl++;
	$("#tips").show();
}
function hideGlobalLoading() {
	_globalToatl--;
	if (_globalToatl <= 0)
		$("#tips").hide();
}

_isIE = false;
_isIE6 = false;
if (window.VBArray && !window.XMLHttpRequest)
	_isIE6 = true;
if (!!(document.all && navigator.userAgent.indexOf('Opera') === -1))
	_isIE = true;
function inputCheck(event, callback) {
	if (event.keyCode == 13) {
		callback();
	}
}
function error(obj, msg, className) {
	if (!className)
		className = '';
	var dialog = "<span class='alert alert-error " + className + "'>"
			+ "<a class='close' href='#'>&times;</a>" + msg + "</span>";
	obj.html(dialog);
	obj.show();
}
function autoError(obj, msg) {
	var dialog = "<span class='alert alert-error'>" + msg + "</span>";
	obj.html(dialog);
	obj.show();
	setTimeout(function() {
		obj.fadeOut("slow");
	}, 1000);
}
function info(obj, msg) {
	var dialog = "<span class='info'>" + msg + "</span>";
	obj.show();
	obj.html(dialog);
}
function autoInfo(obj, msg) {
	var dialog = "<span class='info'>" + msg + "</span>";
	obj.html(dialog);
	obj.show();
	setTimeout(function() {
		obj.fadeOut("slow");
	}, 1000);
}
function hideInfo(obj) {
	obj.html('');
}
function sysInfo(message) {
	autoInfo($("#tips"), message);
}
function sysError(message) {
	autoError($("#tips"), message);
}
jQuery.fn.limit = function() {
	var self = $("p[limit]");
	self.each(function() {
		var objString = jQuery.trim($(this).text());
		var objLength = objString.length;
		var num = $(this).attr("limit");
		if (objLength > num) {
			$(this).attr("title", objString);
			objString = $(this).text(objString.substring(0, num) + "...");
		}
	});
};
function autoSize(imgD, W, H, M) {
	if (typeof (imgD) != "object" && typeof (imgD) == "string") {
		imgD = document.getElementById(imgD);
	}
	var tImg = new Image();
	tImg.src = imgD.src;
	var w = imgD.width;
	var h = imgD.height;
	var wn = 0, hn = 0;
	if (w > 0 && h > 0 && W > 0 && H > 0) {
		if (w / h >= W / H) {
			if (w > W) {
				wn = W;
				hn = (h * W) / w;
			} else {
				wn = w;
				hn = h;
			}
		} else {
			if (h > H) {
				wn = (w * H) / h;
				hn = H;
			} else {
				wn = w;
				hn = h;
			}
		}
		if (typeof M == "undefined") {
			imgD.style.marginTop = (H - hn) / 2 + 'px';
		} else if (M > -1) {
			imgD.style.marginTop = M + (H - hn) / 2 + 'px';
			imgD.style.marginLeft = M + (W - wn) / 2 + 'px';
		}
		imgD.style.width = wn + "px";
		imgD.style.height = hn + "px";
	}
	return imgD;
}
function returnAutoSize(imgD, W, H, M) {
	var sHeight = imgD.style.height;
	imgD.style.height = '';
	var sWidth = imgD.style.width;
	imgD.style.width = '';
	if (typeof (imgD) != "object" && typeof (imgD) == "string") {
		imgD = document.getElementById(imgD);
	}
	var w = imgD.width;
	var h = imgD.height;
	var wn = 0, hn = 0;
	var marginTop = 0, marginLeft = 0;
	if (w > 0 && h > 0 && W > 0 && H > 0) {
		if (w / h >= W / H) {
			if (w > W) {
				wn = W;
				hn = (h * W) / w;
			} else {
				wn = w;
				hn = h;
			}
		} else {
			if (h > H) {
				wn = (w * H) / h;
				hn = H;
			} else {
				wn = w;
				hn = h;
			}
		}
		if (typeof M == "undefined") {
			marginTop = (H - hn) / 2 + 'px';
			imgD.style.marginTop = marginTop;
		} else if (M > -1) {
			marginTop = M + (H - hn) / 2 + 'px';
			marginLeft = M + (W - wn) / 2 + 'px';
			imgD.style.marginTop = marginTop;
			imgD.style.marginLeft = marginLeft;
		}
	} else {
		return {
			"width" : w,
			"height" : h,
			'margintop' : (W - w) / 2 + "px",
			'marginleft' : (H - h) / 2 + "px"
		};
	}
	imgD.style.height = sHeight;
	imgD.style.width = sWidth;
	return {
		"width" : wn,
		"height" : hn,
		'margintop' : marginTop,
		'marginleft' : marginLeft
	};
}
Date.prototype.format = function(format) {
	function getWeekDay(weekNum) {
		var weekDay = "周";
		switch (weekNum) {
		case 1:
			weekDay += "一";
			break;
		case 2:
			weekDay += "二";
			break;
		case 3:
			weekDay += "三";
			break;
		case 4:
			weekDay += "四";
			break;
		case 5:
			weekDay += "五";
			break;
		case 6:
			weekDay += "六";
			break;
		default:
			weekDay += "日";
			break;
		}
		return weekDay;
	}
	var o = {
		"M+" : (this.getMonth() + 1),
		"d+" : this.getDate(),
		"h+" : this.getHours(),
		"m+" : this.getMinutes(),
		"s+" : this.getSeconds(),
		"w+" : getWeekDay(this.getDay()),
		"q+" : Math.floor((this.getMonth() + 3) / 3),
		"S" : this.getMilliseconds()
	};
	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
String.prototype.ltrim = function() {
	return this.replace(/(^\s*)/g, "");
};
String.prototype.rtrim = function() {
	return this.replace(/(\s*$)/g, "");
};
function isEmailAddress(emailAddress) {
	var pattern = new RegExp(
			/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	return pattern.test(emailAddress);
};
Date.prototype.getChinaWeekName = function() {
	switch (this.getDay()) {
	case 1:
		return '星期一';
		break;
	case 2:
		return '星期二';
		break;
	case 3:
		return '星期三';
		break;
	case 4:
		return '星期四';
		break;
	case 5:
		return '星期五';
		break;
	case 6:
		return '星期六';
		break;
	case 0:
		return '星期日';
		break;
	}
};
function htmlEscape(s) {
	return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
			.replace(/'/g, '&#039;').replace(/"/g, '&quot;')
			.replace(/\n/g, ' ').replace(/\r\n/g, ' ');
}
function decodeHTML(source) {
	var str = String(source).replace(/&amp;/g, '&').replace(/&gt;/g, '>')
			.replace(/&quot;/g, '\"').replace(/&ldquo;/g, '“').replace(
					/&#([\d]+);/g, "'");
	return str;
}

/* common.js */

$.fn.extend({
	bindState : function(type, className, isBubble) {
		var $this = this;
		if (type == undefined) {
			type = 1;
		}
		if (className == undefined) {
			className = "";
		} else {
			className = className + "-";
		}
		if (isBubble == undefined) {
			isBubble = false;
		}
		this.hover(function() {
			$(this).addClass(className + "hover");
		}, function() {
			$(this).removeClass(className + "hover");
		});
		if (type == 1 || type == "checkbox") {
			$(this).click(
					function(e) {
						$("." + className + "on").not($(this)).removeClass(
								className + "on");
						$(this).toggleClass(className + "on");
						if (isBubble) {
							e.stopPropagation();
						}
					});
		} else if (type == 2 || type == "radio") {
			$(this).click(function() {
				$this.removeClass(className + "on");
				$(this).addClass(className + "on");
			});
		} else if (type == 3 || type == "toggle") {
			$(this).click(function() {
				var hasOn = $(this).hasClass(className + "on");
				$this.removeClass(className + "on");
				if (hasOn) {
					$(this).removeClass(className + "on");
				} else {
					$(this).addClass(className + "on");
				}
			});
		}
	}
});
ArrayindexOf = function(n, arr) {
	var arrayStr = arr.join("#1#");
	return arrayStr.indexOf(n);
};

/* wnl.js */

var JSON = function() {
	var m = {
		'\b' : '\\b',
		'\t' : '\\t',
		'\n' : '\\n',
		'\f' : '\\f',
		'\r' : '\\r',
		'"' : '\\"',
		'\\' : '\\\\'
	}, s = {
		'boolean' : function(x) {
			return String(x);
		},
		number : function(x) {
			return isFinite(x) ? String(x) : 'null';
		},
		string : function(x) {
			if (/["\\\x00-\x1f]/.test(x)) {
				x = x.replace(/([\x00-\x1f\\"])/g, function(a, b) {
					var c = m[b];
					if (c) {
						return c;
					}
					c = b.charCodeAt();
					return '\\u00' + Math.floor(c / 16).toString(16)
							+ (c % 16).toString(16);
				});
			}
			return '"' + x + '"';
		},
		object : function(x) {
			if (x) {
				var a = [], b, f, i, l, v;
				if (x instanceof Array) {
					a[0] = '[';
					l = x.length;
					for (i = 0; i < l; i += 1) {
						v = x[i];
						f = s[typeof v];
						if (f) {
							v = f(v);
							if (typeof v == 'string') {
								if (b) {
									a[a.length] = ',';
								}
								a[a.length] = v;
								b = true;
							}
						}
					}
					a[a.length] = ']';
				} else if (x instanceof Object) {
					a[0] = '{';
					for (i in x) {
						v = x[i];
						f = s[typeof v];
						if (f) {
							v = f(v);
							if (typeof v == 'string') {
								if (b) {
									a[a.length] = ',';
								}
								a.push(s.string(i), ':', v);
								b = true;
							}
						}
					}
					a[a.length] = '}';
				} else {
					return;
				}
				return a.join('');
			}
			return 'null';
		}
	};
	return {
		copyright : '(c)2005 JSON.org',
		stringify : function(v) {
			var f = s[typeof v];
			if (f) {
				v = f(v);
				if (typeof v == 'string') {
					return v;
				}
			}
			return null;
		},
		parse : function(text) {
			try {
				return !(/[^,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t]/.test(text
						.replace(/"(\\.|[^"\\])*"/g, '')))
						&& eval('(' + text + ')');
			} catch (e) {
				return false;
			}
		}
	};
}();
var lunarInfo = new Array(0x4bd8, 0x4ae0, 0xa570, 0x54d5, 0xd260, 0xd950,
		0x5554, 0x56af, 0x9ad0, 0x55d2, 0x4ae0, 0xa5b6, 0xa4d0, 0xd250, 0xd295,
		0xb54f, 0xd6a0, 0xada2, 0x95b0, 0x4977, 0x497f, 0xa4b0, 0xb4b5, 0x6a50,
		0x6d40, 0xab54, 0x2b6f, 0x9570, 0x52f2, 0x4970, 0x6566, 0xd4a0, 0xea50,
		0x6a95, 0x5adf, 0x2b60, 0x86e3, 0x92ef, 0xc8d7, 0xc95f, 0xd4a0, 0xd8a6,
		0xb55f, 0x56a0, 0xa5b4, 0x25df, 0x92d0, 0xd2b2, 0xa950, 0xb557, 0x6ca0,
		0xb550, 0x5355, 0x4daf, 0xa5b0, 0x4573, 0x52bf, 0xa9a8, 0xe950, 0x6aa0,
		0xaea6, 0xab50, 0x4b60, 0xaae4, 0xa570, 0x5260, 0xf263, 0xd950, 0x5b57,
		0x56a0, 0x96d0, 0x4dd5, 0x4ad0, 0xa4d0, 0xd4d4, 0xd250, 0xd558, 0xb540,
		0xb6a0, 0x95a6, 0x95bf, 0x49b0, 0xa974, 0xa4b0, 0xb27a, 0x6a50, 0x6d40,
		0xaf46, 0xab60, 0x9570, 0x4af5, 0x4970, 0x64b0, 0x74a3, 0xea50, 0x6b58,
		0x5ac0, 0xab60, 0x96d5, 0x92e0, 0xc960, 0xd954, 0xd4a0, 0xda50, 0x7552,
		0x56a0, 0xabb7, 0x25d0, 0x92d0, 0xcab5, 0xa950, 0xb4a0, 0xbaa4, 0xad50,
		0x55d9, 0x4ba0, 0xa5b0, 0x5176, 0x52bf, 0xa930, 0x7954, 0x6aa0, 0xad50,
		0x5b52, 0x4b60, 0xa6e6, 0xa4e0, 0xd260, 0xea65, 0xd530, 0x5aa0, 0x76a3,
		0x96d0, 0x4afb, 0x4ad0, 0xa4d0, 0xd0b6, 0xd25f, 0xd520, 0xdd45, 0xb5a0,
		0x56d0, 0x55b2, 0x49b0, 0xa577, 0xa4b0, 0xaa50, 0xb255, 0x6d2f, 0xada0,
		0x4b63, 0x937f, 0x49f8, 0x4970, 0x64b0, 0x68a6, 0xea5f, 0x6b20, 0xa6c4,
		0xaaef, 0x92e0, 0xd2e3, 0xc960, 0xd557, 0xd4a0, 0xda50, 0x5d55, 0x56a0,
		0xa6d0, 0x55d4, 0x52d0, 0xa9b8, 0xa950, 0xb4a0, 0xb6a6, 0xad50, 0x55a0,
		0xaba4, 0xa5b0, 0x52b0, 0xb273, 0x6930, 0x7337, 0x6aa0, 0xad50, 0x4b55,
		0x4b6f, 0xa570, 0x54e4, 0xd260, 0xe968, 0xd520, 0xdaa0, 0x6aa6, 0x56df,
		0x4ae0, 0xa9d4, 0xa4d0, 0xd150, 0xf252, 0xd520);
var solarMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var Gan = new Array("甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸");
var Zhi = new Array("子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥");
var Animals = new Array("鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗",
		"猪");
var solarTerm = new Array("小寒", "大寒", "立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏",
		"小满", "芒种", "夏至", "小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬",
		"小雪", "大雪", "冬至");
var sTermInfo = new Array(0, 21208, 42467, 63836, 85337, 107014, 128867,
		150921, 173149, 195551, 218072, 240693, 263343, 285989, 308563, 331033,
		353350, 375494, 397447, 419210, 440795, 462224, 483532, 504758);
var nStr1 = new Array('日', '一', '二', '三', '四', '五', '六', '七', '八', '九', '十');
var nStr2 = new Array('初', '十', '廿', '卅', '□');
var monthName = new Array("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL",
		"AUG", "SEP", "OCT", "NOV", "DEC");
var cmonthName = new Array('正', '二', '三', '四', '五', '六', '七', '八', '九', '十',
		'十一', '腊');
var sFtv = new Array("0101*元旦", "0214 情人节", "0308 妇女节", "0312 植树节", "0401 愚人节",
		"0422 地球日", "0501 劳动节", "0504 青年节", "0531 无烟日", "0601 儿童节", "0606 爱眼日",
		"0701 建党日", "0801 建军节", "0910 教师节", "1001*国庆节", "1031 万圣节", "1111 光棍节",
		"1201 艾滋病日", "1224 平安夜", "1225 圣诞节");
var wFtv = new Array("0520 母亲节", "0630 父亲节", "1144 感恩节");
var lFtv = new Array("0101*春节", "0115 元宵节", "0202 龙抬头", "0505 端午节", "0707 七夕",
		"0715 中元节", "0815 中秋节", "0909 重阳节", "1208 腊八节", "1223 小年", "0100*除夕");
function lYearDays(y) {
	var i, sum = 348;
	for (i = 0x8000; i > 0x8; i >>= 1)
		sum += (lunarInfo[y - 1900] & i) ? 1 : 0;
	return (sum + leapDays(y));
}
function leapDays(y) {
	if (leapMonth(y))
		return ((lunarInfo[y - 1899] & 0xf) == 0xf ? 30 : 29);
	else
		return (0);
}
function leapMonth(y) {
	var lm = lunarInfo[y - 1900] & 0xf;
	return (lm == 0xf ? 0 : lm);
}
function monthDays(y, m) {
	return ((lunarInfo[y - 1900] & (0x10000 >> m)) ? 30 : 29);
}
function Lunar(objDate) {
	var i, leap = 0, temp = 0;
	var offset = (Date.UTC(objDate.getFullYear(), objDate.getMonth(), objDate
			.getDate()) - Date.UTC(1900, 0, 31)) / 86400000;
	for (i = 1900; i < 2100 && offset > 0; i++) {
		temp = lYearDays(i);
		offset -= temp;
	}
	if (offset < 0) {
		offset += temp;
		i--;
	}
	this.year = i;
	leap = leapMonth(i);
	this.isLeap = false;
	for (i = 1; i < 13 && offset > 0; i++) {
		if (leap > 0 && i == (leap + 1) && this.isLeap == false) {
			--i;
			this.isLeap = true;
			temp = leapDays(this.year);
		} else {
			temp = monthDays(this.year, i);
		}
		if (this.isLeap == true && i == (leap + 1))
			this.isLeap = false;
		offset -= temp;
	}
	if (offset == 0 && leap > 0 && i == leap + 1)
		if (this.isLeap) {
			this.isLeap = false;
		} else {
			this.isLeap = true;
			--i;
		}
	if (offset < 0) {
		offset += temp;
		--i;
	}
	this.month = i;
	this.day = offset + 1;
}
function getSolarDate(lyear, lmonth, lday, isLeap) {
	var offset = 0;
	for (var i = 1900; i < lyear; i++) {
		offset += lYearDays(i);
	}
	for (var i = 1; i < lmonth; i++) {
		if (i == leapMonth(lyear)) {
			offset += leapDays(lyear);
		}
		offset += monthDays(lyear, i);
	}
	if (isLeap) {
		offset += monthDays(lyear, i);
	}
	offset += parseInt(lday) - 1;
	var baseDate = new Date(1900, 0, 31);
	var solarDate = new Date(baseDate.valueOf() + offset * 86400000);
	return solarDate;
}
function solarDays(y, m) {
	if (m == 1)
		return (((y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0)) ? 29 : 28);
	else
		return (solarMonth[m]);
}
function cyclical(num) {
	return (Gan[num % 10] + Zhi[num % 12]);
}
function calElement(sYear, sMonth, sDay, week, lYear, lMonth, lDay, isLeap,
		cYear, cMonth, cDay, cMnum, cDnum) {
	this.isToday = false;
	this.sYear = sYear;
	this.sMonth = sMonth;
	this.sDay = sDay;
	this.week = week;
	this.lYear = lYear;
	this.lMonth = lMonth;
	this.lDay = lDay;
	this.isLeap = isLeap;
	this.cYear = cYear;
	this.cMonth = cMonth;
	this.cDay = cDay;
	this.color = '';
	this.lunarFestival = '';
	this.solarFestival = '';
	this.solarTerms = '';
	this.cMnumber = cMnum;
	this.cDnumber = cDnum;
}
function sTerm(y, n) {
	var offDate = new Date((31556925974.7 * (y - 1900) + sTermInfo[n] * 60000)
			+ Date.UTC(1900, 0, 6, 2, 5));
	return (offDate.getUTCDate());
}
function calendar(y, m) {
	var sDObj, lDObj, lY, lM, lD = 1, lL, lX = 0, tmp1, tmp2, tmp3;
	var cY, cM, cD;
	var lDPOS = new Array(3);
	var n = 0;
	var firstLM = 0;
	sDObj = new Date(y, m, 1, 0, 0, 0, 0);
	this.length = solarDays(y, m);
	this.firstWeek = sDObj.getDay();
	if (m < 2)
		cY = cyclical(y - 1900 + 36 - 1);
	else
		cY = cyclical(y - 1900 + 36);
	var term2 = sTerm(y, 2);
	var firstNode = sTerm(y, m * 2);
	var cMnum = (y - 1900) * 12 + m + 12;
	cM = cyclical(cMnum);
	var dayCyclical = Date.UTC(y, m, 1, 0, 0, 0, 0) / 86400000 + 25567 + 10;
	for (var i = 0; i < this.length; i++) {
		if (lD > lX) {
			sDObj = new Date(y, m, i + 1);
			lDObj = new Lunar(sDObj);
			lY = lDObj.year;
			lM = lDObj.month;
			lD = lDObj.day;
			lL = lDObj.isLeap;
			lX = lL ? leapDays(lY) : monthDays(lY, lM);
			if (n == 0)
				firstLM = lM;
			lDPOS[n++] = i - lD + 1;
		}
		if (m == 1 && (i + 1) == term2)
			cY = cyclical(y - 1900 + 36);
		if ((i + 1) == firstNode)
			cM = cyclical((y - 1900) * 12 + m + 13);
		var cDnum = dayCyclical + i;
		if ((i + 1) >= firstNode) {
			cMnum = (y - 1900) * 12 + m + 13;
		}
		cD = cyclical(cDnum);
		this[i] = new calElement(y, m + 1, i + 1,
				nStr1[(i + this.firstWeek) % 7], lY, lM, lD++, lL, cY, cM, cD,
				cMnum, cDnum);
	}
	tmp1 = sTerm(y, m * 2) - 1;
	tmp2 = sTerm(y, m * 2 + 1) - 1;
	this[tmp1].solarTerms = solarTerm[m * 2];
	this[tmp2].solarTerms = solarTerm[m * 2 + 1];
	for (i in sFtv) {
		if (sFtv[i].length != 1) {

			if (sFtv[i].match(/^(\d{2})(\d{2})([\s\*])(.+)$/)) {
				if (Number(RegExp.$1) == (m + 1)) {
					this[Number(RegExp.$2) - 1].solarFestival += RegExp.$4
							+ ' ';
					if (RegExp.$3 == '*')
						this[Number(RegExp.$2) - 1].color = 'red';
				}
			}
		}
	}
	for (i in wFtv)
		if (wFtv[i].length != 1)
			if (wFtv[i].match(/^(\d{2})(\d)(\d)([\s\*])(.+)$/))
				if (Number(RegExp.$1) == (m + 1)) {
					tmp1 = Number(RegExp.$2);
					tmp2 = Number(RegExp.$3);
					if (tmp1 < 5)
						this[((this.firstWeek > tmp2) ? 7 : 0) + 7 * (tmp1 - 1)
								+ tmp2 - this.firstWeek].solarFestival += RegExp.$5
								+ ' ';
					else {
						tmp1 -= 5;
						tmp3 = (this.firstWeek + this.length - 1) % 7;
						this[this.length - tmp3 - 7 * tmp1 + tmp2
								- (tmp2 > tmp3 ? 7 : 0) - 1].solarFestival += RegExp.$5
								+ ' ';
					}
				}
	for (i in lFtv)
		if (lFtv[i].length != 1)
			if (lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
				tmp1 = Number(RegExp.$1) - firstLM;
				if (tmp1 == -11)
					tmp1 = 1;
				if (tmp1 >= 0 && tmp1 < n) {
					tmp2 = lDPOS[tmp1] + Number(RegExp.$2) - 1;
					if (tmp2 >= 0 && tmp2 < this.length
							&& this[tmp2].isLeap != true) {
						this[tmp2].lunarFestival += RegExp.$4 + ' ';
						if (RegExp.$3 == '*')
							this[tmp2].color = 'red';
					}
				}
			}
}
function easter(y) {
	var term2 = sTerm(y, 5);
	var dayTerm2 = new Date(Date.UTC(y, 2, term2, 0, 0, 0, 0));
	var lDayTerm2 = new Lunar(dayTerm2);
	if (lDayTerm2.day < 15)
		var lMlen = 15 - lDayTerm2.day;
	else
		var lMlen = (lDayTerm2.isLeap ? leapDays(y) : monthDays(y,
				lDayTerm2.month))
				- lDayTerm2.day + 15;
	var l15 = new Date(dayTerm2.getTime() + 86400000 * lMlen);
	var dayEaster = new Date(l15.getTime() + 86400000 * (7 - l15.getUTCDay()));
	this.m = dayEaster.getUTCMonth();
	this.d = dayEaster.getUTCDate();
}
function cDay(d) {
	var s;
	switch (d) {
	case 10:
		s = '初十';
		break;
	case 20:
		s = '二十';
		break;
	break;
case 30:
	s = '三十';
	break;
break;
default:
s = nStr2[Math.floor(d / 10)];
s += nStr1[d % 10];
}
return (s);
}
var worktime = {};
worktime.years = [ 2011, 2012, 2013 ];
worktime.y2011 = JSON
.parse('{"d0402":{"w":"班"},"d0403":{"w":"假"},"d0404":{"w":"假"},"d0405":{"w":"假"},"d0430":{"w":"假"},"d0501":{"w":"假"},"d0502":{"w":"假"},"d0604":{"w":"假"},"d0605":{"w":"假"},"d0606":{"w":"假"},"d0910":{"w":"假"},"d0911":{"w":"假"},"d0912":{"w":"假"},"d1001":{"w":"假"},"d1002":{"w":"假"},"d1003":{"w":"假"},"d1004":{"w":"假"},"d1005":{"w":"假"},"d1006":{"w":"假"},"d1007":{"w":"假"},"d1008":{"w":"班"},"d1009":{"w":"班"},"d1231":{"w":"班"}}');
worktime.y2011.workRestStr = 'd0402 d0403 d0404 d0405 d0430 d0501 d0502 d0604 d0605 d0606 d0910 d0911 d0912 d1001 d1002 d1003 d1004 d1005 d1006 d1007 d1008 d1009 d1231';
worktime.y2012 = JSON
.parse('{"d0101":{"w":"假"},"d0102":{"w":"假"},"d0103":{"w":"假"},"d0121":{"w":"班"},"d0122":{"w":"假"},"d0123":{"w":"假"},"d0124":{"w":"假"},"d0125":{"w":"假"},"d0126":{"w":"假"},"d0127":{"w":"假"},"d0128":{"w":"假"},"d0129":{"w":"班"},"d0331":{"w":"班"},"d0401":{"w":"班"},"d0402":{"w":"假"},"d0403":{"w":"假"},"d0404":{"w":"假"},"d0428":{"w":"班"},"d0429":{"w":"假"},"d0430":{"w":"假"},"d0501":{"w":"假"},"d0622":{"w":"假"},"d0623":{"w":"假"},"d0624":{"w":"假"},"d0929":{"w":"班"},"d0930":{"w":"假"},"d1001":{"w":"假"},"d1002":{"w":"假"},"d1003":{"w":"假"},"d1004":{"w":"假"},"d1005":{"w":"假"},"d1006":{"w":"假"},"d1007":{"w":"假"}}');
worktime.y2012.workRestStr = 'd0101 d0102 d0103 d0121 d0122 d0123 d0124 d0125 d0126 d0127 d0128 d0129 d0331 d0401 d0402 d0403 d0404 d0428 d0429 d0430 d0501 d0622 d0623 d0624 d0929 d0930 d1001 d1002 d1003 d1004 d1005 d1006 d1007';
worktime.y2013 = JSON
.parse('{"d0101":{"w":"假"},"d0102":{"w":"假"},"d0103":{"w":"假"},"d0105":{"w":"班"},"d0106":{"w":"班"},"d0209":{"w":"假"},"d0210":{"w":"假"},"d0211":{"w":"假"},"d0212":{"w":"假"},"d0213":{"w":"假"},"d0214":{"w":"假"},"d0215":{"w":"假"},"d0216":{"w":"班"},"d0217":{"w":"班"},"d0404":{"w":"假"},"d0405":{"w":"假"},"d0406":{"w":"假"},"d0407":{"w":"班"},"d0427":{"w":"班"},"d0428":{"w":"班"},"d0429":{"w":"假"},"d0430":{"w":"假"},"d0501":{"w":"假"},"d0608":{"w":"班"},"d0609":{"w":"班"},"d0610":{"w":"假"},"d0611":{"w":"假"},"d0612":{"w":"假"},"d0919":{"w":"假"},"d0920":{"w":"假"},"d0921":{"w":"假"},"d0922":{"w":"班"},"d0929":{"w":"班"},"d1001":{"w":"假"},"d1002":{"w":"假"},"d1003":{"w":"假"},"d1004":{"w":"假"},"d1005":{"w":"假"},"d1006":{"w":"假"},"d1007":{"w":"假"},"d1012":{"w":"班"}}');
worktime.y2013.workRestStr = 'd0101 d0102 d0103 d0105 d0106 d0209 d0210 d0211 d0212 d0213 d0214 d0215 d0216 d0217 d0404 d0405 d0406 d0407 d0427 d0428 d0429 d0430 d0501 d0608 d0609 d0610 d0611 d0612 d0919 d0920 d0921 d0922 d0929 d1001 d1002 d1003 d1004 d1005 d1006 d1007 d1012';
var qmj = "2013/04/0" + sTerm(new Date().getFullYear(), 6);
var festival_main = {
"2013/01/01" : "元旦",
"*2013/01/01" : "春节",
"2013/04/04" : "清明节",
"2013/05/01" : "劳动节",
"*2013/05/05" : "端午节",
"*2013/08/15" : "中秋节",
"2013/10/01" : "国庆节"
};
if (!festival_main[qmj]) {
delete festival_main["2013/04/04"];
festival_main[qmj] = "清明节";
}
$.dom = function(elementId) {
return document.getElementById(elementId);
};
function StringBuffer() {
this._strings = new Array();
};
StringBuffer.prototype.append = function(str) {
this._strings.push(str);
return this;
};
StringBuffer.prototype.toString = function() {
var str = arguments.length == 0 ? '' : arguments[0];
return this._strings.join(str);
};
String.prototype.leftpad = function(len, str) {
if (!str) {
str = '0';
}
var s = '';
for (var i = 0; i < len - this.length; i++) {
s += str;
}
return s + this;
};
String.prototype.htmlspecialchars = function() {
return this;
};
function getMonthKey(year, month) {
return year.toString() + (month + 1).toString().leftpad(2);
}
function getDateKey(date) {
return date.getFullYear().toString() + "-"
	+ (date.getMonth() + 1).toString().leftpad(2) + "-"
	+ date.getDate().toString().leftpad(2);
}
function is_leap_year(cur_year) {
if (cur_year % 400 == 0 || (cur_year % 100 != 0 && cur_year % 4 == 0))
return 1;
return 0;
}
function getDaysByMonth(date) {
var days = [ [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ],
	[ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ] ];
return days[is_leap_year(date.getFullYear())][date.getMonth()];
}
function dateDiff(now, date) {
var diff = dateDiffDays(now, date);
if (diff == 0)
return "今天";
else if (diff < 0)
return (0 - diff) + "天前";
else
return diff + "天后";
}
function dateDiffDays(now, date) {
var n = new Date(now.getFullYear(), now.getMonth(), now.getDate());
var d = new Date(date.getFullYear(), date.getMonth(), date.getDate());
var diff = parseInt((d - n) / (24 * 60 * 60 * 1000));
return diff;
}
var utils = {
getEvent : function(ev) {
return window.event ? window.event : (ev ? ev : null);
},
getMousePosition : function(ev) {
var evt = this.getEvent(ev);
if (evt.pageX || evt.pageY) {
return {
	x : evt.pageX,
	y : evt.pageY
};
}
return {
x : evt.clientX + document.documentElement.scrollLeft
	- document.documentElement.clientLeft,
y : evt.clientY + document.documentElement.scrollTop
	- document.documentElement.clientTop
};
},
getClientWidth : function() {
return $.browser.msie ? ieBody.clientWidth : window.innerWidth;
},
getClientHeight : function() {
return $.browser.msie ? ieBody.clientHeight : window.innerHeight;
},
getRandomColor : function() {
var index = Math.round(Math.random() * (colors.length - 1));
return {
index : index,
value : colors[index]
};
},
getOffsetXY : function(obj, parentId) {
var pos = {};
if (parentId) {
pos = $(obj).position();
return {
	x : pos.left,
	y : pos.top
};
}
pos = $(obj).offset();
return {
x : pos.left,
y : pos.top
};
},
hideDialog : function(id) {
for (var i = 0; i < id.length; i++) {
$("#" + id[i]).hide();
$(document).unbind("mousedown." + id[i]);
}
},
mousedown_hide_ele : function(id, parent_id, descard_id) {
$(document).bind("mousedown." + id, function(r) {
var p = r.target;
var q = document.getElementById(id);
while (true) {
	if (p == q) {
		return true;
	} else {
		try {
			if (p.id == parent_id) {
				$(document).unbind("mousedown." + id);
				$("#" + id).hide();
				return false;
			} else {
				if (p.id == descard_id) {
					return;
				}
				p = $(p).parent()[0];
			}
		} catch (e) {
			return false;
		}
	}
}
});
}
};
var cacheMgr = {
cldCache : {},
getCld : function(year, month) {
var key = getMonthKey(year, month);
var cld = this.cldCache[key];
if (typeof cld == 'undefined') {
cld = new calendar(year, month);
this.cldCache[key] = cld;
}
return cld;
}
};
var calwnl = {};
calwnl.date = {
date_part : function(date) {
date.setHours(0);
date.setMinutes(0);
date.setSeconds(0);
date.setMilliseconds(0);
return date;
},
month_day : function(date) {
var d = date || new Date();
return d.getDate();
},
time_part : function(date) {
return (date.valueOf() / 1000 - date.getTimezoneOffset() * 60) % 86400;
},
week_start : function(date, start_on_monday) {
var shift = date.getDay();
if (start_on_monday) {
if (shift == 0)
	shift = 6;
else
	shift--;
}
return this.date_part(this.add(date, -1 * shift, "day"));
},
month_start : function(date) {
date.setDate(1);
return this.date_part(date);
},
month_view_start : function(date, start_on_monday) {
return this.week_start(this.month_start(date), start_on_monday);
},
year_start : function(date) {
date.setMonth(0);
return this.month_start(date);
},
day_start : function(date) {
return this.date_part(date);
},
add : function(date, inc, mode) {
var ndate = new Date(date.valueOf());
switch (mode) {
case "day":
ndate.setDate(ndate.getDate() + inc);
break;
case "week":
ndate.setDate(ndate.getDate() + 7 * inc);
break;
case "month":
ndate.setMonth(ndate.getMonth() + inc);
break;
case "year":
ndate.setYear(ndate.getFullYear() + inc);
break;
case "hour":
ndate.setHours(ndate.getHours() + inc);
break;
case "minute":
ndate.setMinutes(ndate.getMinutes() + inc);
break;
default:
return defaults.date["add_" + mode](date, inc, mode);
}
return ndate;
},
to_fixed : function(num) {
if (num < 10)
return "0" + num;
return num;
},
copy : function(date) {
return new Date(date.valueOf());
},
getChinaNum : function(Num) {
var monthEn;
switch (Num) {
case 1:
monthEn = "一";
break;
case 2:
monthEn = "二";
break;
case 3:
monthEn = "三";
break;
case 4:
monthEn = "四";
break;
case 5:
monthEn = "五";
break;
case 6:
monthEn = "六";
break;
case 7:
monthEn = "七";
break;
case 8:
monthEn = "八";
break;
case 9:
monthEn = "九";
break;
case 10:
monthEn = "十";
break;
case 11:
monthEn = "十一";
break;
case 12:
monthEn = "腊";
break;
}
return monthEn;
},
getLundarMD : function(md, split) {
var month = '';
var day = '';
if (!split) {
month = md.substr(0, 2);
day = md.substr(2, 2);
} else {
var arr = md.split(split);
month = arr[0];
day = arr[1];
}
return this.getChinaNum(parseFloat(month)) + "月" + cDay(parseFloat(day));
},
getDayNameBrief : function(day_index) {
var day_name = [ 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT' ];
return day_name[day_index];
},
daynameToIndex : function(dayname) {
var dayname_index_map = {
'SUN' : 0,
'MON' : 1,
'TUE' : 2,
'WED' : 3,
'THU' : 4,
'FRI' : 5,
'SAT' : 6
};
return dayname_index_map[dayname];
},
getWeekOfMonth : function(date_time, start_on_monday) {
var date = this.copy(date_time);
return Math.floor((this.date_part(date).getTime() - this.month_view_start(date,
	start_on_monday).getTime()) / 604800000) + 1;
},
lunar_year : function(date) {
var l_year = date.getFullYear() + '年' + (date.getMonth() + 1) + '月 '
	+ cyclical(date.getFullYear() - 1900 + 36)
	+ Animals[(date.getFullYear() - 4) % 12] + '年';
return l_year;
},
lunar_Info : function(date) {
var cld = cacheMgr.getCld(date.getFullYear(), date.getMonth());
var day = date.getDate();
var cld_day = cld[day - 1];
var lunar_detail = {
l_day : "",
l_month : "",
l_day_full : ""
};
lunar_detail.l_day = cDay(cld_day.lDay);
lunar_detail.l_month = cld_day.lMonth;
lunar_detail.color = "";
var s, s2;
s = cld_day.lunarFestival;
if (s.length > 0) {
if (s.length > 6) {
	s2 = s.toString();
	s = s.substr(0, 4) + '...';
}
lunar_detail.color = "#32CD32";
} else {
s = cld_day.solarTerms;
s2 = s.toString();
if (s.length > 0) {
	lunar_detail.color = "#32CD32";
	if ((s == '清明') || (s == '芒种') || (s == '夏至') || (s == '冬至')) {
		lunar_detail.color = "#32CD32";
		if (s == '清明')
			s = '清明节';
	}
}
}
lunar_detail.l_day_y = cDay(cld_day.lDay);
if (s.length > 0) {
lunar_detail.l_day = s;
lunar_detail.l_day_full = s2;
}
return lunar_detail;
},
date_to_str : function(format, utc) {
format = format.replace(/%[a-zA-Z]/g, function(a) {
switch (a) {
case "%d":
	return "\"+calwnl.date.to_fixed(date.getDate())+\"";
case "%m":
	return "\"+calwnl.date.to_fixed((date.getMonth()+1))+\"";
case "%j":
	return "\"+date.getDate()+\"";
case "%n":
	return "\"+(date.getMonth()+1)+\"";
case "%y":
	return "\"+calwnl.date.to_fixed(date.getYear()%100)+\"";
case "%Y":
	return "\"+date.getFullYear()+\"";
case "%D":
	return "\"+calwnl.locale.date.day_short[date.getDay()]+\"";
case "%l":
	return "\"+calwnl.locale.date.day_full[date.getDay()]+\"";
case "%M":
	return "\"+calwnl.locale.date.month_short[date.getMonth()]+\"";
case "%F":
	return "\"+calwnl.locale.date.month_full[date.getMonth()]+\"";
case "%h":
	return "\"+calwnl.date.to_fixed((date.getHours()+11)%12+1)+\"";
case "%H":
	return "\"+calwnl.date.to_fixed(date.getHours())+\"";
case "%i":
	return "\"+calwnl.date.to_fixed(date.getMinutes())+\"";
case "%a":
	return "\"+(date.getHours()>11?\"pm\":\"am\")+\"";
case "%A":
	return "\"+(date.getHours()>11?\"PM\":\"AM\")+\"";
case "%s":
	return "\"+calwnl.date.to_fixed(date.getSeconds())+\"";
default:
	return a;
}
});
if (utc)
format = format.replace(/date\.get/g, "date.getUTC");
return new Function("date", "return \"" + format + "\";");
},
numToWeek : function(inStr) {
switch (inStr) {
case 1:
return '一';
case 2:
return '二';
case 3:
return '三';
case 4:
return '四';
case 5:
return '五';
case 6:
return '六';
case 0:
return '日';
}
},
str_to_date : function(format, utc) {
var splt = "var temp=date.split(/[^0-9a-zA-Z]+/g);";
var mask = format.match(/%[a-zA-Z]/g);
for (var i = 0; i < mask.length; i++) {
switch (mask[i]) {
case "%j":
case "%d":
	splt += "set[2]=temp[" + i + "]||0;";
	break;
case "%n":
case "%m":
	splt += "set[1]=(temp[" + i + "]||1)-1;";
	break;
case "%y":
	splt += "set[0]=temp[" + i + "]*1+(temp[" + i + "]>50?1900:2000);";
	break;
case "%h":
case "%H":
	splt += "set[3]=temp[" + i + "]||0;";
	break;
case "%i":
	splt += "set[4]=temp[" + i + "]||0;";
	break;
case "%Y":
	splt += "set[0]=temp[" + i + "]||0;";
	break;
case "%a":
case "%A":
	splt += "set[3]=set[3]%12+((temp[" + i
			+ "]||'').toLowerCase()=='am'?0:12);";
	break;
case "%s":
	splt += "set[5]=temp[" + i + "]||0;";
	break;
}
}
var code = "set[0],set[1],set[2],set[3],set[4],set[5]";
if (utc)
code = " Date.UTC(" + code + ")";
return new Function("date", "var set=[0,0,0,0,0,0]; " + splt
	+ " return new Date(" + code + ");");
}
};
calwnl.templates = {};
calwnl.config = {
default_date : "%Y-%m-%d %H:%i",
month_date : "%F %Y",
load_date : "%Y-%m-%d",
week_date : "%l",
day_date : "%D, %F %j",
hour_date : "%H:%i",
month_day : "%d",
xml_date : "%Y/%m/%d %H:%i",
api_date : "%Y-%m-%d %H:%i",
server_utc : false
};
calwnl.init_templates = function() {
var d = calwnl.date.date_to_str;
var c = calwnl.config;
var f = function(a, b) {
for ( var c in b)
	if (!a[c])
		a[c] = b[c];
};
f(calwnl.templates, {
day_date : d(c.default_date),
month_date : d(c.month_date),
week_date : function(d1, d2) {
return calwnl.templates.day_date(d1) + " &ndash; "
		+ calwnl.templates.day_date(calwnl.date.add(d2, -1, "day"));
},
day_scale_date : d(c.default_date),
month_scale_date : d(c.week_date),
week_scale_date : d(c.day_date),
hour_scale : d(c.hour_date),
time_picker : d(c.hour_date),
event_date : d(c.hour_date),
month_day : d(c.month_day),
xml_date : calwnl.date.str_to_date(c.xml_date, c.server_utc),
load_format : d(c.load_date, c.server_utc),
xml_format : d(c.xml_date, c.server_utc),
api_date : calwnl.date.str_to_date(c.api_date),
event_header : function(start, end, ev) {
return calwnl.templates.event_date(start) + " - "
		+ calwnl.templates.event_date(end);
},
event_text : function(start, end, ev) {
return ev.text;
},
event_class : function(start, end, ev) {
return "";
},
month_date_class : function(d) {
return "";
},
week_date_class : function(d) {
return "";
},
event_bar_date : function(start, end, ev) {
return calwnl.templates.event_date(start) + " ";
},
event_bar_text : function(start, end, ev) {
return ev.text;
}
});
};
calwnl.locale = {
date : {
month_full : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月",
	"十一月", "十二月" ],
month_short : [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月",
	"11月", "12月" ],
day_full : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ],
day_short : [ "日", "一", "二", "三", "四", "五", "六" ]
}
};
var tplMgr = {
tplMap : {},
getInstance : function(id) {
var instance = this.tplMap[id];
if (!instance) {
instance = new jCT($.dom(id).value);
instance.Build();
this.tplMap[id] = instance;
}
return instance;
},
getTemplate : function(id) {
var element = $.dom(id);
var content = element.value;
if (content == null)
content = element.innerHTML;
content = content.replace(/&lt;/g, "<").replace(/&gt;/g, ">");
return content;
},
loadTemplate : function(id, url, callback) {
if ($('textarea[id=' + id + ']').length > 0) {
if (callback) {
	callback();
}
} else {
$.get(url, {
	t : Math.ceil(Math.random() * 100)
}, function(data) {
	$('<textarea id="' + id + '" style="display:none"></textarea>').appendTo(
			'body').val(data);
	if (callback) {
		callback();
	}
});
}
}
};
var dialogMgr = {
dialog : null,
option : null,
moving : false,
pos : null,
show : function(el, options) {
var op = {
width : 428,
title : '',
draggable : true
};
var options = options || {};
for ( var p in options) {
op[p] = options[p];
}
if (this.dialog) {
this.hide();
}
this.option = op;
this.dialog = $.dom(el);
var width = this.option.width;
var w = utils.getClientWidth();
var left = 0;
if (w > width) {
left = (w - width) / 2;
}
this.dialog.style.left = left + 'px';
var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
var top = 30 + scrollTop;
this.dialog.style.top = top + 'px';
},
hide : function() {
if (this.dialog) {
$(this.dialog).hide();
if (this.option.hideCallback) {
	try {
		this.option.hideCallback();
	} catch (ex) {
	}
}
this.option = null;
this.dialog = null;
this.moving = false;
this.pos = null;
}
}
};
var CalUtil = {
monthViewInfo : function(date, startOnMonday) {
var dateUtil = calwnl.date;
var info = {};
var s_date = dateUtil.copy(date);
s_date = dateUtil.month_view_start(s_date, startOnMonday);
info.start = dateUtil.copy(dateUtil.week_start(s_date, startOnMonday));
var e_date = dateUtil.copy(date);
e_date.setMonth(date.getMonth() + 1);
e_date.setDate(1);
info.row = Math.ceil((e_date.valueOf() - s_date.valueOf()) / 604800000);
info.end = dateUtil.add(info.start, 7 * info.row, 'day');
return info;
}
};
jQuery.cookie = function(name, value, options) {
if (typeof value != 'undefined') {
options = options || {};
if (value === null) {
	value = '';
	options.expires = -1;
}
var expires = '';
if (options.expires
		&& (typeof options.expires == 'number' || options.expires.toUTCString)) {
	var date;
	if (typeof options.expires == 'number') {
		date = new Date();
		date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
	} else {
		date = options.expires;
	}
	expires = '; expires=' + date.toUTCString();
}
var path = options.path ? '; path=' + (options.path) : '';
var domain = options.domain ? '; domain=' + (options.domain) : '';
var secure = options.secure ? '; secure' : '';
document.cookie = [ name, '=', encodeURIComponent(value), expires, path,
		domain, secure ].join('');
} else {
var cookieValue = null;
if (document.cookie && document.cookie != '') {
	var cookies = document.cookie.split(';');
	for (var i = 0; i < cookies.length; i++) {
		var cookie = jQuery.trim(cookies[i]);
		if (cookie.substring(0, name.length + 1) == (name + '=')) {
			cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
			break;
		}
	}
}
return cookieValue;
}
};
var colors = [ '#CC3333', '#DD4477', '#994499', '#6633CC', '#336699',
'#3366CC', '#22AA99', '#329262', '#109618', '#66AA00', '#AAAA11', '#D6AE00',
'#EE8800', '#DD5511', '#A87070', '#8C6D8C', '#627487', '#7083A8', '#5C8D87',
'#898951', '#B08B59' ];
var DataHandler = {
cachedData : {
from : new Date(),
to : new Date()
},
loadCld : {},
getLoadCld : function(dateStart, dateEnd, cld) {
var sel = [];
var str = getDateKey(dateStart) + "-" + getDateKey(dateEnd);
for (var i = 0; i < cld.length; i++) {
var signal = str + "-" + cld[i];
if (typeof DataHandler.loadCld[signal] == 'undefined') {
	sel.push(cld[i]);
	DataHandler.loadCld[signal] = {};
}
}
if (sel.length > 0)
return sel.join(",");
else
return false;
},
resultData : {},
resultDataById : {},
getSchByPeriod : function(dateStart, dateEnd, callback) {
var s_time = dateStart, e_time = dateEnd;
if (dateStart >= this.cachedData.from) {
s_time = this.cachedData.to;
}
if (dateEnd <= this.cachedData.to) {
e_time = this.cachedData.from;
}
var cld = calendarHandler.getSelectedArray();
var cldStr = DataHandler.getLoadCld(dateStart, dateEnd, cld);
if (cldStr) {
$.ajax({
	url : '/schedule/list.do',
	async : true,
	type : 'post',
	dataType : 'json',
	data : {
		fromDate : calwnl.templates.load_format(dateStart),
		toDate : calwnl.templates.load_format(dateEnd),
		timeZone : -(new Date()).getTimezoneOffset() / 60,
		calendarId : cldStr
	},
	success : function(result) {
		for (var i = 0; i < result.length; i++) {
			var cldObj = result[i];
			DataHandler.formatSchData(cldObj.schlist, e_time);
		}
		if (DataHandler.cachedData.from > s_time)
			DataHandler.cachedData.from = s_time;
		if (DataHandler.cachedData.to < e_time)
			DataHandler.cachedData.to = e_time;
		if (callback) {
			callback();
		}
	}
});
} else {
if (callback) {
	callback();
}
}
},
getSchByMonth : function(date, callback, startOnMonday) {
var s_date = calwnl.date.month_view_start(date, startOnMonday);
var e_date = calwnl.date.add(s_date,
	CalUtil.monthViewInfo(date, startOnMonday).row * 7, 'day');
this.getSchByPeriod(s_date, e_date, callback);
},
getSchedulesByRange : function(sTime, eTime, data, cld) {
var result = {};
var dataSch = data || DataHandler.resultData;
if (typeof sTime == "string") {
sTime = calwnl.templates.api_date(sTime);
}
if (typeof eTime == "string") {
eTime = calwnl.templates.api_date(eTime);
}
sTime = calwnl.date.date_part(sTime);
eTime = calwnl.date.date_part(eTime);
for (; sTime <= eTime;) {
var k = "d" + getDateKey(sTime);
result[k] = {
	schList : [],
	num : 0
};
if (dataSch[k]) {
	var schList_temp = [];
	for (var j = 0; j < dataSch[k].schList.length; j++) {
		var sch_t = dataSch[k].schList[j];
		for (var q = 0; q < cld.length; q++) {
			if (sch_t.cid == cld[q]) {
				schList_temp.push(sch_t);
				break;
			}
		}
	}
	result[k].schList = schList_temp;
	result[k].num = schList_temp.length;
}
sTime = calwnl.date.add(sTime, 1, "day");
}
var maxNum = 0;
for ( var i in result) {
var k = result[i];
if (k.num > maxNum)
	maxNum = k.num;
}
result.maxNum = maxNum;
return JSON.parse(JSON.stringify(result));
},
formatSchData : function(data, dateScope) {
var result = {};
for (var i = 0; i < data.length; i++) {
var sch = data[i];
if ('' == sch.text)
	sch.text = '(无标题)';
var sTime = calwnl.templates.api_date(sch.start_time);
var eTime = new Date(sTime.valueOf() + sch.duration * 1000);
var sTemp = calwnl.date.copy(sTime);
var sideTime = calwnl.date.add(calwnl.date.date_part(sTemp), 1, "day");
sch.isDisplay = 0;
if (sideTime >= eTime) {
	var key = "d" + getDateKey(sTime);
	if (!result[key])
		result[key] = {
			schList : []
		};
	result[key].schList.push(sch);
} else {
	var s_t = calwnl.date.copy(sTime);
	for (; s_t < eTime && s_t < dateScope;) {
		var k = "d" + getDateKey(s_t);
		var sch_temp = DataHandler.copySch(sch);
		sch_temp.cross_st = calwnl.templates.day_date(s_t) + ":00";
		var e_t = calwnl.date.add(calwnl.date.date_part(s_t), 1, "day");
		if (e_t <= eTime)
			sch_temp.cross_et = calwnl.templates.day_date(e_t) + ":00";
		else
			sch_temp.cross_et = calwnl.templates.day_date(eTime) + ":00";
		if (!result[k])
			result[k] = {
				schList : []
			};
		result[k].schList.push(sch_temp);
		s_t = e_t;
	}
}
}
DataHandler.mergeData(DataHandler.resultData, result);
DataHandler.formatSchDataById(data);
},
formatSchDataById : function(data) {
var result = {};
for (var i = 0; i < data.length; i++) {
result[data[i].id] = data[i];
}
$.extend(true, DataHandler.resultDataById, result);
},
mergeData : function(target, source) {
for ( var dailySch in source) {
if (target[dailySch]) {
	var src = source[dailySch]['schList'];
	var tgt = target[dailySch]['schList'];
	for (var i = 0; i < src.length; ++i) {
		var flag = false;
		for (var j = 0; j < tgt.length; ++j) {
			if (tgt[j].id == src[i].id) {
				tgt[j] = src[i];
				flag = true;
				break;
			}
		}
		if (!flag) {
			tgt.push(src[i]);
		}
	}
} else {
	target[dailySch] = source[dailySch];
}
target[dailySch].schList.sort(function(a, b) {
	if (a.allday_event)
		return -1;
	if (b.allday_event)
		return 1;
	var a_stime = calwnl.templates.api_date(a.start_time).getTime();
	var b_stime = calwnl.templates.api_date(b.start_time).getTime();
	return (a_stime - b_stime);
});
}
},
delSchById : function(id) {
for ( var dailySch in DataHandler.resultData) {
var schList = DataHandler.resultData[dailySch]['schList'];
for (var i = 0; i < schList.length; ++i) {
	if (schList[i].id == id) {
		schList.splice(i, 1);
		--i;
	}
}
}
delete DataHandler.resultDataById[id];
},
updateSch : function(schList, dateScope) {
DataHandler.delSchById(schList[0].id);
DataHandler.formatSchData(schList, dateScope);
},
copySch : function(sch) {
var t = function() {
};
t.prototype = sch;
return new t();
}
};
(function(window) {
var startOnMonday = true, reg = /^d(\d{4})-(\d{2})-(\d{2})/, r2 = /^0/, calendarId = null, navDate = null, seletedDate = null, hoverDate = null, schData = null;
var log = function(message) {
}, setNavDate = function(date) {
if (date instanceof Date)
	navDate = date;
else
	navDate = null;
}, getCurrentMonthViewData = function(callback) {
if (navDate) {
	DataHandler.getSchByMonth(navDate, function() {
		var monthInfo = CalUtil.monthViewInfo(navDate, startOnMonday);
		var s = monthInfo.start, e = monthInfo.end;
		var cld = new Array();
		cld.push(calendarId);
		schData = DataHandler.getSchedulesByRange(s, e, DataHandler.resultData,
				cld);
		if (callback) {
			callback();
		}
	}, startOnMonday);
}
}, creatSch = function(text, allday, hour, second, callback) {
var sch = {};
sch.schTitle = text;
sch.alldayEvent = allday;
if (allday) {
	sch.startTime = getDateKey(seletedDate) + ' ' + '09:00:00';
} else {
	hour = hour + "";
	second = second + "";
	sch.startTime = getDateKey(seletedDate) + ' ' + hour.leftpad(2) + ':'
			+ second.leftpad(2) + ":00";
}
sch['timeZone'] = -(new Date()).getTimezoneOffset() / 60;
var dateScope = calwnl.date.add(calwnl.templates.api_date(sch.startTime), 1,
		'day');
$.ajax({
	type : 'post',
	data : sch,
	url : '/schedule/update.do',
	success : function(result) {
		for (var i = 0; i < result.length; i++) {
			var cldObj = result[i];
			DataHandler.formatSchData(cldObj.schlist, dateScope);
		}
		getCurrentMonthViewData(function() {
			for ( var key in schData) {
				if (key != "maxNum") {
					var num = schData[key].num;
					var k = key.replace(reg, function(all, year, month, date) {
						return year + "-" + month.replace(r2, "") + "-"
								+ date.replace(r2, "");
					});
					if (num > 0) {
						callback(calwnl.templates.api_date(k));
					}
				}
			}
		});
	},
	dataType : 'json'
});
}, cutByRealLength = function(str, size) {
var totalCount = 0;
var i;
for (i = 0; i < str.length; i++) {
	var c = str.charCodeAt(i);
	if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
		totalCount++;
	} else {
		totalCount += 2;
	}
	if (totalCount >= size) {
		return str.substring(0, i + 1);
	}
}
return str;
};
var UI = {
drawSch : function(schList) {
	$("#taskList").children().remove();
	var schs = [];
	if (schList.length > 0) {
		for (var i = 0; i < 3 && i < schList.length; i++) {
			var showTxt = cutByRealLength(schList[i].text, 10);
			if (showTxt.length < schList[i].text.length) {
				showTxt += "...";
			}
			var showTime = "&nbsp;";
			if (!schList[i].allday_event) {
				var raw = schList[i].start_time.split(' ')[1].split(':');
				raw.splice(2);
				showTime = raw.join(':') + "&nbsp;";
			}
			schs.push("<div class='workitem'>");
			schs.push("<div class='tastWorkDot'></div>");
			if (!schList[i].allday_event) {
				schs.push("<div class='taskWorkTime'>" + showTime + "</div>");
				schs
						.push("<div style='margin-left:5px;'>" + showTxt
								+ "</div>");
			} else {
				schs.push("<div style='margin-left:11px;'>" + showTxt
						+ "</div>");
			}
			schs.push("</div>");
		}
	}
	$("#taskList").html(schs.join(''));
}
};
var calendarHandler = {
init : function(id) {
if (typeof id == 'number')
	calendarId = id;
else if (typeof id == 'string')
	calendarId = parseInt(id);
navDate = seletedDate = new Date();
calwnl.init_templates();
},
isLogin : function() {
return !!calendarId;
},
getSelectedArray : function() {
var t = new Array();
t.push(calendarId);
return t;
},
prepareData4 : function(year, month, callback) {
var date = new Date();
date.setYear(year);
date.setMonth(month - 1);
date.setDate(1);
setNavDate(date);
getCurrentMonthViewData(function() {
	for ( var key in schData) {
		if (key != "maxNum") {
			var num = schData[key].num;
			var k = key.replace(reg, function(all, year, month, date) {
				return year + "-" + month.replace(r2, "") + "-"
						+ date.replace(r2, "");
			});
			if (num > 0) {
				var tttt = calwnl.templates.api_date(k);
				callback(tttt);
			}
		}
	}
});
},
getSelectedDate : function() {
return seletedDate;
},
setSelectedDate : function(date) {
if (typeof date == "string")
	seletedDate = calwnl.templates.api_date(date);
else if (date instanceof Date)
	seletedDate = date;
},
getSch : function() {
return schData["d" + getDateKey(hoverDate)];
},
addSch : function(text, allday, hour, second, callback) {
creatSch(text, allday, hour, second, callback);
},
drawSch : function() {
if (this.isLogin()) {
	UI.drawSch(this.getSch().schList);
}
},
setHoverDate : function(date) {
if (typeof date == "string")
	hoverDate = calwnl.templates.api_date(date);
else if (date instanceof Date)
	hoverDate = date;
}
};
if (window.calendarHandler) {
window._calendarHandler = window.calendarHandler;
}
window.calendarHandler = calendarHandler;
})(window);

/* makeCal.js */

var HuangLi = {};
var calData = new Array();
var currentDate = new Date();
var rows;
var showingToday = true;
var taskHover_inblock = false;
var taskHover_inhover = false;
var madeRiliDate = new Date();
var canlist;
var record = {
elem_id : "",
nav_date : new Date()
};
var timeSelf = 0;
var timeBeijing;
function clock(time) {
timeSelf = (new Date()).getTime();
jprestWork
timeBeijing = time * 1000;
}
var calander = {
    init : function() {
            makeCal.pareData(new Date());
            
			makeCal.showCal(new Date());
			makeCal.initAction();
			makeCal.makeHuangli(currentDate);
			},
    pareData : function(date) {
			date = makeCal.setTimeZero(date);
			madeRiliDate = new Date(date);
			var monthFirstD = makeCal.getMonthFirst(date);
			var tableFirstD = makeCal.getWeekFirst(monthFirstD);
			var nextMonthFirstD = makeCal.addTime(monthFirstD, 1, "month");
			var monthLastD = makeCal.addTime(nextMonthFirstD, -1, "day");
			rows = Math.ceil((nextMonthFirstD.valueOf() - tableFirstD.valueOf())/ (60 * 60 * 24 * 1000 * 7));
			var indexDay = new Date(tableFirstD);
			var nowDay = makeCal.setTimeZero(new Date());
			makeCal.fillCalData(indexDay, monthFirstD, monthLastD, nowDay);
			},
    fillCalData : function(indexDay, monthFirstD, monthLastD, nowDay) {
			calData = [];
			for (var i = 0; i < rows; i++) {
			var week = [];
			for (var j = 0; j < 7; j++) {
				var aDay = makeCal.createDay();
				if (indexDay.getTime() < monthFirstD.getTime()) {
					aDay.before = true;
				} else if (indexDay.getTime() > monthLastD.getTime()) {
					aDay.after = true;
				}
				aDay.year = indexDay.getFullYear();
				aDay.month = indexDay.getMonth();
				aDay.date = indexDay.getDate();
				if (indexDay.getTime() == nowDay.getTime()) {
					aDay.today = true;
				}
				if (j == 0 || j == 6) {
					aDay.weekend = true;
				}
				aDay.rows = rows;
				aDay.inrow = i + 1;
				aDay.value = indexDay;
				aDay.china = templates.lunar_Info(aDay.value);
				week.push(aDay);
				indexDay = makeCal.addTime(indexDay, 1, "day");
			}
			calData.push(week);
			}
			},
     showCal : function(selectDate) {
			    var is5Row = (rows <= 5 ? true : false);
			    if (typeof (selectDate) == "undefined") {
			      selectDate = date = makeCal.setTimeZero(new Date());
               }
var year = selectDate.getFullYear();
var month = selectDate.getMonth() + 1;
// modify by dengyunlong start
canlist = getByMonth(year, month);
// modify by dengyunlong end
selectDate = makeCal.setTimeZero(selectDate);
var cldCache = null;
$('#month_num').text(selectDate.getMonth() + 1);
$('#year_num').text(selectDate.getFullYear());
var table = "<table> \
      <thead class='tablehead'> \
       <tr> \
        <td class='thead' style='color:#bc5016;'>日</td> \
        <td class='thead'>一</td> \
        <td class='thead'>二</td> \
        <td class='thead'>三</td> \
        <td class='thead'>四</td> \
        <td class='thead'>五</td> \
        <td class='thead' style='color:#bc5016;'>六</td> \
       </tr> \
      </thead> \
      <tbody>";
var index = 40;
var ind = 0;
for (var i = 0; i < rows; i++) {
var aWeek = "<tr>";
for (var j = 0; j < 7; j++) {
	if (calData[i][j] != null) {
		var tdclass = "";
		if (calData[i][j].today == true) {
			tdclass = 'today';
		}
		var numtype = "number";
		var isClickBlock = "";
		if (calData[i][j].today == false
				&& calData[i][j].value.getTime() == selectDate.getTime()) {
			isClickBlock = " block_click";
		}
		var aDay = "";
		if (is5Row)
			aDay = "<td i=" + i + " j=" + j + " class='block block5 " + tdclass
					+ isClickBlock + "'>";
		else
			aDay = "<td i=" + i + " j=" + j + " class='block " + tdclass
					+ isClickBlock + "'>";
		aDay += "<a class='block_content'" + "data='"
				+ (calData[i][j].value.format('MMdd'))
				+ "' onmouseover='mouseover(\""
				+ calData[i][j].value.format('yyyy-MM-dd')
				+ "\")' ondblclick='addNode();' href='javascript:;'>";
		var dateDay = calData[i][j].date;
		var restOrWork = '';
		var year = calData[i][j].value.getFullYear();
		var md = calData[i][j].value.format('MMdd');
		if ((worktime.years.join('').indexOf(year) != -1)
				&& (worktime['y' + year].workRestStr.indexOf('d' + md) != -1)) {
			restOrWork = worktime['y' + year]['d' + md].w;
		} else {
			restOrWork = '';
		}
		// 循环当前月份的日历信息,如果查询到当天有日程,则标记当天
		if (canlist != null) {
			for (var calcount = 0; calcount < canlist.length; calcount++) {
				if (calData[i][j].value.format('yyyy-MM-dd') == canlist[calcount].date) {
					aDay += "<div class='flag' style='font-size:10px;'></div>";
				}
			}
		}
		if (calData[i][j].weekend
				&& !(calData[i][j].after || calData[i][j].before)) {
			aDay += "<div class='" + numtype + "' style='color:#ff4e00;'>"
					+ dateDay + "</div>";
		} else {
			if (calData[i][j].after || calData[i][j].before) {
				aDay += "<div class='" + numtype + "' style='color:#c3c3c3;'>"
						+ dateDay + "</div>";
			} else {
				aDay += "<div class='" + numtype + "'>" + dateDay + "</div>";
			}
		}
		cldCache = cacheMgr.getCld(year, calData[i][j].value.getMonth());
		var dayStr = "";
		var color = "style='color:#BC5016;'";
		var title = "";
		if (cldCache[dateDay - 1].lunarFestival != undefined
				&& cldCache[dateDay - 1].lunarFestival != '') {
			dayStr = cldCache[dateDay - 1].lunarFestival;
		} else if (cldCache[dateDay - 1].solarFestival != undefined
				&& cldCache[dateDay - 1].solarFestival != '') {
			dayStr = cldCache[dateDay - 1].solarFestival;
		} else if (cldCache[dateDay - 1].solarTerms != undefined
				&& cldCache[dateDay - 1].solarTerms != '') {
			dayStr = cldCache[dateDay - 1].solarTerms;
		} else {
			dayStr = calData[i][j].china.l_day;
			color = "";
			title = "";
		}
		if (color != "") {
			var dayTitle = "";
			if (cldCache[dateDay - 1].lunarFestival != undefined
					&& cldCache[dateDay - 1].lunarFestival != '') {
				dayTitle = cldCache[dateDay - 1].lunarFestival;
				title += dayTitle;
			}
			if (cldCache[dateDay - 1].solarFestival != undefined
					&& cldCache[dateDay - 1].solarFestival != '') {
				dayTitle = cldCache[dateDay - 1].solarFestival;
				if (title.trim() != "") {
					title += "| ";
				}
				title += dayTitle;
			}
			if (cldCache[dateDay - 1].solarTerms != undefined
					&& cldCache[dateDay - 1].solarTerms != '') {
				dayTitle = cldCache[dateDay - 1].solarTerms;
				if (title.trim() != "") {
					title += "| ";
				}
				title += dayTitle;
			}
		}
		aDay += "<div class='lnumber' title='" + title + "' " + color + ">"
				+ dayStr + "</div>";
		aDay += "</a></td>";
		aWeek += aDay;
	} else {
		aWeek += "<td></td>";
	}
}
aWeek += "</tr>";
table += aWeek;
}
table += "</tbody></table>";
$('#mainCal').empty();
$('#mainCal').append(table);
makeCal.makeAction();
},
initAction : function() {
$('#next_button_a').bind('click', function(e) {
var month = currentDate.getMonth();
var year = currentDate.getFullYear();
var real_show_month = madeRiliDate.getMonth();
month = real_show_month;
month++;
if (month > 11) {
	month = 0;
	year++;
}
var currentMonth = real_show_month;
currentDate = makeCal.addTime(currentDate, 1, "month");
if (currentDate.getMonth() != (currentMonth + 1) % 12) {
	currentDate.setDate(1);
	currentDate.setMonth(currentMonth + 1);
}
$('#year_num').text(year);
$('#month_num').text(month + 1);
makeCal.nextMonth(currentDate);
});
$('#prev_button_a').bind('click', function(e) {
var month = currentDate.getMonth();
var year = currentDate.getFullYear();
var real_show_month = madeRiliDate.getMonth();
month = real_show_month;
month--;
if (month < 0) {
	month = 11;
	year--;
}
var currentMonth = real_show_month;
currentDate = makeCal.addTime(currentDate, -1, "month");
if (currentDate.getMonth() != (currentMonth + 11) % 12) {
	currentDate.setDate(1);
	currentDate.setMonth((currentMonth + 11) % 12);
}
$('#year_num').text(year);
$('#month_num').text(month + 1);
makeCal.prevMonth(currentDate);
});
$('#today_button').bind('click', function(e) {
makeCal.showToday();
$("#btns #today").removeClass("botton_today1");
});
$('#year_num').text(currentDate.getFullYear());
$('#month_num').text(currentDate.getMonth() + 1);
var indiv = false;
var inhuangli = false;
$('#huangliDiv').bind('mouseover', function(e) {
inhuangli = true;
setTimeout(function() {
	if (indiv || inhuangli)
		$('#huangliDiv').css({
			'display' : 'block'
		});
}, 500);
});
$('#huangliDiv').bind('mouseout', function(e) {
inhuangli = false;
if (indiv == false) {
	setTimeout(function() {
		if (inhuangli == false && indiv == false)
			$('#huangliDiv').css({
				'display' : 'none'
			});
	}, 500);
}
});
},
makeAction : function() {
$('.block').unbind();
$('.block')
	.bind(
			'click',
			function(e) {
				$('.block').removeClass("block_click");
				$(this).addClass("block_click");
				var real_show_month = madeRiliDate.getMonth();
				ele = $(e.target);
				while (1) {
					if (ele.hasClass('block')) {
						break;
					} else {
						ele = ele.parent();
					}
				}
				click_date = calData[ele.attr('i')][ele.attr('j')].value;
				if (click_date.getMonth() == (real_show_month + 11) % 12) {
					makeCal.prevMonth(click_date);
					return;
				} else if (click_date.getMonth() == (real_show_month + 1) % 12) {
					makeCal.nextMonth(click_date);
					return;
				}
				if (ele.hasClass('today') == false) {
				}
				var nowTime = new Date();
				calData[ele.attr('i')][ele.attr('j')].value
						.setHours(nowTime.getHours(), nowTime.getMinutes(),
								nowTime.getSeconds());
				makeCal
						.makeHuangli(calData[ele.attr('i')][ele.attr('j')].value);
				if (click_date.getMonth() != new Date().getMonth()) {
					$("#btns #today").addClass("botton_today1");
				}
			});
},
makeHuangli : function(date) {
currentDate = date;
date = makeCal.setTimeZero(date);
var datestr = date.getDate();
lunar = templates.lunar_Info_detail(date, showYJ);
$('#right_big_date').text(datestr);
var gregorianDayStr = date.getFullYear() + "年" + (date.getMonth() + 1) + "月"
	+ date.getDate() + "日";
var weekDayStr = "";
switch (date.getDay()) {
case 1:
weekDayStr = '星期一';
break;
case 2:
weekDayStr = '星期二';
break;
case 3:
weekDayStr = '星期三';
break;
case 4:
weekDayStr = '星期四';
break;
case 5:
weekDayStr = '星期五';
break;
case 6:
weekDayStr = '星期六';
break;
case 0:
weekDayStr = '星期日';
break;
}
$('#gregorianDayStr').text(gregorianDayStr);
$('#weekDayStr').text(weekDayStr);
$('#popDateStr').text(getFullDateStr(date));
$('#popChineseStr').text((lunar.lunar).substring(2));
var nowDate = makeCal.setTimeZero(new Date());
var nowMiliSecond = nowDate.getTime();
var targetMiliSecond = date.getTime();
var passedTime = Math.ceil((targetMiliSecond - nowMiliSecond) / 86400000);
var dayafterorbeforeStr = "";
if (nowDate.getDate() == date.getDate()) {
dayafterorbeforeStr = '今天';
}
if (passedTime < 0) {
dayafterorbeforeStr = (0 - passedTime) + "天前";
} else if (passedTime > 0) {
dayafterorbeforeStr = passedTime + "天后";
}
$('#dayafterorbefore').text(dayafterorbeforeStr);
$('#chinaDay').text((lunar.lunar).substring(2));
if (date.getFullYear() == 2012 && (date.getMonth() == 0 && date.getDate() < 23)) {
lunar.y_Info = lunar.y_Info.replace("龙", "兔");
}
if (date.getFullYear() == 2013
	&& (date.getMonth() == 0 || (date.getMonth() == 1 && date.getDate() < 10))) {
lunar.y_Info = lunar.y_Info.replace("蛇", "龙");
}
info = lunar.y_Info;
var yInfo = info.split(" ");
$('#chinaDay2').text(yInfo[0]);
$('#chinaDay3').text(yInfo[1]);
function showYJ(lunar) {
Y = lunar.huangliY;
$('#ylist').empty();
if (Y.length > 0) {
	Ys = Y.split('.');
	for ( var key in Ys) {
		$('#ylist').append(Ys[key] + ' ');
	}
} else {
	$('#ylist').append('无');
}
J = lunar.huangliJ;
$('#jlist').empty();
if (J.length > 0) {
	Js = J.split('.');
	$('#jlist').empty();
	for ( var key in Js) {
		$('#jlist').append(Js[key] + ' ');
	}
} else {
	$('#jlist').append('无');
}
}
calendarHandler.setSelectedDate(date);
setYMVforSelect(date);
},
makeHuangliForCalFull : function(date) {
date = makeCal.setTimeZero(date);
var lunar = templates.lunar_Info_detail(date, undefined);
var gregorianDayStr = date.getFullYear() + "年" + (date.getMonth() + 1) + "月 ";
switch (date.getDay()) {
case 1:
gregorianDayStr += '星期一';
break;
case 2:
gregorianDayStr += '星期二';
break;
case 3:
gregorianDayStr += '星期三';
break;
case 4:
gregorianDayStr += '星期四';
break;
case 5:
gregorianDayStr += '星期五';
break;
case 6:
gregorianDayStr += '星期六';
break;
case 0:
gregorianDayStr += '星期日';
break;
}
lunar.solar = gregorianDayStr;
if (date.getFullYear() == 2012 && (date.getMonth() == 0 && date.getDate() < 23)) {
lunar.y_Info = lunar.y_Info.replace("龙", "兔");
}
if (date.getFullYear() == 2013
	&& (date.getMonth() == 0 || (date.getMonth() == 1 && date.getDate() < 10))) {
lunar.y_Info = lunar.y_Info.replace("蛇", "龙");
}
return lunar;
},
getWeekFirst : function(date) {
var day = date.getDay();
return makeCal.addTime(date, 0 - day, "day");
},
getMonthFirst : function(date) {
ndate = new Date(date);
ndate.setDate(1);
return ndate;
},
addTime : function(date, inc, mode) {
ndate = new Date(date);
switch (mode) {
case "day":
ndate.setDate(date.getDate() + inc);
break;
case "week":
ndate.setDate(date.getDate() + 7 * inc);
break;
case "month":
ndate.setMonth(date.getMonth() + inc);
break;
case "year":
ndate.setYear(date.getFullYear() + inc);
break;
case "hour":
ndate.setHours(date.getHours() + inc);
break;
case "minute":
ndate.setMinutes(date.getMinutes() + inc);
break;
default:
return ndate;
}
return ndate;
},
setTimeZero : function(date) {
ndate = new Date(date);
ndate.setHours(0);
ndate.setMinutes(0);
ndate.setSeconds(0);
ndate.setMilliseconds(0);
return ndate;
},
createDay : function() {
obj = new Object();
obj.year = 0;
obj.month = 0;
obj.date = 0;
obj.day = 0;
obj.before = false;
obj.after = false;
obj.weekend = false;
obj.china = null;
obj.rows = 0;
obj.inrow = 0;
obj.today = false;
obj.value = null;
obj.hasWork = false;
return obj;
},
nextMonth : function(clickDate) {
makeCal.pareData(clickDate);
makeCal.showCal(clickDate);
showingToday = false;
makeCal.makeHuangli(clickDate);
},
prevMonth : function(clickDate) {
makeCal.pareData(clickDate);
makeCal.showCal(clickDate);
showingToday = false;
makeCal.makeHuangli(clickDate);
},
showToday : function() {
currentDate = new Date();
makeCal.pareData(currentDate);
makeCal.showCal(new Date());
$('#year_num').text(currentDate.getFullYear());
$('#month_num').text(currentDate.getMonth() + 1);
showingToday = true;
makeCal.makeHuangli(currentDate);
},
showSomeMonth : function(currentDate) {
makeCal.pareData(currentDate);
makeCal.showCal(currentDate);
$('#year_num').text(currentDate.getFullYear());
$('#month_num').text(currentDate.getMonth() + 1);
showingToday = true;
makeCal.makeHuangli(currentDate);
}
};
function StringBuffer() {
this._strings = new Array();
};
StringBuffer.prototype.append = function(str) {
this._strings.push(str);
return this;
};
StringBuffer.prototype.toString = function() {
var str = arguments.length == 0 ? '' : arguments[0];
return this._strings.join(str);
};
var templates = {
month_day : function(date) {
var d = date || new Date();
return d.getDate();
},
lunar_Info : function(date) {
var cld = cacheMgr.getCld(date.getFullYear(), date.getMonth());
var day = date.getDate();
var cld_day = cld[day - 1];
var lunar_detail = {
l_day : "",
l_month : "",
l_day_full : ""
};
lunar_detail.l_day = cDay(cld_day.lDay);
lunar_detail.l_month = cld_day.lMonth;
lunar_detail.color = "";
return lunar_detail;
},
lunar_Info_detail : function(date, callback) {
var cld = cacheMgr.getCld(date.getFullYear(), date.getMonth());
var day = date.getDate();
var cld_day = cld[day - 1];
var info = {
lunar : "",
y_Info : "",
huangliY : "无",
huangliJ : "无"
};
info.lunar = '农历' + (cld_day.isLeap ? '闰 ' : '')
	+ templates.getChinaNum(cld_day.lMonth) + "月" + cDay(cld_day.lDay);
info.y_Info = cld_day.cYear + '年【' + this.lunar_year(date) + "】 "
	+ cld_day.cMonth + '月' + cld_day.cDay + '日';
try {
var cM = cld_day.cMnumber;
var cD = cld_day.cDnumber;
var month = (cM - 2) % 12;
var jianxing = (cD - month) % 12;
var jiazi = cD % 60;
if (jianxing.toString().length == 1) {
	jianxing = "0" + jianxing;
}
if (jiazi.toString().length == 1) {
	jiazi = "0" + jiazi;
}
var YJArray = _lunarJson[jianxing + "" + jiazi];
info.huangliY = YJArray.Y;
info.huangliJ = YJArray.J;
if (callback) {
	callback(info);
}
} catch (e) {
}
return info;
},
lunar_year : function(date) {
var l_year = Animals[(date.getFullYear() - 4) % 12] + '年';
return l_year;
},
getChinaNum : function(Num) {
var monthEn = '';
switch (Num) {
case 1:
monthEn = "一";
break;
case 2:
monthEn = "二";
break;
case 3:
monthEn = "三";
break;
case 4:
monthEn = "四";
break;
case 5:
monthEn = "五";
break;
case 6:
monthEn = "六";
break;
case 7:
monthEn = "七";
break;
case 8:
monthEn = "八";
break;
case 9:
monthEn = "九";
break;
case 10:
monthEn = "十";
break;
case 11:
monthEn = "十一";
break;
case 12:
monthEn = "腊";
break;
}
return monthEn;
},
init_sel_festival : function() {
if (festival_main) {
var str = new StringBuffer();
str.append('<div id="festival_sel_body">');
for ( var i in festival_main) {
	str.append('<div date="' + i).append('">').append(
			festival_main[i] + '</div>');
}
str.append('</div>');
}
$("#festival_sel_body>div").each(function() {
$(this).click(function() {
	var y = $(this).attr("date").split("_");
	record.nav_date.setFullYear(y[0]);
	record.nav_date.setMonth(Number(y[1]) - 1);
	generic_cal(record.nav_date, record.elem_id);
	$("#festival_sel_div").hide();
});
$(this).hover(function() {
	$(this).addClass("year_bg");
}, function() {
	$(this).removeClass("year_bg");
});
});
},
init_sel_year : function() {
var str = new StringBuffer();
str.append('<div id="sel_body">');
for (var i = 1900; i < 2050; i++) {
str.append('<div>').append(i).append('</div>');
}
str.append('</div>');
$("#open_sel_div").html(str.toString());
$("#sel_body>div").each(function() {
$(this).click(function() {
	var y = $(this).html();
	record.nav_date.setFullYear(y);
	generic_cal(record.nav_date, record.elem_id);
	$("#open_sel_div").hide();
});
$(this).hover(function() {
	$(this).addClass("year_bg");
}, function() {
	$(this).removeClass("year_bg");
});
});
},
mousedown_hide_ele : function(id) {
$(document).bind("mousedown." + id, function(r) {
var p = r.target;
var q = document.getElementById(id);
while (true) {
	if (p == q) {
		return true;
	} else {
		if (p == document) {
			$(document).unbind("mousedown." + id);
			$("#" + id).hide();
			return false;
		} else {
			p = $(p).parent()[0];
		}
	}
}
});
}
};
var cacheMgr = {
cldCache : {},
getCld : function(year, month) {
var key = getMonthKey(year, month);
var cld = this.cldCache[key];
if (typeof cld == 'undefined') {
cld = new calendar(year, month);
this.cldCache[key] = cld;
}
return cld;
}
};
function getRelativePath(sRelative) {
var sUrl = document.URL;
sUrl = sUrl.replace(/^.*?\:\/\/[^\/]+/, "").replace(/[^\/]+$/, "");
if (!sRelative) {
return sUrl;
}
if (!/\/$/.test(sUrl)) {
sUrl += "/";
}
if (/^\.\.\//.test(sRelative)) {
var Re = new RegExp("^\\.\\.\\/"), iCount = 0;
while (Re.exec(sRelative) != null) {
	sRelative = sRelative.replace(Re, "");
	iCount++;
}
for (var i = 0; i < iCount; i++) {
	sUrl = sUrl.replace(/[^\/]+\/$/, "");
}
if (sUrl == "")
	return "/";
return sUrl + sRelative;
}
sRelative = sRelative.replace(/^\.\//, "");
return sUrl + sRelative;
}
function getMonthKey(year, month) {
return year.toString() + (month + 1).toString().leftpad(2);
}
String.prototype.leftpad = function(len, str) {
if (!str) {
str = '0';
}
var s = '';
for (var i = 0; i < len - this.length; i++) {
s += str;
}
return s + this;
};
window.makeCal = calander;
function getMonthDateStr(date) {
month = date.getMonth() + 1;
day = date.getDate();
if (month < 10) {
month = "0" + month;
}
if (day < 10) {
day = "0" + day;
}
return month + "" + day;
}
function getFullDateStr(date) {
month = date.getMonth() + 1;
day = date.getDate();
year = date.getFullYear();
return year + "-" + month + "-" + day;
}

/* init.js */

function slTime(warpId, catidValue) {
$(warpId + '#selectTime').slTime(
	{
		callback : function() {
			if (catidValue == "1003") {
				var solardate = slTimeObj.target.attr("solardate");
				slTimeObj.target.attr("solardate", solardate);
				var lunardate = slTimeObj.target.attr("lunardate");
				slTimeObj.target.attr("lunardate", lunardate);
				if ($("#isIgnoreCase").attr('checked') == "checked") {
					var isIgYear = slTimeObj.target.val().split('年')[1];
					slTimeObj.target.val(isIgYear);
				} else {
					slTimeObj.target.val(slTimeObj.target.val());
				}
			} else {
				var type = "";
				var dateType = $(warpId + '#selectTime').attr("datetype");
				var time = $(warpId + '#selectTime1').attr("startvalue");
				if (dateType == 'lunarDate') {
					type = "lunardate";
					$(warpId + ' .repeat-extend li:last').hide();
					$(warpId + ' #repreat_week').hide();
					$(warpId + ' #cycle').val(0);
					$(warpId + ' #repeatType').text("不重复");
					time = $(warpId + '#selectTime').attr('lunardate');
					var dd = new Date(time.replace(/\-/g, "/"));
					dd.setHours(dd.getHours() + 1);
					$(warpId + '#selectTime1').val(
							$(warpId + '#selectTime').val().split(' ')[0]
									+ dd.format(" hh:mm:") + "00");
					$(warpId + "#selectTime1").attr("lunardate",
							dd.format("yyyy-MM-dd hh:mm:") + "00");
				} else {
					type = "solardate";
					$(warpId + ' .repeat-extend li:last').show();
					time = $(warpId + '#selectTime').attr('solardate');
					var datetime = new Date(time.replace(/\-/g, "/"));
					datetime.setHours(datetime.getHours() + 1);
					$(warpId + '#selectTime1').val(
							datetime.format("yyyy年MM月dd日 hh:mm:") + "00");
					$(warpId + "#selectTime1").attr("solardate",
							datetime.format("yyyy-MM-dd hh:mm:") + "00");
				}
				if ($(warpId + "#isAllDayTask").attr("checked") == 'checked') {
					$(warpId + '#selectTime').val(
							slTimeObj.target.val().split(' ')[0]);
					$(warpId + '#selectTime1').val(
							slTimeObj.target.val().split(' ')[0]);
				}
				$(warpId + '#selectTime1').attr("datetype", dateType);
				if (catidValue == "1000") {
					var startTime_s = $(warpId + '#selectTime').attr(type);
					var end_s = $(warpId + '#selectTime1').attr(type);
					endTime = new Date(end_s.replace(/\-/g, "/"));
					startTime = new Date(startTime_s.replace(/\-/g, "/"));
					if (startTime.getTime() > endTime.getTime()) {
						autoError($("#tips"), "结束时间不能小于开始时间 :(");
					}
				}
			}
		}
	});
}
function slTimeEnd(parentName) {
$(parentName + "#selectTime1")
	.slTime(
			{
				callback : function() {
					var solardate = slTimeObj.target.attr("solardate");
					slTimeObj.target.attr("solardate", solardate);
					var lunardate = slTimeObj.target.attr("lunardate");
					slTimeObj.target.attr("lunardate", lunardate);
					slTimeObj.target.val(slTimeObj.target.val());
					var endTime;
					var startTime;
					var dateType = $(parentName + '#selectTime1').attr(
							"datetype");
					var type;
					if (dateType == "lunarDate") {
						$(parentName + '.repeat-extend li:last').hide();
						$(parentName + '#repreat_week').hide();
						$(parentName + '#cycle').val(0);
						$(parentName + '#repeatType').text("不重复");
						if ($(parentName + "#isAllDayTask").attr("checked") == 'checked') {
							$(parentName + '#selectTime').val(
									slTimeObj.target.val().split(' ')[0]);
							$(parentName + '#selectTime1').val(
									slTimeObj.target.val().split(' ')[0]);
							$(parentName + '#selectTime').attr(
									"lunardate",
									$(parentName + "#selectTime1").attr(
											"lunardate"));
						} else {
							if ($(parentName + '#selectTime').attr("datetype") != "lunarDate") {
								$(parentName + '#selectTime1').val(
										slTimeObj.target.val());
								var lunarD = $(parentName + '#selectTime1')
										.attr("lunardate");
								var lun_date = new Date(lunarD.replace(/\-/g,
										"/"));
								lun_date.setHours(lun_date.getHours() - 1);
								$(parentName + '#selectTime').val(
										slTimeObj.target.val().split(' ')[0]
												+ " "
												+ lun_date.format("hh:mm:ss"));
								$(parentName + '#selectTime').attr("lunardate",
										lun_date.format("yyyy-MM-dd hh:mm:ss"));
								$(parentName + '#selectTime').attr("datetype",
										dateType);
							}
						}
						type = "lunardate";
					} else {
						$(parentName + '.repeat-extend li:last').show();
						if ($(parentName + "#isAllDayTask").attr("checked") == 'checked') {
							$(parentName + '#selectTime').val(
									slTimeObj.target.val().split(' ')[0]);
							$(parentName + '#selectTime1').val(
									slTimeObj.target.val().split(' ')[0]);
							$(parentName + '#selectTime').attr(
									"solardate",
									$(parentName + "#selectTime1").attr(
											"solardate"));
						} else {
							if ($(parentName + '#selectTime').attr("datetype") == undefined) {
								$(parentName + '#selectTime').attr(
										"solardate",
										$(parentName + '#selectTime').attr(
												"startvalue"));
								$(parentName + '#selectTime').attr("datetype",
										dateType);
							} else if ($(parentName + '#selectTime').attr(
									"datetype") != "solarDate") {
								$(parentName + '#selectTime1').val(
										slTimeObj.target.val());
								var solarD = $(parentName + '#selectTime1')
										.attr("solardate");
								var sol_date = new Date(solarD.replace(/\-/g,
										"/"));
								sol_date.setHours(sol_date.getHours() - 1);
								$(parentName + '#selectTime').val(
										slTimeObj.target.val().split(' ')[0]
												+ " "
												+ sol_date.format("hh:mm:ss"));
								$(parentName + '#selectTime').attr("solardate",
										sol_date.format("yyyy-MM-dd hh:mm:ss"));
								$(parentName + '#selectTime').attr("datetype",
										dateType);
							}
						}
						type = "solardate";
					}
					var startTime_s = $(parentName + '#selectTime').attr(type);
					var end_s = $(parentName + '#selectTime1').attr(type);
					endTime = new Date(end_s.replace(/\-/g, "/"));
					startTime = new Date(startTime_s.replace(/\-/g, "/"));
					if (startTime.getTime() > endTime.getTime()) {
						autoError($("#tips"), "结束时间不能小于开始时间 :(");
					}
				}
			});
$(parentName + "#isAllDayTask").click(
	function() {
		var time_value = $(parentName + "#selectTime").val();
		if ($(this).attr('checked') == "checked") {
			var dd = new Date(parseFloat(currentDate.getTime()));
			$(parentName + "#selectTime").val(
					time_value.split(' ')[0] + " " + dd.format("hh:mm:ss"));
			dd.setHours(dd.getHours() + 1);
			$(parentName + "#selectTime1").val(
					time_value.split(' ')[0] + " " + dd.format("hh:mm:ss"));
		} else {
			$(parentName + "#selectTime").val(time_value.split(' ')[0]);
			$(parentName + "#selectTime1").val(time_value.split(' ')[0]);
		}
	});
}
function ignoreYear(parentName) {
$(parentName + "#isIgnoreCase").click(
	function() {
		var selectTime_value = $(parentName + "#selectTime").val();
		if ($(this).attr('checked') == undefined) {
			$(parentName + "#selectTime").val(selectTime_value.split('年')[1]);
		} else {
			var type = $(parentName + "#selectTime").attr("datetype");
			var attr_type;
			if (type == "lunarDate") {
				time_value = $(parentName + "#selectTime").attr("lunardate");
				attr_type = "lunardate";
			} else if (type == "soldarDate") {
				time_value = $(parentName + "#selectTime").attr("soldardate");
				attr_type = "soldardate";
			} else {
				time_value = $(parentName + "#selectTime").attr("startvalue");
				attr_type = "startvalue";
			}
			var date = new Date(time_value.replace(/\-/g, "/"));
			var now_date = new Date();
			var year = date.getFullYear();
			if (year == 0 || year == 1900) {
				year = now_date.getFullYear();
				var dd = new Date(time_value.replace(/\-/g, "/"));
				dd.setFullYear(year);
				$(parentName + "#selectTime").attr(attr_type,
						dd.format("yyyy-MM-dd hh:mm:ss"));
			}
			$(parentName + "#selectTime").val(year + "年" + selectTime_value);
		}
	});
var date = currentDate;
if ($(parentName + "#isIgnoreCase").attr('checked') == "checked") {
$(parentName + "#selectTime").val(date.format("MM月dd日") + " 10:00:00");
} else {
$(parentName + "#selectTime").val(date.format("yyyy年MM月dd日") + " 10:00:00");
}
}
function checkImgCheck(warpId) {
$(warpId + "#repreat_week .checkItem")
	.click(
			function() {
				if ($(this).children("#repreat_week_all").length == 1) {
					if ($(this).children("#repreat_week_all").attr('checked') == "checked") {
						$(warpId + "#repreat_week .checkItem")
								.children("input").attr('checked', false);
						$(warpId + "#repreat_week .checkItem").children(
								".checkboxImg").removeClass('checkboxImg-on');
					} else {
						$(warpId + "#repreat_week .checkItem")
								.children("input").attr('checked', true);
						$(warpId + "#repreat_week .checkItem").children(
								".checkboxImg").addClass('checkboxImg-on');
					}
				} else {
					if ($(this).children("input").attr('checked') == "checked") {
						$(this).children("input").attr('checked', false);
						$(this).children(".checkboxImg").removeClass(
								'checkboxImg-on');
					} else {
						$(this).children("input").attr('checked', true);
						$(this).children(".checkboxImg").addClass(
								'checkboxImg-on');
					}
				}
			});
}
function changeRepreat(val, parentName) {
if (val == 3) {
$(parentName + " #repreat_week").show();
} else {
$(parentName + " #repreat_week").hide();
}
}
function singlechImgClick(obj, className) {
var cb = $(obj).siblings("input[type='checkbox']");
if (cb.attr('checked') == 'checked') {
$(obj).removeClass(className);
} else {
$(obj).addClass(className);
}
cb.click();
}
function doConverNum(parentName, num) {
var weeks = num.toString(2) + "";
var len = weeks.length;
if (len < 7) {
for (var j = 0; j < 7 - len; j++) {
	weeks = "0" + weeks;
}
}
var ck = false;
var cycleWeeks = $(parentName + " input[class=cycleWeek]");
$(cycleWeeks).each(function(index, item) {
if (weeks.charAt(index) == "1") {
	ck = true;
	$(this).siblings(".checkboxImg").addClass('checkboxImg-on');
} else {
	ck = false;
	$(this).siblings(".checkboxImg").removeClass('checkboxImg-on');
}
$(this).attr('checked', ck);
});
if ($(parentName + " input[class='cycleWeek']:checked").length == 7) {
$(parentName + " .cycleWeekAll").attr('checked', true).siblings(".checkboxImg")
		.addClass('checkboxImg-on');
}
}
function setSltime(parentWindow, id) {
if (id === undefined)
id = "selectTime";
$("#" + parentWindow + " span#" + id).slTime(
	{
		triEvent : "click",
		lunar : false,
		format : 'yyyy-MM-dd hh:mm:ss',
		position : 'absolute',
		callback : function() {
			var datetype = $("#" + parentWindow + " span#datetime").attr(
					"datetype");
			var date = $("#" + parentWindow + " span#datetime").attr(datetype);
			var isNormal = datetype == "solarDate" ? "1" : "0";
			var date_val = new Date(date.replace(/\-/g, "/"));
			var weekDay = getweekDay(date_val.getDay());
			$("#" + parentWindow + " span#datetime").text(
					date_val.format("yyyy年MM月dd日") + " 周" + weekDay);
			$("#" + parentWindow + " #isNormal").val(isNormal);
			$("#" + parentWindow + " #date").val(date);
			$("#" + parentWindow + " span#datetime").append(
					"<span class=\"caret\"></span>");
		}
	});
}
function dbBindAlert(parentName) {
$(parentName + '.save').click(function() {
var $this = $(this);
ZHWNL.Content.operation.alertFormSubmit($this[0].form, parentName, true);
});
}
function updateEndTime(parentName, num, catid, isNormal, cweek) {
var date = new Date();
var time = date.getTime() / 1000;
$(parentName + "#timeleft_alert")
	.each(
			function(i) {
				var endTime = this.getAttribute("end");
				var endDate = new Date(parseFloat(endTime));
				if (isNormal == 0) {
					var solar_date = getSolarDate(endDate.getFullYear(),
							endDate.getMonth() + 1, endDate.getDate(), false);
					endDate = new Date(solar_date.getFullYear(), solar_date
							.getMonth(), solar_date.getDate(), endDate
							.getHours(), endDate.getMinutes(), endDate
							.getSeconds());
				}
				if (num == 1) {
					if (endDate.getTime() < date.getTime()) {
						endDate.setFullYear(date.getFullYear());
						if (endDate.getTime() < date.getTime()) {
							endDate.setFullYear(date.getFullYear() + 1);
						}
						endTime = endDate.getTime();
					}
				}
				if (num == 2) {
					if (endDate.getTime() < date.getTime()) {
						endDate.setFullYear(date.getFullYear());
						if (endDate.getTime() < date.getTime()) {
							if (date.getMonth() != endDate.getMonth()
									|| date.getDate() != endDate.getDate()) {
								endDate.setMonth(date.getMonth() + 1);
							}
						}
						endTime = endDate.getTime();
					}
				} else if (num == 3) {
					cweek = parseInt(cweek);
					var weekStr = cweek.toString(2);
					var num1 = 7 - weekStr.length;
					var showWeek = new Array();
					var j = 0;
					for (var i = 0; i < weekStr.length; i++) {
						var ch = weekStr.charAt(i);
						if (ch == '1') {
							showWeek[j] = "1234567".charAt(i + num1);
							j++;
						}
					}
					date = new Date();
					if (endTime < date.getTime()) {
						endTime = date.getTime();
						var len = showWeek.length;
						var day = date.getDay();
						if (day == 0)
							day = 7;
						for (var n = 0; n < len; n++) {
							if (len >= 1 && showWeek[len - 1] - day <= 0) {
								var date_dd = date.getDate();
								var week = parseInt(showWeek[0]);
								var dd = 7 - day;
								dd = dd + week + date_dd;
								date.setDate(dd);
								endDate = new Date(date.getFullYear(), date
										.getMonth(), date.getDate(), endDate
										.getHours(), endDate.getMinutes(),
										endDate.getSeconds());
								endTime = endDate.getTime();
								break;
							} else if (showWeek[0] - day >= 0) {
								var cha = parseInt(showWeek[0]) - day;
								var date_dd = date.getDate();
								var dd = cha + date_dd;
								date.setDate(dd);
								endDate = new Date(date.getFullYear(), date
										.getMonth(), date.getDate(), endDate
										.getHours(), endDate.getMinutes(),
										endDate.getSeconds());
								endTime = endDate.getTime();
								break;
							} else {
								var cha = parseInt(showWeek[n]) - day;
								if (cha > 0) {
									var date_dd = date.getDate();
									var dd = cha + date_dd;
									date.setDate(dd);
									endDate = new Date(date.getFullYear(), date
											.getMonth(), date.getDate(),
											endDate.getHours(), endDate
													.getMinutes(), endDate
													.getSeconds());
									endTime = endDate.getTime();
									break;
								}
							}
						}
					}
				}
				endTime = endTime / 1000;
				var lag = (endTime - time);
				var isPast = "还有";
				if (lag < 0) {
					lag = time - endTime;
					isPast = "已过去";
				}
				var second = Math.floor(lag % 60);
				var minite = Math.floor((lag / 60) % 60);
				var hour = Math.floor((lag / 3600) % 24);
				var day = Math.floor((lag / 3600) / 24);
				if (day > 0) {
					$(this).html(
							"&nbsp;&nbsp;" + isPast
									+ "</span><span class=\"day\">" + day
									+ "</span>天<span class=\"hour\">" + hour
									+ "</span>小时 ");
					setTimeout("updateEndTime('" + parentName + "','" + num
							+ "','" + catid + "','" + isNormal + "','" + cweek
							+ "')", 1000 * 60 * 60);
				} else {
					if (hour >= 1) {
						$(this).html(
								"&nbsp;&nbsp;" + isPast
										+ "</span><span class=\"hour\">" + hour
										+ "</span>小时<span class=\"minute\">"
										+ minite + "</span>分 ");
						setTimeout("updateEndTime('" + parentName + "','" + num
								+ "','" + catid + "','" + isNormal + "','"
								+ cweek + "')", 1000 * 60);
					} else {
						$(this).html(
								"&nbsp;&nbsp;" + isPast
										+ "</span><span class=\"minute\">"
										+ minite
										+ "</span>分<span class=\"second\">"
										+ second + "</span>秒");
						setTimeout("updateEndTime('" + parentName + "','" + num
								+ "','" + catid + "','" + isNormal + "','"
								+ cweek + "')", 1000);
					}
				}
			});
}
function getweekDay(weekNum) {
var weekDay = "";
switch (weekNum) {
case 1:
weekDay = "一";
break;
case 2:
weekDay = "二";
break;
case 3:
weekDay = "三";
break;
case 4:
weekDay = "四";
break;
case 5:
weekDay = "五";
break;
case 6:
weekDay = "六";
break;
default:
weekDay = "日";
break;
}
return weekDay;
}

/* index.js */

var eventDataList = null;
var _uId = "";
$(function() {
	
calander.init();
$("#indexWindow").next().css("position", "absolute");
for (var year = 1900; year < 2051; year++) {
$("#yearjpDDM").append("<li><a>" + year + "</a></li>");
}
$("#yearjpDDM li a").click(function() {
var year = parseFloat($(this).text());
$("#yearValue").text(year);
var dateTime = currentDate;
calander.showSomeMonth(new Date(dateTime.setFullYear(year)));
});
$('#dropdownYear').bindState(1, "jp-dropdown", true);
$('#dropdownYear').click(function() {
var yearValue = parseInt($("#yearValue").text());
var liHeihgt = $(this).children('ul').children().eq(0).height();
var scrollTop = (yearValue - 1900) * liHeihgt;
$(this).children('ul').scrollTop(scrollTop);
});
$('#dropdownMonth').bindState(1, "jp-dropdown", true);
$('#dropdownMonth li a').click(function() {
var month = parseFloat($(this).text());
$("#monthValue").text(month);
var dateTime = currentDate;
calander.showSomeMonth(new Date(dateTime.setMonth(month - 1)));
});
$('body').bind('click.dropdown', function() {
$(".jp-dropdown-menu").parent().removeClass('jp-dropdown-on');
});
$('body').bind('click.popover', function() {
$(".jp-popover").remove();
});
$("#yjlist")
	.hover(
			function() {
				$(".jp-popover").remove();
				var offset = $(this).offset();
				offset.top = offset.top - $(document).scrollTop();
				offset.left = offset.left - $(document).scrollLeft();
				var height = $(this).height();
				var width = $(this).width();
				var $eventsWarp = $("<div class='jp-popover yjpopover none'></div>");
				$eventsWarp
						.append('<div>\
     <div><span class="yTitle">宜 </span><div class="yjlistC">'
								+ $('#ylist').text()
								+ '</div></div>\
     <div class="ptrt"><span class="jTitle c000">忌 </span><div class="yjlistC c000">'
								+ $('#jlist').text()
								+ '</div></div>\
    </div><div class="blankarrow-left" id="arrow"><div class="arrow_dk"></div><div class="arrow_lt"></div></div>');
				$("body").append($eventsWarp);
				var aHeight = $('#arrow').height();
				var warpHeight = $eventsWarp.height();
				var warpWidth = $eventsWarp.width();
				$('#arrow').css({
					"top" : ((warpHeight - aHeight) / 2) + "px"
				});
				$eventsWarp.css({
					"left" : (offset.left - warpWidth - 24) + "px",
					"top" : (offset.top - (warpHeight - height) / 2) + "px"
				}).show();
				$eventsWarp.hover(function() {
					$eventsWarp.show();
				}, function() {
					$eventsWarp.hide();
				});
			}, function() {
				$(".jp-popover").hide();
			});
var jrHtml = "";
var holidayArr = [];
var nowDate = new Date();
nowDate.setHours(0, 0, 0, 0);
for (jr in festival_main) {
var solarDate = jr;
if (jr.length > 10) {
	var dateStr = jr.replace("*", "");
	var dateLundar = new Date(dateStr);
	solarDate = getSolarDate(nowDate.getFullYear(), dateLundar.getMonth() + 1,
			dateLundar.getDate(), false);
} else {
	solarDate = new Date(solarDate);
}
if (nowDate.getMonth() > solarDate.getMonth()) {
	solarDate.setFullYear(nowDate.getFullYear() + 1);
} else if (nowDate.getMonth() == solarDate.getMonth()) {
	if (nowDate.getDate() > solarDate.getDate())
		solarDate.setFullYear(nowDate.getFullYear() + 1);
}
solarDate = solarDate.format("yyyy/MM/dd");
holidayArr.push(solarDate + "1");
jrHtml += "<li tdate='" + solarDate + "'><a>" + festival_main[jr] + "</a></li>";
}
$("#allVacation ul").append(jrHtml);
$("#allVacation").bindState(1, "jp-dropdown", true);
$("#allVacation li").click(function() {
$("#allVacation #vacationValue").text($(this).text());
$("#fname").text($(this).text());
var dateStr = $(this)[0].getAttribute("tdate");
var sJr = new Date(dateStr);
$("#vaCount").text(chazhitian(sJr, nowDate));
calander.showSomeMonth(sJr);
});
var nowDateStr = nowDate.format("yyyy/MM/dd");
holidayArr.push(nowDateStr);
holidayArr.sort();
var closetTime = holidayArr[0];
for (date in holidayArr) {
if (holidayArr[date] == nowDateStr) {
	if (date != holidayArr.length - 1) {
		closetTime = holidayArr[parseInt(date) + 1];
		break;
	}
}
}
closetTime = closetTime.substr(0, 10);
var festName = $("#allVacation li[tdate='" + closetTime + "']").text();
$("#allVacation #vacationValue").text(festName);
$("#fname").text(festName);
$("#vaCount").text(chazhitian(new Date(closetTime), nowDate));
$('#addEvents').bindState(1, "jp-dropdown", true);
$('#addEvents #liaddNote').click(function() {
setNoteFullHTML();
});
$("#addEvents #liaddSchedule").click(function() {
setScheduleHTML();
});
$("#addEvents #liaddBrithday").click(function() {
setBirthdayHTML();
});
$("#addEvents #liaddMemory").click(function() {
setMemoryHTML();
});
$("#addEvents #liaddCount").click(function() {
setCountHTML();
});

$("#schedulelist").click(function() {
var startEnd = getMonthSandEd(currentDate);
setListHTML("日程", '1000', startEnd.start, startEnd.end);
});
$("#festivallist").click(function() {
var startEnd = getMonthSandEd(currentDate);
setListHTML("节日", '345', startEnd.start, startEnd.end);
});
$("#notelist").click(function() {
var startEnd = getMonthSandEd(currentDate);
setListHTML("记事", '-74533', startEnd.start, startEnd.end);
});
$("#zhwnllogo")
	.hover(
			function() {
				$(".jp-popover").remove();
				var _this = $(this);
				var $popvsWarp = $("<div class='jp-popover logoEWMImgPopver'></div>");
				$popvsWarp
						.append("<div class='logoEWMImgWarp'><img class='logoEWMImg' src='../img/logoEWMImg.png'/></div>\
       <div class='blankarrow-down' style='top:94px;*top:92px;'>\
          <div class='arrow_dk'></div>\
          <div class='arrow_lt'></div></div>");
				$("body").append($popvsWarp);
				var offset = $(this).offset();
				if ($.browser.msie && parseInt($.browser.version) <= 7) {
					$popvsWarp.css({
						"top" : offset.top - $popvsWarp.height() - 10,
						"left" : offset.left + 14,
						"display" : "block"
					});
				} else {
					$popvsWarp.css({
						"top" : offset.top - $popvsWarp.height() - 8,
						"left" : offset.left + 14,
						"display" : "block"
					});
				}
				$popvsWarp.hover(function() {
					$popvsWarp.show();
				}, function() {
					$popvsWarp.hide();
				});
			}, function() {
				$(".jp-popover").hide();
			});
$("#mainCal").mouseout(function() {
$("#detail").remove();
});
});
function setYMVforSelect(currentTime) {
$("#yearValue").text(currentTime.getFullYear());
$("#monthValue").text(currentTime.getMonth() + 1);
}
function closeartDig(id) {
art.dialog.list[id].close();
}
function addNoteDialog() {
var editorHtml = "<div class='fll'>添加记事: &nbsp;</div><div class='jp-dropdown noteTypeWarp' id='noteTypedd'>\
      <div class='noteType' id='noteTypeValue'>默认分类</div><div class='selectdown'></div>\
      <ul class='jp-dropdown-menu noteType-extend'>";
var data = ZHWNL.Content.operation.getNoteType();
if (data != null) {
$.each(data, function(index, item) {
	for ( var key in item) {
		editorHtml += "<li value='" + key + "'>\
          <a>" + item[key]
				+ "</a>\
         </li>";
	}
});
}
editorHtml += "</ul></div>";
var id = "addNoteDialog" + new Date().getTime();
$
	.dialog({
		id : id,
		content : "<form action=''><div class='noteContentWarp'><textarea id='note_title_add' name='title' class='noteContent noteWidth460' placeholder='在这里，记录您的点点滴滴'></textarea></div>"
				+ "<div class='notefoot clearfix'><div class='fll'><div>时间:<span id='datetime'>"
				+ currentDate.format("yyyy年MM月dd日")
				+ "</span></div>"
				+ "<div><input type='button' id='fullEditor' value='完整编辑'/></div>"
				+ "</div><div class='flr'>"
				+ "<input name='rtp' type='hidden' value='AddNoteAction' />"
				+ "<input name='r' type='hidden' value='json' />"
				+ "<input type='hidden' name='image' id='note_image_add' value=''/>"
				+ "<input name='weather' type='hidden' value='' />"
				+ "<input name='templ' type='hidden' value='' />"
				+ "<input name='temph' type='hidden' value='' />"
				+ "<input name='city' type='hidden' value='' />"
				+ "<input id='isNormal' name='isNormal' type='hidden' value='1' />"
				+ "<input id='contentid' name='contentid' type='hidden' value=''/>"
				+ "<input name='catid' id='catid' type='hidden' value='-74533' />"
				+ "<input id='date' name='date' type='hidden' value='"
				+ currentDate.format("yyyy-MM-dd")
				+ " 10:00:00' />"
				+ "<input type='button' class='mr10 mt05' value='保存' onclick=\"ZHWNL.Content.operation.formSubmitAdd1(this.form,'#"
				+ id
				+ " ',false);return false;\"/>"
				+ "<input type='button' class='mt05' id='cancel' value='取消' onclick='art.dialog.list[\""
				+ id + "\"].close();' /></div></div></form>",
		title : editorHtml,
		fixed : true,
		drag : false,
		lock : true,
		init : function() {
			$("#" + id + " #noteTypedd").bindState(1, "jp-dropdown", true);
			$("#" + id + " #noteTypedd li").click(function() {
				$("#" + id + " #noteTypeValue").text($(this).text());
				$("#" + id + " #catid").val(this.getAttribute("value"));
			});
			setSltime(id, "datetime");
		}
	});
}
function loginCallBack(username, uid) {
art.dialog.list["loginDialog"].close();
$("#indexWindow #login").removeClass("loginbtn").addClass("userbtn");
$("#indexWindow #login").unbind();
$("#indexWindow #login").val(username);
_uId = uid;
loadMonthEvent(currentDate);
}
function showDayAgenda() {
if (eventDataList != null) {
$("#mainCal .agenda").remove();
for ( var d in eventDataList) {
	var md = d.substr(4, 4);
	$("#mainCal a.block_content[data=" + md + "]").append(
			'<div title="事件数" class="agenda">' + eventDataList[d].count
					+ '</div>');
}
}
}
function bindAgendaHover() {
$("#mainCal .agenda").parent().parent().unbind();
makeCal.makeAction();
$("#mainCal .agenda")
	.parent()
	.parent()
	.on(
			"mouseover",
			function(e) {
				$(".jp-popover").remove();
				var offset = $(this).offset();
				offset.top = offset.top - $(document).scrollTop();
				offset.left = offset.left - $(document).scrollLeft();
				var height = $(this).height();
				var width = $(this).width();
				var $eventsWarp = $("<div class='jp-popover' style='top:"
						+ (offset.top + height - 5) + "px;left:"
						+ (offset.left - 77 + width) + "px;'></div>");
				var htmlStr = '<div class="blankarrow"><div class="arrow_dk"></div><div class="arrow_lt"></div></div>\
   <div class="jp-popoverContent">\
   <ul>';
				var $td = $(this);
				var hoverdateObject = calData[$td.attr("i")][$td.attr("j")];
				var datetime = hoverdateObject.value;
				try {
					if (eventDataList != null) {
						for (var i = 0; i < eventDataList[datetime
								.format("yyyyMMdd")].list.length; i++) {
							var eventObject = eventDataList[datetime
									.format("yyyyMMdd")].list[i];
							if ($.trim(eventObject.summary) == '') {
								htmlStr += "<li ctype='"
										+ eventObject.content_type
										+ "' contentid='"
										+ eventObject.content_id
										+ "' time='"
										+ eventObject.happen_time
										+ "' title='[图片]'><span class='"
										+ eventObject.content_type
										+ "_icon'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><em>[图片]</em></li>";
							} else {
								htmlStr += "<li ctype='"
										+ eventObject.content_type
										+ "' contentid='"
										+ eventObject.content_id
										+ "' time='"
										+ eventObject.happen_time
										+ "' title='"
										+ eventObject.summary
										+ "'><span class='"
										+ eventObject.content_type
										+ "_icon'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>"
										+ eventObject.summary + "</li>";
							}
						}
					} else {
						return;
					}
				} catch (e) {
					return;
				}
				htmlStr += "</ul>";
				if (eventDataList[datetime.format("yyyyMMdd")].count > 3) {
					htmlStr += '<div class="moreevent" >更多事件</div>';
				}
				htmlStr += "</div>";
				$eventsWarp.append(htmlStr);
				$("body").append($eventsWarp);
				$eventsWarp.hover(function() {
					$(this).show();
				}, function() {
					$(this).hide();
				});
				$eventsWarp.find("li").click(function() {
					var ctype = $(this).attr("ctype");
					var contentid = $(this).attr("contentid");
					var time = $(this).attr("time");
					setDetail(ctype, contentid, datetime.format("yyyy/MM/dd"));
				});
				$eventsWarp.find(".moreevent").click(
						function() {
							var catids = "1000,1003,1004,1005,note";
							var early_time = new Date(datetime.setHours(0, 0,
									0, 0));
							var last_time = new Date(datetime.setHours(23, 59,
									59, 59));
							setODELHTML(catids, early_time, last_time);
						});
			});
$("#mainCal .agenda").parent().parent().on("mouseout", function() {
$(".jp-popover").hide();
});
}
function getMonthSandEd(datetime) {
var start = new Date(datetime);
start.setDate(1);
start.setHours(0, 0, 0, 0);
var end = new Date(datetime);
end.setMonth(end.getMonth() + 1, 0);
end.setHours(23, 59, 59, 59);
return {
start : start,
end : end
};
}
function chazhitian(dateb, datea) {
return parseInt((dateb.getTime() - datea.getTime()) / (1000 * 60 * 60 * 24));
}
function mouseover(date) {
var contents;
var candate = new Date(date);
$("#detail").remove();
if (canlist == null)
return;
for (var i = 0; i < canlist.length; i++) {
var obj = canlist[i];
var _date = new Date(obj.date);
if (date == obj.date) {
	contents = obj.info;
	var $eventsWarp = $("<div id='detail'></div>");
	$eventsWarp
			.html('<div id="_contents" class="contentsdetail">'
					+ '<div><span style="color:#2D2E2D; font-size:12px;line-height:20px; font-weight:700;padding-left:5px;">'
					+ date
					+ '</span></div>'
					+ '<div><span style="width:103px;font-size:12px;line-height:18px;padding-left:5px;">'
					+ contents + '</span></div>' + '</div>');
	$("body").append($eventsWarp);
	var event = arguments.callee.caller.arguments[0];
	var e = event || window.event;
	var scrollX = document.documentElement.scrollLeft
			|| document.body.scrollLeft;
	var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
	var x = e.pageX || e.clientX + scrollX;
	var y = e.pageY || e.clientY + scrollY;
	var con_d = $("#_contents").width();
	var con_h = $("#_contents").height();
	var wd = $("body").width();
	var wh = $("body").height();
	var right = wd - x - con_d;
	var bottom = wh - y - con_h;
	if (right >= 0 && bottom >= 0) {
		$("#_contents").css({
			"left" : (x + 5) + "px",
			"top" : (y + 5) + "px"
		}).show();
		$eventsWarp.css({
			"left" : (x + 5) + "px",
			"top" : (y + 5) + "px"
		}).show();
	} else if (right >= 0 && bottom < 0) {
		$("#_contents").css({
			"left" : (x + 5) + "px",
			"bottom" : "20px"
		}).show();
		$eventsWarp.css({
			"left" : (x + 5) + "px",
			"bottom" : "20px"
		}).show();
	} else if (right < 0 && bottom >= 0) {
		$("#_contents").css({
			"right" : "20px",
			"top" : (y + 5) + "px"
		}).show();
		$eventsWarp.css({
			"right" : "20px",
			"top" : (y + 5) + "px"
		}).show();
	} else {
		$("#_contents").css({
			"left" : (x - con_d - 5) + "px",
			"top" : (y - con_h - 5) + "px"
		}).show();
		$eventsWarp.css({
			"left" : (x - con_d - 5) + "px",
			"top" : (y - con_h - 5) + "px"
		}).show();
	}
	$eventsWarp.hover(function() {
		$eventsWarp.show();
	}, function() {
		$eventsWarp.hide();
	});
	break;
}
}
}

/* module.js */

function setNoteFullHTML(isEidtor, assignTime) {
var $indexW = $("#" + windowArr[windowArr.length - 1]);
var iwHeight = $indexW.height();
var iwContentH = $indexW.find(".content").height();
var currentDate1 = new Date(currentDate);
if (assignTime != undefined) {
currentDate1 = assignTime;
}
var notefullHtml = "<div id='noteFullWindow' style='height:"
	+ iwHeight
	+ "px;top:-"
	+ iwHeight
	+ "px;' class='notefullW'>\
      <form action=''>\
       <div class='head clearfix'>\
        <input type='button'id='btnReturn' class='returnBtn fll' />\
        <input type='button' class='noteTitle fll' value='添加记事' />";
notefullHtml += "<div id='noteTypedd' class='jp-dropdown noteTypeWarp'>\
      <div class='noteTypeWarp-ht'></div>\
      <div id='noteTypeValue' class='noteType'>默认分类</div>\
      <div class='selectdown'></div>\
       <ul class='jp-dropdown-menu noteType-extend'>";
var data = ZHWNL.Content.operation.getNoteType();
if (data != null) {
$
		.each(
				data,
				function(index, item) {
					for ( var key in item) {
						notefullHtml += "<li catidStr='"
								+ key
								+ "' class='clearfix'>\
             <span class='noteName'>"
								+ item[key]
								+ "</span>\
             <span class='none flr'><span class='edit' title='编辑'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span class='delete' title='删除'>&nbsp;&nbsp;&nbsp;&nbsp;</span></span>\
            </li>";
					}
				});
}
var weekDay = getweekDay(currentDate1.getDay());
notefullHtml += "<li id='newNoteType' class='clearfix'>\
           <span id='newType' class='noteName'>+ 新建分类</span>\
           <span class='none flr'><span class='nsure'>&nbsp;&nbsp;&nbsp;</span><span class='ncancel'>&nbsp;&nbsp;&nbsp;</span></span>\
          </li>\
         </ul>\
        </div>\
        <input type='hidden' name='catid_change' id='catid_change' value='-74533' />\
        <input type='hidden' name='catid' id='catid' value='-74533' />\
        <span style='display:none;' id='caname_start'>默认分类</span> \
       </div>\
       <div class='content clearfix' style='height:"
	+ iwContentH
	+ "px;'>\
        <div class='contentHead clearfix'>\
         <div class='fll'>时间：<span id='datetime'>"
	+ currentDate1.format("yyyy年MM月dd日")
	+ " 周"
	+ weekDay
	+ "</span></div>\
         <div id='uploadify' class='flr'></div>\
         <div id='fileQueue' class='none'></div>\
        </div>\
        <div class='noteContentWarp'><textarea style='height:"
	+ (iwContentH - 20 - 28 - 38 - 4)
	+ "px;'\
        class='noteContent' placeholder='在这里，记录您的点点滴滴' id='note_title_add' name='title'></textarea></div>\
        <div class='btnButtom'>\
        <input type='hidden' name='image' id='note_image_add' value=''/>\
        <input name='rtp' type='hidden' value='AddNoteAction' />\
        <input name='weather' type='hidden' value='' />\
        <input name='templ' type='hidden' value='' />\
        <input name='temph' type='hidden' value='' />\
        <input name='city' type='hidden' value='' />\
        <input name='r' type='hidden' value='json' />\
        <input id='isNormal' name='isNormal' type='hidden' value='1' />\
        <input id='contentid' name='contentid' type='hidden' value=''/>\
        <input id='date' name='date' type='hidden' value='"
	+ currentDate1.format("yyyy-MM-dd")
	+ " "
	+ new Date().format("hh:mm:00")
	+ "' />\
        <input type='button' class='save'  />\
        <input type='button' class='cancel' id='cancal' />\
          </div>\
       </div>\
      </form>\
     </div>";
$("#indexWindow").parent().append(notefullHtml);
toOtherWindow("noteFullWindow");
setSltime("noteFullWindow", "datetime");
$('#noteFullWindow .save').click(
	function() {
		var $this = $(this);
		ZHWNL.Content.operation.formSubmitAdd1($this[0].form,
				'#noteFullWindow ', true);
	});
uploadImage($("#uploadify"), _uId);
$("#noteFullWindow").find("#btnReturn").click(function() {
returnIndexWindow("noteFullWindow");
if (isEidtor != undefined && isEidtor) {
	ZHWNL.Content.operation.changeNoteCateType("#noteFullWindow ");
}
});
$("#noteFullWindow #noteTypedd").bindState(1, "jp-dropdown", true);
$("#noteFullWindow #newNoteType")
	.click(
			function(e) {
				returnOriginalStyle();
				$input = $("<input type='text' maxlength='30' id='noteTypeName' class='newTypeInput' placeholder='输入类名...' />");
				var $spannewType = $("#newNoteType #newType");
				$spannewType.hide();
				$spannewType.after($input);
				$("#newNoteType span.none").show();
				$("#newNoteType span.none .ncancel").unbind();
				$("#newNoteType span.none .ncancel").click(function(e) {
					$input.remove();
					$spannewType.show();
					$("#newNoteType span.none").hide();
					e.stopPropagation();
				});
				$("#newNoteType span.none .nsure").unbind();
				$("#newNoteType span.none .nsure").click(
						function(e) {
							var _this = $(this);
							if (_this.hasClass("disabled"))
								return;
							else
								_this.addClass("disabled");
							$input.remove();
							$spannewType.show();
							$("#newNoteType span.none").hide();
							ZHWNL.Content.operation.addCategory(
									$("#noteFullWindow .jp-dropdown-menu"),
									$input.val(), function() {
										_this.removeClass("disabled");
									});
							e.stopPropagation();
						});
				$input.click(function(e) {
					e.stopPropagation();
				});
				e.stopPropagation();
			});
bindNoteTypeList(isEidtor);
}
var isCanSave = true;
function unbindNoteTypeList() {
$("#noteFullWindow #noteTypedd li:not(#newNoteType)").unbind();
$("#noteFullWindow #noteTypedd li:not(#newNoteType) .edit").unbind();
$("#noteFullWindow #noteTypedd li:not(#newNoteType) .delete").unbind();
$("#noteFullWindow #cancal").unbind();
}
function returnOriginalStyle() {
$("#noteFullWindow li input").remove();
$("#noteFullWindow li .none").prev().show();
$("#noteFullWindow li .sure").remove();
$("#noteFullWindow li .cancel").remove();
$("#noteFullWindow li .edit").show();
$("#noteFullWindow li .delete").show();
}
function bindNoteTypeList(isEidtor) {
$("#noteFullWindow #noteTypedd li:first").children(".none").remove();
$("#noteFullWindow #noteTypedd li:not(#newNoteType)").hover(function() {
$(this).find("span.none").show();
}, function() {
$(this).find("span.none").hide();
});
$("#noteFullWindow #noteTypedd li:not(#newNoteType)").click(function() {
$("#noteFullWindow #noteTypeValue").text("");
$("#noteFullWindow #noteTypeValue").text($(this).children().eq(0).text());
$("#noteFullWindow #catid_change").val(this.getAttribute("catidStr"));
if (isEidtor != undefined && isEidtor) {
	var cid = this.getAttribute("catidStr");
	ZHWNL.Content.operation.changeNoteCateType("#noteFullWindow ", cid);
}
});
$("#noteFullWindow #noteTypedd li:not(#newNoteType) .edit")
	.click(
			function(e) {
				returnOriginalStyle();
				var _this = $(this);
				var oInput = $("#noteFullWindow #noteTypedd li:not(#newNoteType) #noteTypeName");
				oInput.prev().show();
				oInput.remove();
				var $name = $(this).parent().prev();
				var $input = $("<input type='text' maxlength='30' id='noteTypeName' class='newTypeInput' placeholder='输入类名...' value='"
						+ $name.text() + "' />");
				$name.hide();
				$name.after($input);
				$(this).hide();
				$(this).next().hide();
				$(this)
						.after(
								"<span class='sure' title='确定'>&nbsp;&nbsp;&nbsp;</span><span class='cancel' title='取消'>&nbsp;&nbsp;&nbsp;</span>");
				$(this).next().click(
						function(e) {
							ZHWNL.Content.operation
									.editCategory($input.val(),
											$input.parent()[0]
													.getAttribute("catidStr"),
											function() {
												$name.text($input.val());
												_this.next().remove();
												_this.next().remove();
												_this.show();
												_this.next().show();
												$input.remove();
												$name.show();
											});
							e.stopPropagation();
						});
				$(this).next().next().click(function(e) {
					returnOriginalStyle();
					e.stopPropagation();
				});
				$input.click(function(e) {
					e.stopPropagation();
				});
				e.stopPropagation();
			});
$("#noteFullWindow #noteTypedd li:not(#newNoteType) .delete").click(
	function(e) {
		var catidValue = $(this).parents("li")[0].getAttribute("catidStr");
		var _this = this;
		ZHWNL.Content.operation.deleteCategory(catidValue, event, function() {
			$(_this).parents("li").remove();
		});
		e.stopPropagation();
	});
$("#noteFullWindow").find("#cancal").click(function() {
$("#noteFullWindow").find("#btnReturn").click();
});
}
var windowArr = [ "indexWindow" ];
function toOtherWindow(targetWindow, callback) {
if (_uId == '') {
$("#indexWindow #login").click();
return;
}
windowArr.push(targetWindow);
var legnth = windowArr.length;
if (legnth >= 3) {
$("#" + targetWindow).css({
	"left" : "100%"
});
}
if ($.browser.msie) {
$('input,textarea').placeholder();
}
$("#" + windowArr[legnth - 2]).animate({
left : "-100%"
}, "slow", function() {
$(this).hide();
});
$("#" + windowArr[legnth - 1]).animate({
left : "0%"
}, "slow", function() {
$(this).css("top", "0");
if (!!callback)
	callback();
});
}
function returnIndexWindow(formWinow, isUpdateData) {
windowArr.pop(formWinow);
var legnth = windowArr.length;
if (!!isUpdateData) {
if (windowArr[legnth - 1] == "datailNoteWindow") {
	var $window = $("#datailNoteWindow");
	setDetail($window.attr("ctype"), $window.attr("contentid"), 0, function() {
		$window.parent().children(":last").replaceAll($window);
	});
	$("#datailNoteWindow").css({
		"top" : 0,
		"left" : "-100%"
	});
}
}
$("#" + windowArr[legnth - 1]).show();
$("#" + formWinow).css("top", "-" + $("#" + formWinow).height() + "px");
$("#" + formWinow).animate({
left : "100%"
}, "slow", function() {
$("#" + formWinow).remove();
});
$("#" + windowArr[legnth - 1]).animate({
left : "0%"
}, "slow");
}
function setBirthdayHTML(assignTime) {
var $indexW = $("#" + windowArr[windowArr.length - 1]);
var iwHeight = $indexW.height();
var iwContentH = $indexW.find(".content").height();
var currentDate1 = new Date(currentDate);
if (assignTime != undefined) {
currentDate1 = assignTime;
}
var birthdayHTML = "<div id='birthdayWindow' style='height:"
	+ iwHeight
	+ "px;top:-"
	+ iwHeight
	+ "px;' class='birthdayW'>\
       <div class='head clearfix'>\
        <input type='button' class='returnBtn fll' id='btnReturn'/>\
        <input type='button' class='noteTitle fll' value='添加生日' />\
       </div>\
       <div class='content' style='height:"
	+ iwContentH
	+ "px;'>\
       <form name='frm' id='frm' >\
        <table class='bwTable'>\
         <tr>\
          <td width='10%'>寿星</td>\
          <td>\
           <input type='hidden' id='friendsMap' maxlength='30' name='contact' value=''>\
           <input type='text' id='title' maxlength='30' name='title' class='bw-input' placeholder='姓名' value=''>\
          </td>\
         </tr>\
         <tr>\
          <td width='10%'>生日</td>\
          <td>\
           <div class='ptrt'>\
            <input type='text' value='"
	+ currentDate1.format('yyyy年MM月dd日')
	+ " 10:00:00' id='selectTime' class='bw-input' \
            readonly startvalue='"
	+ currentDate1.format('yyyy-MM-dd')
	+ " 10:00:00' datetype='solarDate' solardate='"
	+ currentDate1.format("yyyy-MM-dd")
	+ " 10:00:00'>\
            <input type='hidden' value='"
	+ currentDate1.format("yyyy-MM-dd")
	+ " 10:00:00' name='date' id='dateTime'>\
            <input type='hidden' value='1' name='isNormal' id='isNormal'>\
            <input type='hidden' value='' name='contentid' id='contentid'>\
            <span class='timerIcon' id='timerIcon'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>\
           </div>\
          </td>\
         </tr>\
         <tr>\
          <td width='10%'></td>\
          <td>\
           <span id='isIgnoreYearImg' class='iyicon inlineblock'>忽略年份</span>\
           <input type='checkbox' class='vhide' value='1' name='isIgnoreYear' id='isIgnoreCase' />\
          </td>\
         </tr>\
         <tr>\
          <td width='10%'>提醒</td>\
          <td>\
           <div class='jp-dropdown remindTypeWarp' id='remindTypedd'>\
            <div class='remindType' id='remindType'>当天提醒</div>\
            <div class='fll selectdown'></div>\
            <ul class='jp-dropdown-menu remind-extend birRemind-extend'>\
             <li tinter='-1'><a>不提醒</a></li>\
             <li tinter='0'><a>当天提醒</a></li>\
             <li tinter='86400'><a>提前1天</a></li>\
             <li tinter='172800'><a>提前2天</a></li>\
             <li tinter='259200'><a>提前3天</a></li>\
             <li tinter='604800'><a>提前7天</a></li>\
             <li tinter='1296000'><a>提前半个月</a></li>\
             <li tinter='2592000'><a>提前一个月</a></li>\
            </ul>\
           </div>\
           <input type='hidden' value='0' id='advance' name='advance' />\
           <input type='hidden' name='cycle' id='cycle' value='1' />\
          </td>\
         </tr>\
         <tr>\
          <td width='10%'>备注</td>\
          <td>\
           <input type='text' class='bw-input' name='note' id='note' maxlength='30' placeholder='请输入备注内容...'>\
          </td>\
         </tr>\
        </table>\
        <input name='rtp' type='hidden' value='AddAlertAction' id='rtp'>\
        <input name='r' type='hidden' value='json'>\
        <input name='isRing' id='isRing' type='hidden' value='1'>\
        <input name='catid' id='catid' type='hidden' value='1003'/>\
        <div class='btnButtom'>\
         <input type='button' class='save' />\
         <input type='button' class='cancel' id='cancal' />\
        </div>\
        </form>\
       </div>\
      </div>";
$("#indexWindow").parent().append(birthdayHTML);
var $table = $("#birthdayWindow table");
$table.css("margin-bottom", (iwContentH - $table.height() - $(
	"#birthdayWindow .btnButtom").height())
	+ "px");
toOtherWindow("birthdayWindow");
slTime("", '1003');
$('#timerIcon').click(function() {
$('#selectTime').focus();
});
$('#isIgnoreYearImg').click(function() {
singlechImgClick(this, 'iyicon-on');
});
ignoreYear("");
$("#birthdayWindow #remindTypedd").bindState(1, "jp-dropdown", true);
$("#birthdayWindow #remindTypedd li").click(function() {
$("#birthdayWindow #remindType").text($(this).text());
$("#birthdayWindow #advance").val($(this).attr("tinter"));
});
dbBindAlert("#birthdayWindow ");
$("#birthdayWindow").find("#btnReturn").click(function() {
returnIndexWindow("birthdayWindow");
});
$("#birthdayWindow").find("#cancal").click(function() {
$("#birthdayWindow").find("#btnReturn").click();
});
}
function setMemoryHTML(assignTime) {
var $indexW = $("#" + windowArr[windowArr.length - 1]);
var iwHeight = $indexW.height();
var iwContentH = $indexW.find(".content").height();
var currentDate1 = new Date(currentDate);
if (assignTime != undefined) {
currentDate1 = assignTime;
}
var memoryHtml = "<div id='memoryWindow' style='height:"
	+ iwHeight
	+ "px;top:-"
	+ iwHeight
	+ "px;' class='birthdayW'>\
      <div class='head clearfix'>\
       <input type='button' class='returnBtn fll' id='btnReturn'/>\
       <input type='button' class='noteTitle fll' value='添加纪念日' />\
      </div>\
      <div class='content' style='height:"
	+ iwContentH
	+ "px;'>\
       <form name='frm' id='frm'>\
       <table id='hl_alertTable' class='bwTable'>\
        <tr>\
         <td width='10%'>标题</td>\
          <td><input type='text' class='bw-input' name='title' id='title' maxlength='100' placeholder='请输入内容...'>\
          <input type='hidden' id='friendsMap1' maxlength='30' name='contact' value=''>\
         </td>\
        </tr>\
        <tr>\
         <td width='10%'>时间</td>\
         <td>\
          <div class='ptrt'>\
           <input type='text' value='"
	+ currentDate1.format("yyyy年MM月dd日")
	+ " 10:00:00' id='selectTime' class='bw-input' readonly startvalue='"
	+ currentDate1.format('yyyy-MM-dd')
	+ " 10:00:00' datetype='solarDate' solardate='"
	+ currentDate1.format('yyyy-MM-dd')
	+ " 10:00:00'>\
           <input type='hidden' value='"
	+ currentDate1.format("yyyy-MM-dd")
	+ " 10:00:00' name='date' id='dateTime'>\
           <input type='hidden' value='1' name='isNormal' id='isNormal'>\
           <input type='hidden' value='' name='contentid' id='contentid'>\
           <span class='timerIcon' id='timerIcon'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>\
          </div>\
          </td>\
        </tr>\
        <tr>\
         <td width='10%'>提醒</td>\
         <td>\
          <div class='selectW-W'>\
           <div class='jp-dropdown remindTypeWarp' id='remindTypedd'>\
            <div class='remindType' id='remindType'>当天提醒</div>\
            <div class='fll selectdown'></div>\
            <ul class='jp-dropdown-menu remind-extend'>\
             <li tinter='-1'><a>不提醒</a></li>\
             <li tinter='0'><a>当天提醒</a></li>\
             <li tinter='86400'><a>提前1天</a></li>\
             <li tinter='172800'><a>提前2天</a></li>\
             <li tinter='259200'><a>提前3天</a></li>\
             <li tinter='604800'><a>提前7天</a></li>\
             <li tinter='1296000'><a>提前半个月</a></li>\
             <li tinter='2592000'><a>提前一个月</a></li>\
            </ul>\
           </div>\
          </div>\
          <input type='hidden' value='0' id='advance' name='advance' />\
         </td>\
        </tr>\
        <tr>\
         <td width='10%'>重复</td>\
         <td>\
          <div class='selectW-W fll'>\
           <div class='jp-dropdown repeatTypeWarp' id='repeatTypedd'>\
            <div class='repeatType' id='repeatType'>按年重复</div>\
            <div class='fll selectdown'></div>\
            <ul class='jp-dropdown-menu repeat-extend'>\
             <li rpCycle='0'><a>不重复</a></li>\
             <li rpCycle='1'><a>按年重复</a></li>\
             <li rpCycle='2'><a>按月重复</a></li>\
             <li rpCycle='3'><a>按天重复</a></li>\
            </ul>\
           </div>\
          </div>\
          <input type='hidden' name='cycle' id='cycle' value='1' />\
         </td>\
        </tr>\
           <tr id='repreat_week' style='display: none; '>\
         <td width='10%'>每周</td>\
         <td class='checkboxRepeat'>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' id='repreat_week_all' class='cycleWeekAll'>\
           <label>全选</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>一</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>二</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>三</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>四</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>五</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>六</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>日</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <input type='hidden' name='cycleWeek' value=''>\
         </td>\
        </tr>\
        <tr>\
         <td width='10%'>地址</td>\
         <td>\
          <input type='text' id='keyword' name='address' class='bw-input' maxlength='100' value='' placeholder='请输入地址...'>\
          <input type='hidden' value='' id='mapX' name='mapX'>\
          <input type='hidden' value='' id='mapY' name='mapY'>\
         </td>\
        </tr>\
       </table>\
       <input name='rtp' type='hidden' value='AddAlertAction' id='rtp'>\
       <input name='r' type='hidden' value='json'>\
       <input name='isRing' id='isRing' type='hidden' value='1'>\
       <input name='catid' id='catid' type='hidden' value='1004'/>\
       <div class='clearfix btnButtom btnButtom-extend'>\
        <input type='button' id='sure' class='save'/>\
           <input type='button' id='cancel' class='cancel' />\
       </div>\
      </form>\
     </div>\
    </div>";
$("#indexWindow").parent().append(memoryHtml);
toOtherWindow("memoryWindow");
slTime("", '1004');
$('#timerIcon').click(function() {
$('#selectTime').focus();
});
$("#memoryWindow #remindTypedd").bindState(1, "jp-dropdown", true);
$("#memoryWindow #remindTypedd li").click(function() {
$("#memoryWindow #remindTypedd #remindType").text($(this).text());
$("#memoryWindow #advance").val($(this).attr("tinter"));
});
$("#memoryWindow #repeatTypedd").bindState(1, "jp-dropdown", true);
$("#memoryWindow #repeatTypedd li").click(function() {
$("#memoryWindow #repeatTypedd #repeatType").text($(this).text());
changeRepreat($(this).attr("rpCycle"), '#memoryWindow');
$("#memoryWindow #cycle").val($(this).attr("rpCycle"));
});
$('#isAllDayTaskImg').click(function() {
singlechImgClick(this, 'adcbImg1');
});
checkImgCheck("");
dbBindAlert("#memoryWindow ");
$("#memoryWindow").find("#btnReturn").click(function() {
returnIndexWindow("memoryWindow");
});
$("#memoryWindow").find("#cancel").click(function() {
$("#memoryWindow").find("#btnReturn").click();
});
}
function setCountHTML(assignTime) {
var $indexW = $("#" + windowArr[windowArr.length - 1]);
var iwHeight = $indexW.height();
var iwContentH = $indexW.find(".content").height();
var currentDate1 = new Date(currentDate);
if (assignTime != undefined) {
currentDate1 = assignTime;
}
var countHtml = "<div id='countWindow' style='height:"
	+ iwHeight
	+ "px;top:-"
	+ iwHeight
	+ "px;' class='birthdayW'>\
      <div class='head clearfix'>\
       <input type='button'id='btnReturn' class='returnBtn fll' />\
       <input type='button' class='noteTitle fll' value='添加倒数日' />\
      </div>\
      <div class='content clearfix' style='height:"
	+ iwContentH
	+ "px;'>\
      <form name='frm' class='widow_nei' id='frm'>\
          <table id='hl_alertTable' class='bwTable'>\
        <tr>\
         <td width='10%'>标题</td>\
         <td>\
          <input type='text' class='bw-input' name='title' id='title' maxlength='100' placeholder='请输入内容...'>\
          <input type='hidden' id='friendsMap1' maxlength='30' name='contact' value=''>\
         </td>\
        </tr>\
        <tr>\
         <td width='10%'>时间</td>\
         <td>\
          <div class='ptrt'>\
           <input type='text' value='"
	+ currentDate1.format('yyyy年MM月dd日 hh:mm:00')
	+ "' id='selectTime' class='bw-input' readonly startvalue='"
	+ currentDate1.format('yyyy-MM-dd hh:mm:00')
	+ "' datetype='solarDate' solardate='"
	+ currentDate1.format('yyyy-MM-dd hh:mm:00')
	+ "'>\
           <input type='hidden' value='"
	+ currentDate1.format('yyyy-MM-dd hh:mm:00')
	+ "' name='date' id='dateTime'>\
           <input type='hidden' value='1' name='isNormal' id='isNormal'>\
           <input type='hidden' value='' name='contentid' id='contentid'>\
           <span class='timerIcon' id='timerIcon'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>\
          </div>\
          </td>\
              </tr>\
              <tr>\
         <td width='10%'>提醒</td>\
         <td>\
          <div class='selectW-W'>\
           <div class='jp-dropdown remindTypeWarp' id='remindTypedd'>\
            <div class='remindType' id='remindType'>正点提醒</div>\
            <div class='fll selectdown'></div>\
            <ul class='jp-dropdown-menu remind-extend'>\
             <li tinter='-1'><a>不提醒</a></li>\
             <li tinter='0'><a>正点提醒</a></li>\
             <li tinter='300'><a>提前5分钟</a></li>\
             <li tinter='600'><a>提前10分钟</a></li>\
             <li tinter='1800'><a>提前30分钟</a></li>\
             <li tinter='3600'><a>提前1小时</a></li>\
             <li tinter='86400'><a>提前1天</a></li>\
             <li tinter='259200'><a>提前3天</a></li>\
            </ul>\
           </div>\
          </div>\
          <input type='hidden' value='0' id='advance' name='advance' />\
         </td>\
        </tr>\
        <tr>\
         <td width='10%'>重复</td>\
         <td>\
          <div class='selectW-W fll'>\
           <div class='jp-dropdown repeatTypeWarp' id='repeatTypedd'>\
            <div class='repeatType' id='repeatType'>不重复</div>\
            <div class='fll selectdown'></div>\
            <ul class='jp-dropdown-menu repeat-extend'>\
             <li rpCycle='0'><a>不重复</a></li>\
             <li rpCycle='1'><a>按年重复</a></li>\
             <li rpCycle='2'><a>按月重复</a></li>\
             <li rpCycle='3'><a>按天重复</a></li>\
            </ul>\
           </div>\
          </div>\
          <input type='hidden' name='cycle' id='cycle' value='0' />\
         </td>\
        </tr>\
        <tr id='repreat_week' style='display: none; '>\
         <td width='10%'>每周</td>\
         <td class='checkboxRepeat'>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' id='repreat_week_all' class='cycleWeekAll'>\
           <label>全选</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>一</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>二</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>三</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>四</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>五</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>六</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <span class='checkItem inlineblock'>\
           <input type='checkbox' class='cycleWeek'>\
           <label>日</label>\
           <span class='checkboxImg'>&nbsp;</span>\
          </span>\
          <input type='hidden' name='cycleWeek' value=''>\
         </td>\
        </tr>\
       </table>\
       <input name='rtp' type='hidden' value='AddAlertAction' id='rtp'>\
       <input name='r' type='hidden' value='json'>\
       <input name='isRing' id='isRing' type='hidden' value='1'>\
       <input name='catid' id='catid' type='hidden' value='1005'>\
       <div class='clearfix btnButtom btnButtom-extend'>\
        <input type='button' id='sure' class='save'>\
        <input type='button' id='cancel' class='cancel' >\
       </div>\
      </form>\
      </div>\
    </div>";
$("#indexWindow").parent().append(countHtml);
toOtherWindow("countWindow");
slTime("", '1005');
$('#timerIcon').click(function() {
$('#selectTime').focus();
});
$("#countWindow #remindTypedd").bindState(1, "jp-dropdown", true);
$("#countWindow #remindTypedd li").click(function() {
$("#countWindow #remindTypedd #remindType").text($(this).text());
$("#countWindow #advance").val($(this).attr("tinter"));
});
$("#countWindow #repeatTypedd").bindState(1, "jp-dropdown", true);
$("#countWindow #repeatTypedd li").click(function() {
$("#countWindow #repeatTypedd #repeatType").text($(this).text());
changeRepreat($(this).attr("rpCycle"), '#countWindow');
$("#countWindow #cycle").val($(this).attr("rpCycle"));
});
$('#isAllDayTaskImg').click(function() {
singlechImgClick(this, 'adcbImg1');
});
checkImgCheck("");
dbBindAlert("#countWindow ");
$("#countWindow").find("#btnReturn").click(function() {
returnIndexWindow("countWindow");
});
$("#countWindow").find("#cancel").click(function() {
$("#countWindow").find("#btnReturn").click();
});
}
function setScheduleHTML(assignTime) {
var $indexW = $("#" + windowArr[windowArr.length - 1]);
var iwHeight = $indexW.height();
var iwContentH = $indexW.find(".content").height();
var currentDate1 = new Date(currentDate);
if (assignTime != undefined) {
currentDate1 = assignTime;
}
var beginTime = currentDate1.format('yyyy年MM月dd日 hh:mm:00');
var beginTime1 = currentDate1.format('yyyy-MM-dd hh:mm:00');
currentDate1.setHours(currentDate1.getHours() + 1);
var endTime = currentDate1.format('yyyy年MM月dd日 hh:mm:00');
var endTime1 = currentDate1.format('yyyy-MM-dd hh:mm:00');
var scheduleHtml = "<div id='scheduleWindow' style='height:"
	+ iwHeight
	+ "px;top:-"
	+ iwHeight
	+ "px;' class='birthdayW'>\
       <div class='head'>\
        <input type='button' id='btnReturn' class='returnBtn fll' />\
        <input type='button' class='addTitlt fll' value='添加日程' />\
       </div>\
       <div class='content' style='height:"
	+ iwContentH
	+ "px;'>\
        <form name='frm' class='widow_nei' id='frm'>\
            <table id='hl_alertTable' class='bwTable' style='line-height:40px;'>\
          <tr>\
           <td width='10%'>内容</td>\
           <td>\
            <input type='text' class='bw-input' name='title' id='title' placeholder='请输入内容...(最多一百字)' maxlength='100'>\
            <input type='hidden' id='friendsMap1' maxlength='30' name='contact' value=''>\
           </td>\
          </tr>\
                <tr>\
           <td width='10%'>开始</td>\
           <td>\
            <div class='ptrt'>\
             <input type='text' value='"
	+ beginTime
	+ "' id='selectTime' class='bw-input' readonly startvalue='"
	+ beginTime1
	+ "' datetype='solarDate' solardate='"
	+ beginTime1
	+ "'>\
             <input type='hidden' value='"
	+ beginTime1
	+ "' name='date' id='dateTime'>\
             <input type='hidden' value='1' name='isNormal' id='isNormal'>\
             <span class='timerIcon' id='timerIcon'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>\
            </div>\
            </td>\
             </tr>\
          <tr>\
           <td width='10%'>结束</td>\
           <td>\
            <div class='ptrt'>\
             <input type='text' value='"
	+ endTime
	+ "' id='selectTime1' class='bw-input' readonly startvalue='"
	+ endTime1
	+ "' datetype='solarDate' solardate='"
	+ endTime1
	+ "'>\
             <input type='hidden' value='"
	+ endTime1
	+ "' name='endDate' id='dateTime1'>\
             <span class='timerIcon' id='timerIcon1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>\
            </div>\
            </td>\
          </tr>\
                <tr class='lineH32'>\
           <td width='10%'>全天</td>\
           <td class='ptrt'>\
            <input type='checkbox' class='vhide' value='1' name='isAllDayTask' id='isAllDayTask'>\
            <span id='isAllDayTaskImg' class='iyicon inlineblock alldayIcon'>&nbsp;</span>\
           </td>\
                </tr>\
                <tr>\
           <td width='10%'>提醒</td>\
           <td>\
            <div class='selectW-W fll'>\
             <div class='jp-dropdown remindTypeWarp' id='remindTypedd'>\
              <div class='remindType' id='remindType'>正点提醒</div>\
              <div class='fll selectdown'></div>\
              <ul class='jp-dropdown-menu remind-extend select-extend'>\
               <li tinter='-1'><a>不提醒</a></li>\
               <li tinter='0'><a>正点提醒</a></li>\
               <li tinter='300'><a>提前5分钟</a></li>\
               <li tinter='600'><a>提前10分钟</a></li>\
               <li tinter='1800'><a>提前30分钟</a></li>\
               <li tinter='3600'><a>提前1小时</a></li>\
               <li tinter='86400'><a>提前1天</a></li>\
               <li tinter='259200'><a>提前3天</a></li>\
              </ul>\
             </div>\
             <input type='hidden' value='0' id='advance' name='advance' />\
            </div>\
            <div class='fll'>\
             <div class='fll' style='height:42px;line-height:42px;margin:0 23px;'>重复</div>\
             <div class='selectW-W fll'>\
              <div class='jp-dropdown repeatTypeWarp' id='repeatTypedd'>\
               <div class='repeatType' id='repeatType'>不重复</div>\
               <div class='fll selectdown'></div>\
               <ul class='jp-dropdown-menu repeat-extend'>\
                <li rpCycle='0'><a>不重复</a></li>\
                <li rpCycle='1'><a>按年重复</a></li>\
                <li rpCycle='2'><a>按月重复</a></li>\
                <li rpCycle='3'><a>按天重复</a></li>\
               </ul>\
              </div>\
             </div>\
             <input type='hidden' name='cycle' id='cycle' value='0' />\
             </div>\
                 </td>\
                  </tr>\
          <tr id='repreat_week' class='lineH32 none'>\
           <td width='10%'>每周</td>\
           <td class='checkboxRepeat'>\
            <span class='checkItem inlineblock ml03'>\
             <input type='checkbox' id='repreat_week_all' class='cycleWeekAll'>\
             <label>全选</label>\
             <span class='checkboxImg'>&nbsp;</span>\
            </span>\
            <span class='checkItem inlineblock'>\
             <input type='checkbox' class='cycleWeek'>\
             <label>一</label>\
             <span class='checkboxImg'>&nbsp;</span>\
            </span>\
            <span class='checkItem inlineblock'>\
             <input type='checkbox' class='cycleWeek'>\
             <label>二</label>\
             <span class='checkboxImg'>&nbsp;</span>\
            </span>\
            <span class='checkItem inlineblock'>\
             <input type='checkbox' class='cycleWeek'>\
             <label>三</label>\
             <span class='checkboxImg'>&nbsp;</span>\
            </span>\
            <span class='checkItem inlineblock'>\
             <input type='checkbox' class='cycleWeek'>\
             <label>四</label>\
             <span class='checkboxImg'>&nbsp;</span>\
            </span>\
            <span class='checkItem inlineblock'>\
             <input type='checkbox' class='cycleWeek'>\
             <label>五</label>\
             <span class='checkboxImg'>&nbsp;</span>\
            </span>\
            <span class='checkItem inlineblock'>\
             <input type='checkbox' class='cycleWeek'>\
             <label>六</label>\
             <span class='checkboxImg'>&nbsp;</span>\
            </span>\
            <span class='checkItem inlineblock'>\
             <input type='checkbox' class='cycleWeek'>\
             <label>日</label>\
             <span class='checkboxImg'>&nbsp;</span>\
            </span>\
            <input type='hidden' name='cycleWeek' value='' />\
           </td>\
                </tr>\
          <tr>\
           <td width='10%'>地址</td>\
           <td>\
            <input type='text' id='keyword' name='address' class='bw-input' maxlength='100' placeholder='请输入地址...（选填）'>\
            <input type='hidden' value='' id='mapX' name='mapX'>\
            <input type='hidden' value='' id='mapY' name='mapY'>\
           </td>\
             </tr>\
            </table>\
         <input name='rtp' type='hidden' value='AddAlertAction' id='rtp' />\
         <input name='catid' id='catid' type='hidden' value='1000' />\
         <input name='r' type='hidden' value='json' />\
         <input name='isRing' id='isRing' type='hidden' value='1' />\
         <input type='hidden' value='' name='contentid' id='contentid' />\
        <div class='clearfix btnButtom btnButtom-extend'>\
         <input type='button' id='sure' class='save'>\
            <input type='button' id='cancel' class='cancel' />\
        </div>\
        </form>\
       </div>\
      </div>";
$("#indexWindow").parent().append(scheduleHtml);
toOtherWindow("scheduleWindow");
slTime("", "1000");
slTimeEnd("");
$('#timerIcon').click(function() {
$("#selectTime").focus();
});
$('#timerIcon1').click(function() {
$("#selectTime1").focus();
});
$("#isAllDayTaskImg").click(function() {
singlechImgClick(this, "iyicon-on");
});
$("#scheduleWindow #remindTypedd").bindState(1, "jp-dropdown", true);
$("#scheduleWindow #remindTypedd li").click(function() {
$("#scheduleWindow #remindTypedd #remindType").text($(this).text());
$("#scheduleWindow #advance").val($(this).attr("tinter"));
});
$("#scheduleWindow #repeatTypedd").bindState(1, "jp-dropdown", true);
$("#scheduleWindow #repeatTypedd li").click(function() {
$("#scheduleWindow #repeatTypedd #repeatType").text($(this).text());
changeRepreat($(this).attr("rpCycle"), '#scheduleWindow');
$("#scheduleWindow #cycle").val($(this).attr("rpCycle"));
});
checkImgCheck("");
dbBindAlert("#scheduleWindow ");
$("#scheduleWindow").find("#btnReturn").click(function() {
returnIndexWindow("scheduleWindow");
});
$("#scheduleWindow").find("#cancel").click(function() {
$("#scheduleWindow").find("#btnReturn").click();
});
}
function setListHTML(typeName, value, early_time, last_time) {
showGlobalLoading("数据加载中...");
var $indexW = $("#" + windowArr[windowArr.length - 1]);
var iwHeight = $indexW.height();
var $content = $indexW.find(".content");
var iwContentH = $content.height() + parseInt($content.css("padding-top"))
	+ parseInt($content.css("padding-bottom"));
var listHTML = "<div id='listWindow' class='listW' style='height:"
	+ iwHeight
	+ "px;top:-"
	+ (iwHeight)
	+ "px;'>\
      <div class='head clearfix'>\
       <input type='button' class='returnBtn fll' id='btnReturn' />\
       <div class='fll jp-dropdown evventType' id='eventType'>\
        <div>\
         <div class='fll' id='eventTypeValue' value="
	+ value
	+ ">"
	+ typeName
	+ "</div>\
         <div class='fll selectdown'></div>\
        </div>\
        <ul class='jp-dropdown-menu' id='selectType'>\
         <li id='liaddSchedule' value='1000'><a>日程</a></li>\
         <li id='liaddFestival' value='345'><a>节日</a></li>\
         <li id='liaddNote' value='-74533'><a>记事</a></li>\
        </ul>\
       </div>\
       <div class='plus jp-dropdown fll' id='addEvents'>\
        <ul class='jp-dropdown-menu'>\
         <li style='*margin-top:-18px;'>\
          <div class='blankarrow blankarrow-plusEx'><div class='arrow_dk'></div><div class='arrow_lt'></div></div>\
         </li>\
         <li id='liaddBrithday'><a>生日</a></li>\
         <li id='liaddMemory'><a>纪念日</a></li>\
         <li id='liaddCount'><a>倒数日</a></li>\
        </ul>\
       </div>\
      </div>\
      <div class='content' id='listContent' style='height:"
	+ iwContentH
	+ "px;'>\
       <div style='height:"
	+ (iwContentH - 20)
	+ "px;' class='contentInner'>\
        <div class='prev'>\
         <span id='pre_load'>点击加载 <span class='loadMonth' datet='"
	+ getBeforeXMonth(currentDate, 1).format("yyyy/MM/01")
	+ "'>"
	+ getBeforeXMonth(currentDate, 1).format('yyyy年M月')
	+ "</span>的<span id='typeDataBefore'>"
	+ typeName
	+ "</span></span>\
        </div>\
        <div id='listItemContent'></div>\
        <div class='next'>\
         <span id='next_load'>点击加载 <span class='loadMonth' datet='"
	+ getAfterXMonth(currentDate, 1).format("yyyy/MM/01")
	+ "'>"
	+ getAfterXMonth(currentDate, 1).format('yyyy年M月')
	+ "</span>的<span id='typeDataAfter'>"
	+ typeName
	+ "</span></span>\
        </div>\
       </div>\
      </div>\
     </div>";
$("#indexWindow").parent().append(listHTML);
toOtherWindow("listWindow");
bindaddEvents();
$("#listWindow #eventType").bindState(1, "jp-dropdown", true);
$("#listWindow").find("#eventType li").click(function() {
$("#listWindow #eventTypeValue").text($(this).text());
$("#listWindow #eventTypeValue").attr("value", $(this).attr("value"));
selectTypeBindaddEvents();
$("#listWindow #listContent .dataContent").empty();
});
var catids = "";
if ("1000" == value) {
catids = "1000";
} else if ("345" == value) {
catids = "1003,1004,1005";
} else {
catids = "note";
}
var $listContainer = $("#listWindow .contentInner");
function plusEvent() {
var currDate = new Date(new Date(currentDate).setDate(1));
var currentDate1 = new Date(currDate.setHours(0, 0, 0));
var currentDate2 = new Date(currDate.setHours(23, 59, 59));
var $datalist = $("#listWindow #listItemContent");
$listContainer.unbind();
loadList(catids, early_time, last_time, $datalist, function() {
	$listContainer.scrollTop(30);
	BandSrcollEvent();
});
}
plusEvent();
$listContainer.scrollTop(30);
$("#listWindow").find("#liaddFestival").on("click", function() {
catids = "1003,1004,1005";
setDefaultList("节日");
});
$("#listWindow").find("#liaddSchedule").on("click", function() {
catids = "1000";
setDefaultList("日程");
});
$("#listWindow").find("#liaddNote").on("click", function() {
catids = "note";
setDefaultList("记事");
});
function setDefaultList(typeName) {
showGlobalLoading("数据加载中...");
$("#listWindow #listItemContent").empty();
var beforeDT = getBeforeXMonth(currentDate, 1);
$("#listWindow #pre_load .loadMonth").text(beforeDT.format('yyyy年M月')).attr(
		"datet", beforeDT.format("yyyy/MM/01"));
$("#listWindow #pre_load #typeDataBefore").text(typeName);
var afterDT = getAfterXMonth(currentDate, 1);
$("#listWindow #next_load .loadMonth").text(afterDT.format('yyyy年M月')).attr(
		"datet", afterDT.format("yyyy/MM/01"));
$("#listWindow #next_load #typeDataAfter").text(typeName);
plusEvent();
}
$("#listWindow #btnReturn").click(function() {
returnIndexWindow("listWindow");
});
$("#listWindow").find('#pre_load,#next_load').parent().unbind();
$("#listWindow").find('#pre_load,#next_load').parent().click(
	function() {
		showGlobalLoading("数据加载中...");
		var $showTime = $(this).find(".loadMonth");
		var time = $showTime.attr("datet");
		var $datalist = $("#listWindow #listItemContent");
		if ($(this).children("#pre_load").length == 1) {
			moreLoadList(catids, new Date(time), $datalist, true);
			var time = getBeforeXMonth(new Date(time), 1);
			$showTime.text(time.format("yyyy年M月")).attr("datet",
					time.format("yyyy/MM/01"));
		} else {
			moreLoadList(catids, new Date(time), $datalist, false);
			var time = getAfterXMonth(new Date(time), 1);
			$showTime.text(time.format("yyyy年M月")).attr("datet",
					time.format("yyyy/MM/01"));
		}
	});
}
function moreLoadList(catids, month, $datalist, isBefore) {
var currDate1 = new Date(month.setDate(1));
var early = new Date(currDate1.setHours(0, 0, 0));
var latest = new Date(currDate1.setHours(23, 59, 59));
console.log("early_timeline -> latest_timeline (1-moreLoadList)", early
	.format("yyyy年MM月dd日")
	+ " --> " + getLastDayofMonth(latest).format("yyyy年MM月dd日"));
$.post(_baseURL + "/webapi", {
rtp : "QueryList4MonthSlice",
category_ids : catids,
early_timeline : early.getTime(),
latest_timeline : getLastDayofMonth(latest).getTime(),
r : "JSON",
order : "ASC",
num : 1,
v : (new Date()).getTime()
}, function(doc) {
if (null != doc) {
	console.log("early_timeline -> latest_timeline (2-moreLoadList)", early
			.format("yyyy年MM月dd日")
			+ " --> " + getLastDayofMonth(latest).format("yyyy年MM月dd日"));
	ZHWNL.Content.operation.bulidlist(doc, true, true, $datalist, isBefore);
	var currDate = new Date(currentDate);
	if (isBefore) {
		var $prevAll = $datalist.children(
				"[value='" + currDate.format('yyyy/MM/01') + "']").prevAll();
		var listArray = [];
		$prevAll.each(function() {
			listArray.push($(this).attr("value"));
		});
		listArray.sort();
		for (var i = listArray.length - 1; i >= 0; i--) {
			$datalist.prepend($datalist.children("[value='" + listArray[i]
					+ "']"));
		}
	} else {
		var $nextAll = $datalist.children(
				"[value='" + currDate.format('yyyy/MM/01') + "']").nextAll();
		var listArray = [];
		$nextAll.each(function() {
			listArray.push($(this).attr("value"));
		});
		listArray.sort();
		for ( var i in listArray) {
			$datalist.append($datalist.children("[value='" + listArray[i]
					+ "']"));
		}
	}
	hideGlobalLoading();
} else {
	autoInfo($("#tips"), "没有数据");
}
});
}
function BandSrcollEvent() {
var $listContainer = $("#listWindow .contentInner");
$listContainer.unbind();
var scrollValue = 30;
$listContainer.scrollTop(scrollValue);
var after = false;
var before = false;
$listContainer
	.scroll(function() {
		if (before && after) {
			$(this).unbind();
			return;
		}
		if (this.scrollTop < scrollValue) {
			var thrMonth = getBeforeXMonth(currentDate, 4);
			var thrMonthmm = new Date(thrMonth.getFullYear(), thrMonth
					.getMonth(), 1, 0, 0, 0).getTime();
			if (before
					|| (thrMonthmm >= new Date($("#listWindow").find(
							"#pre_load .loadMonth").attr("datet")).getTime())) {
				before = true;
				return;
			} else {
				$("#listWindow").find('#pre_load').parent().click();
				$listContainer.scrollTop(scrollValue);
			}
		} else if (this.scrollTop + scrollValue > this.scrollHeight
				- $(this).height()) {
			var thrMonth = getAfterXMonth(currentDate, 4);
			var thrMonthmm = new Date(thrMonth.getFullYear(), thrMonth
					.getMonth(), 1, 0, 0, 0).getTime();
			if (after
					|| (thrMonthmm <= new Date($("#listWindow").find(
							"#next_load .loadMonth").attr("datet")).getTime())) {
				after = true;
				return;
			} else {
				$("#listWindow").find('#next_load').parent().click();
				$listContainer.scrollTop((this.scrollHeight - $(this).height())
						- scrollValue);
			}
		}
	});
}
function loadList(catids, start, end, $datalist, callback) {
if (catids == "345") {
catids = "1003,1004,1005";
} else if (catids == "-74533") {
catids = "note";
}
setTimeout(function() {
$.post(_baseURL + "/webapi", {
	rtp : "QueryList4MonthSlice",
	category_ids : catids,
	early_timeline : start.getTime(),
	latest_timeline : end.getTime(),
	r : "JSON",
	order : "ASC",
	num : 1,
	v : new Date().getTime()
}, function(doc) {
	if (null != doc) {
		ZHWNL.Content.operation.bulidlist(doc, true, true, $datalist);
		if (!!callback)
			callback();
		hideGlobalLoading();
	} else {
		autoInfo($("#tips"), "没有数据");
	}
});
}, 20);
}
function setScrolltoTop($target, $scroll) {
if ($target.length > 0) {
$scroll.scrollTop($scroll[0].scrollTop + $target.offset().top
		- $scroll.offset().top);
}
}
function selectTypeBindaddEvents() {
var $addEvents = $("#listWindow").find("#addEvents");
var ctype = $("#listWindow #eventTypeValue").attr("value");
$addEvents.unbind();
if (ctype == "1000") {
$addEvents.click(function() {
	setScheduleHTML();
});
} else if (ctype == "345") {
$addEvents.bindState(1, "jp-dropdown", true);
} else {
$addEvents.click(function() {
	setNoteFullHTML();
});
}
}
function bindaddEvents() {
var $addEvents = $("#listWindow").find("#addEvents");
var ctype = $("#listWindow #eventTypeValue").attr("value");
$addEvents.unbind();
if (ctype == "1000") {
$addEvents.click(function() {
	setScheduleHTML();
});
} else if (ctype == "345") {
$addEvents.bindState(1, "jp-dropdown", true);
} else {
$addEvents.click(function() {
	setNoteFullHTML();
});
}
$("#listWindow").find("#liaddBrithday").click(function() {
setBirthdayHTML();
});
$("#listWindow").find("#liaddMemory").click(function() {
setMemoryHTML();
});
$("#listWindow").find("#liaddCount").click(function() {
setCountHTML();
});
}
function modifySchedule(ctype, id) {
var data = ZHWNL.Content.operation.getSingleContent(ctype, id);
if (data != null && data != undefined) {
var catid = data.con.catid;
var divName = "";
if (ctype != "NOTE") {
	if (catid == "1000") {
		setScheduleHTML();
		divName = "#scheduleWindow";
	} else if (catid == "1003") {
		setBirthdayHTML();
		divName = "#birthdayWindow";
	} else if (catid == "1004") {
		setMemoryHTML();
		divName = "#memoryWindow";
	} else if (catid == "1005") {
		setCountHTML();
		divName = "#countWindow";
	}
	setupAlertValue(data, divName);
} else {
	setNoteFullHTML(true);
	setNoteValue(data, "#noteFullWindow");
}
}
}
function setupAlertValue(retData, warpID) {
var title = $(warpID).find("#btnReturn").next().val();
$(warpID).find("#btnReturn").next().val(title.replace("添加", "修改"));
var ret = eval("(" + retData.con.content + ")");
var catname = retData.con.catname;
var content_data;
if (ret.data != "") {
content_data = eval("(" + ret.data + ")");
}
if (content_data != null && typeof content_data.place != "undefined") {
$(warpID + " #keyword").attr("value", content_data.place.address);
$(warpID + " #mapX").val(content_data.place.x);
$(warpID + " #mapY").val(content_data.place.y);
}
if (retData.con.catid == "1003") {
if (ret.syear == 0) {
	$(warpID + " #isIgnoreCase").attr("checked", true);
	$(warpID + " #isIgnoreCase").siblings('span').addClass('iyicon-on');
} else {
	$(warpID + " #isIgnoreCase").attr("checked", false);
	$(warpID + " #isIgnoreCase").siblings('span').removeClass('iyicon-on');
}
}
var modi_date = new Date(parseFloat(retData.con.happen_time));
if (ret.sminute < 10) {
ret.sminute = "0" + ret.sminute;
}
if (ret.shour < 10) {
ret.shour = "0" + ret.shour;
}
if (ret.isNormal == 0) {
var month = modi_date.getMonth() + 1;
var day = modi_date.getDate();
if (month < 10) {
	month = "0" + month;
}
if (day < 10) {
	day = "0" + day;
}
var month_day = calwnl.date.getLundarMD(month + "-" + day, "-");
$(warpID + ' #selectTime').attr("datetype", "lunarDate");
$(warpID + " #selectTime").attr("lunardate",
		modi_date.format("yyyy-MM-dd hh:mm:ss"));
if (retData.con.catid == "1003") {
	if (ret.syear == 0) {
		$(warpID + " #selectTime").val(
				month_day + " " + ret.shour + ":" + ret.sminute + ":00");
		$(warpID + " #selectTime").attr(
				"lunardate",
				new Date().getFullYear() + "-" + modi_date.format("MM-dd")
						+ " " + ret.shour + ":" + ret.sminute + ":00");
	} else {
		$(warpID + " #selectTime").attr(
				"value",
				modi_date.getFullYear() + "年" + month_day + " "
						+ modi_date.format("hh:mm:ss"));
	}
} else {
	$(warpID + " #selectTime").val(
			modi_date.getFullYear() + "年" + month_day
					+ modi_date.format(" hh:mm:ss"));
}
} else {
$(warpID + ' #selectTime').attr("datetype", "solarDate");
if (retData.con.catid == "1003") {
	if (ret.syear == 0) {
		$(warpID + " #selectTime").val(
				modi_date.format("MM月dd日") + " " + ret.shour + ":"
						+ ret.sminute + ":00");
		$(warpID + " #selectTime").attr(
				"solardate",
				new Date().getFullYear() + "-" + modi_date.format("MM-dd")
						+ " " + ret.shour + ":" + ret.sminute + ":00");
	} else {
		$(warpID + " #selectTime")
				.val(modi_date.format("yyyy年MM月dd日 hh:mm:ss"));
		$(warpID + " #selectTime").attr("solardate",
				modi_date.format("yyyy-MM-dd hh:mm:ss"));
	}
} else {
	$(warpID + " #selectTime").val(modi_date.format("yyyy年MM月dd日 hh:mm:ss"));
	$(warpID + " #selectTime").attr("solardate",
			modi_date.format("yyyy-MM-dd hh:mm:ss"));
}
}
$(warpID + " #alert_typeIcon").addClass('selectImg' + retData.con.catid);
if (retData.con.catid == "1000") {
if (content_data != null) {
	if (content_data.isAllDayTask) {
		if (ret.isNormal == 0) {
			var month_day = calwnl.date.getLundarMD(month + "-" + day, "-");
			$(warpID + " #selectTime1").val(
					modi_date.getFullYear() + "年" + month_day);
			$(warpID + " #selectTime").val(
					modi_date.getFullYear() + "年" + month_day);
			$(warpID + " #selectTime1").attr("datetype", 'lunarDate');
			$(warpID + " #selectTime1").attr("lunardate",
					modi_date.format("yyyy-MM-dd hh:mm:ss"));
		} else {
			$(warpID + " #selectTime1").attr("datetype", 'solarDate');
			$(warpID + " #selectTime").val(modi_date.format("yyyy年MM月dd日"));
			$(warpID + " #selectTime1").val(modi_date.format("yyyy年MM月dd日"));
			$(warpID + " #selectTime1").attr("solardate",
					modi_date.format("yyyy-MM-dd hh:mm:ss"));
			$(warpID + " #selectTime").attr("solardate",
					modi_date.format("yyyy-MM-dd hh:mm:ss"));
			$(warpID + " #selectTime").attr("datetype", 'solarDate');
		}
		var cbad = $(warpID + " #isAllDayTask");
		cbad.attr("checked", true);
		cbad.siblings('span').addClass('iyicon-on');
	} else {
		if (typeof content_data.nDate != "undefined") {
			var ndate = new Date(content_data.nDate.year,
					content_data.nDate.month - 1, content_data.nDate.date,
					content_data.nDate.hour, content_data.nDate.minute, 0);
			if (ret.isNormal == 0) {
				var month_n = content_data.nDate.month;
				var day_n = content_data.nDate.date;
				if (month_n < 10) {
					month_n = "0" + month_n;
				}
				if (day_n < 10) {
					day_n = "0" + day_n;
				}
				var month_day = calwnl.date.getLundarMD(month_n + "-" + day_n,
						'-');
				$(warpID + " #selectTime1").val(
						content_data.nDate.year + "年" + month_day
								+ ndate.format(" hh:mm:ss"));
				$(warpID + " #selectTime1").attr("datetype", 'lunarDate');
				$(warpID + " #selectTime1").attr("lunardate",
						ndate.format("yyyy-MM-dd hh:mm:ss"));
			} else {
				$(warpID + " #selectTime1").attr("datetype", 'solarDate');
				$(warpID + " #selectTime1").val(
						ndate.format("yyyy年MM月dd日 hh:mm:ss"));
				$(warpID + " #selectTime1").attr("solardate",
						ndate.format("yyyy-MM-dd hh:mm:ss"));
				$(warpID + " #selectTime").attr("solardate",
						modi_date.format("yyyy-MM-dd hh:mm:ss"));
				$(warpID + " #selectTime").attr("datetype", 'solarDate');
			}
		}
		var cbad = $(warpID + " #isAllDayTask");
		cbad.attr("checked", false);
		cbad.siblings('span').removeClass('iyicon-on');
	}
}
}
$(warpID + " #remindType").text(
	$(warpID + " .remind-extend li[tinter='" + ret.advance + "']").text());
$(warpID + " #advance").val(ret.advance);
$(warpID + " #repeatType").text(
	$(warpID + " .repeat-extend li[rpCycle=" + ret.cycle + "]").text());
changeRepreat(ret.cycle, warpID);
$(warpID + " #cycle").val(ret.cycle);
if (ret.cycle == 3) {
doConverNum(warpID, ret.cycleWeek);
}
$(warpID + " #isRing").val(ret.isRing);
if (content_data != null) {
if (retData.con.catid == "1003") {
	if (typeof content_data.peoples != "undefined") {
		$(warpID + " #friendsMap").val(content_data.peoples.name);
	}
} else {
	if (content_data.peoples !== undefined && content_data.peoples.length > 0) {
		var peoList = "";
		var p = "";
		var peoples = content_data.peoples;
		for (var i = 0; i < peoples.length; i++) {
			p += JSON.stringify(peoples[i]) + ",";
		}
		if (peoples.length > 0) {
			p = p.substring(0, p.lastIndexOf(","));
		}
		$(warpID + " #friendsMap1").val('[' + p + ']');
	}
}
}
var dateTime = modi_date.format("yyyy-MM-dd hh:mm:ss");
$(warpID + " input[name=rtp]").val("ModifyAlertAction");
$(warpID + " input[name=ctype]").val(retData.con.type);
$(warpID + " input[name=catid]").val(retData.con.catid);
if (ret.syear == 0) {
$(warpID + " #dateTime").attr(
		"value",
		modi_date.format("yyyy-MM-dd") + " " + ret.shour + ":" + ret.sminute
				+ ":00");
} else {
$(warpID + " #dateTime").attr("value", dateTime);
}
$(warpID + " #contentid").val(retData.con.id);
$(warpID + " [name='title']").val(ret.title);
$(warpID + " [name='note']").val(ret.note);
}
function setNoteValue(retData, warpID) {
showGlobalLoading("数据加载中");
var title = $(warpID + " #btnReturn").next().val();
if (title != undefined) {
$(warpID + " #btnReturn").next().val(title.replace("添加", "修改"));
}
var ret = eval("(" + retData.con.content + ")");
var catname = retData.con.catname;
if (catname != null && "" != catname) {
catname = catname.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g,
		'&lt;').replace(/>/g, '&gt;');
}
var content_data;
if (ret.data != "") {
content_data = eval("(" + ret.data + ")");
}
$(warpID + " #contentid").val(retData.con.id);
$(warpID + " #catid").val(retData.con.catid);
$(warpID + " #noteTypeValue").text(catname);
$(warpID + " #addCatName").val(catname);
$(warpID + " #catid_change").val(retData.con.catid);
$(warpID + " #caname_start").text(catname);
if (content_data.image != '') {
var $uploadify = $("#uploadify.uploadify");
$("#noteimgOpera").remove();
var $cancel = $("<div class='flr noteimgOpera' id='noteimgOpera'><span>查看图片</span>"
		+ "&nbsp;&nbsp;&nbsp;&nbsp;<span id='cancelImg'>删除图片</span></div>");
$uploadify.after($cancel);
var $viewImage = $cancel.children(":first");
$("#cancelImg").unbind();
$("#cancelImg").click(function() {
	if (confirm("确定删除图片？")) {
		$uploadify.clearQueue();
		$("#note_image_add").val("");
		$("#noteimgOpera").remove();
	}
});
var img = new Image();
if ($.browser.msie) {
	img.onreadystatechange = function() {
		if (img.readyState == "complete" || img.readyState == "loaded") {
			setViewImage(img);
		}
	};
} else {
	img.onload = function() {
		if (img.complete) {
			setViewImage(img);
		}
	};
}
img.src = content_data.image;
function setViewImage(img) {
	var whjson = returnAutoSize(img, 522, 385, -1);
	$viewImage.click(function() {
		$.dialog({
			id : "viewOriginalImage",
			content : "<img src='" + content_data.image + "' width='"
					+ whjson.width + "px' height='" + whjson.height
					+ "px' alt='图片' />",
			fixed : true,
			drag : false,
			lock : true,
			title : false
		});
	});
}
}
if (content_data.city != "" && content_data.weather != ""
	&& content_data.templ != "" && content_data.temph != "") {
$(warpID + " #weather_show").text(
		content_data.city + " " + content_data.weather + " "
				+ content_data.templ + "~" + content_data.temph);
$(warpID + " #weather_show").parent().parent().children(".ndate").removeClass(
		"mt18");
} else {
$(warpID + " #weather_show").text("").parent().parent().children(".ndate")
		.addClass("mt18");
}
var title = ret.title.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(
	/</g, '&lt;').replace(/>/g, '&gt;');
$(warpID + " #note_title_add")[0].value = ret.title;
var isNormal = ret.isNormal;
var date = new Date(parseFloat(retData.con.happen_time));
var dateShow = "";
var weekDay = getweekDay(date.getDay());
dateShow = date.format("yyyy年MM月dd日") + " 周" + weekDay;
if (isNormal == "0") {
dateShow = "农历：" + dateShow;
}
$(warpID + " input[name=isNormal]").val(isNormal);
$(warpID + " #date").val(date.format("yyyy-MM-dd hh:mm:ss"));
$(warpID + " #datetime").html(dateShow);
$(warpID + " input[name=rtp]").val("ModifyNoteAction");
if (content_data != null && content_data != undefined) {
$(warpID + " #note_image_add").val(content_data.image);
$(warpID + " input[name=city]").val(content_data.city);
$(warpID + " input[name=weather]").val(content_data.weather);
$(warpID + " input[name=templ]").val(content_data.templ);
$(warpID + " input[name=temph]").val(content_data.temph);
}
hideGlobalLoading();
}
function setODELHTML(catids, early_time, last_time) {
showGlobalLoading("数据加载中");
var $indexW = $("#" + windowArr[windowArr.length - 1]);
var iwHeight = $indexW.height();
var $content = $indexW.find(".content");
var iwContentH = $content.height();
var listHtml = "<div id='eventListWindow' style='height:"
	+ iwHeight
	+ "px;top:-"
	+ iwHeight
	+ "px;' class='oneDListW'>\
      <div class='head'>\
       <input type='button' class='returnBtn fll' id='return' />\
       <input type='button' class='addTitlt fll' value='"
	+ early_time.format("yyyy年MM月dd日")
	+ "'>\
       <div id='addEvents' class='plus jp-dropdown'>\
        <ul class='jp-dropdown-menu'>\
         <li style='*margin-top:-18px;'>\
          <div class='blankarrow blankarrow-plusEx'><div class='arrow_dk'></div><div class='arrow_lt'></div></div>\
         </li>\
         <li id='liaddSchedule'><a>日程</a></li>\
         <li id='liaddNote'><a>记事</a></li>\
         <li id='liaddBrithday'><a>生日</a></li>\
         <li id='liaddMemory'><a>纪念日</a></li>\
         <li id='liaddCount'><a>倒数日</a></li>\
        </ul>\
       </div>\
      </div>\
      <div class='content' style='height:"
	+ iwContentH + "px;'><div style='height:" + (iwContentH - 20)
	+ "px;margin-bottom:20px;' class='odeList'>";
$.post(_baseURL + "/webapi", {
rtp : "QueryList4TimeSlice",
category_ids : catids,
early_timeline : Math.round(early_time.getTime()),
latest_timeline : Math.round(last_time.getTime()),
r : "JSON",
order : "ASC",
v : new Date().getTime()
}, function(doc) {
if (null != doc) {
	listHtml += ZHWNL.Content.operation.buildMoreEvent(doc, true, true);
	listHtml += "</div></div></div>";
	$("#indexWindow").parent().append(listHtml);
	toOtherWindow("eventListWindow");
	$("#eventListWindow #return").click(function() {
		returnIndexWindow("eventListWindow");
	});
	$("#eventListWindow").find("#addEvents").bindState(1, "jp-dropdown", true);
	var assignTime = new Date(early_time);
	var nowTime = new Date();
	assignTime.setHours(nowTime.getHours(), nowTime.getMinutes(), 0);
	$("#eventListWindow").find("#liaddSchedule").click(function() {
		setScheduleHTML(assignTime);
	});
	$("#eventListWindow").find("#liaddBrithday").click(function() {
		setBirthdayHTML(assignTime);
	});
	$("#eventListWindow").find("#liaddMemory").click(function() {
		setMemoryHTML(assignTime);
	});
	$("#eventListWindow").find("#liaddCount").click(function() {
		setCountHTML(assignTime);
	});
	$("#eventListWindow").find("#liaddNote").click(function() {
		setNoteFullHTML(undefined, assignTime);
	});
	listEventBind("#eventListWindow");
	hideGlobalLoading();
}
});
}
function listEventBind($parentsid) {
var $deletes = $($parentsid + " .content .homelist .delete_in");
$deletes.unbind();
$deletes.click(function(event) {
var contentid = $(this).attr("contentid");
ZHWNL.Content.operation.doDeleteEvent(contentid, $parentsid);
event.stopPropagation();
});
var $edits = $($parentsid + " .content .homelist .edit_in");
$edits.unbind();
$edits.click(function(event) {
var contentid = $(this).attr("contentid");
var ctype = $(this).attr("ctype");
modifySchedule(ctype, contentid);
event.stopPropagation();
});
var $reminds = $($parentsid + " .content .homelist .openRemind");
$reminds.unbind();
$reminds.click(function(event) {
var contentid = $(this).attr("contentid");
var catid = $(this).attr("catid");
var advance = $(this).attr("advance");
ZHWNL.Content.operation.remindSwitch(contentid, catid, 'open', this, advance);
event.stopPropagation();
});
var $closeReminds = $($parentsid + " .content .homelist .closeRemind");
$closeReminds.unbind();
$closeReminds.click(function(event) {
var contentid = $(this).attr("contentid");
var catid = $(this).attr("catid");
var advance = $(this).attr("advance");
ZHWNL.Content.operation.remindSwitch(contentid, catid, 'close', this, advance);
event.stopPropagation();
});
var $homelists = $($parentsid + " .content .homelist");
$homelists.unbind();
$homelists.hover(function() {
$(this).css("background-color", '#dfdfdf');
}, function() {
$(this).css("background-color", '');
});
$homelists.children("table").click(
	function() {
		var _this = $(this);
		if (_this.hasClass("disabled"))
			return;
		else
			_this.addClass("disabled");
		var contentid = $(this).attr("contentid");
		var ctype = $(this).attr("ctype");
		var listDate = "";
		if ($parentsid == "#eventListWindow") {
			listDate = $($parentsid + " .head .addTitlt").attr("value");
			listDate = listDate.substr(0, 4) + "/" + listDate.substr(5, 2)
					+ "/" + listDate.substr(8, 2);
		} else {
			var listTime = $(this).parents(".bb").attr("value");
			listTime = listTime.substr(0, 8);
			listDate = $(this).find("#happenDay").attr("value");
			listDate = listTime + listDate;
		}
		setDetail(ctype, contentid, listDate, null, function() {
			_this.removeClass("disabled");
		});
	});
$homelists.dblclick(function() {
return;
});
}
function setDetail(ctype, id, time, callback, callBackSecond, listTime) {
var $indexW = $("#" + windowArr[windowArr.length - 1]);
var iwHeight = $indexW.height();
var $content = $indexW.find(".content");
var iwContentH = $content.height();
var data = ZHWNL.Content.operation.getSingleContent(ctype, id);
var imgUrl = '';
var valueStr = " ctype='" + ctype + "' contentid='" + id + "' ";
var mdateTime = '';
var catid;
var styleStr = "height:" + iwHeight + "px;top:-" + iwHeight + "px;";
var noteCallBack = null;
if (data != null && data != undefined) {
var ret = eval("(" + data.con.content + ")");
var content_data;
if (ret.data != "") {
	content_data = eval("(" + ret.data + ")");
}
var datailHtml = "";
if (ctype == "NOTE") {
	var catname = data.con.catname;
	if (catname != null && "" != catname) {
		catname = catname.replace(/&/g, '&amp;').replace(/"/g, '&quot;')
				.replace(/</g, '&lt;').replace(/>/g, '&gt;');
	} else {
		catname = "";
	}
	imgUrl = content_data.image;
	var isNormal = ret.isNormal;
	var date = new Date(parseFloat(data.con.happen_time));
	var dateShow = "";
	var weekNum = date.getDay();
	var weekDay = getweekDay(weekNum);
	dateShow = date.format("yyyy年MM月dd日") + " 周" + weekDay;
	if (isNormal == "0") {
		dateShow = "农历：" + dateShow;
	}
	datailHtml = "<div id='datailNoteWindow' "
			+ valueStr
			+ " style='"
			+ styleStr
			+ "' class='oneDListW notedetailW'>\
     <div class='head clearfix'>\
      <input type='button' class='returnBtn fll' id='return'>\
      <input type='button' class='addTitlt fll' value='记事详情'>\
     </div>\
     <div class='content noteDetail' style='height:"
			+ iwContentH
			+ "px;'>\
     <div class='contentHead'>\
      <span class='fll mlr10'>"
			+ dateShow + "</span>\
      <span class='fll' title='记事类型："
			+ catname + "'>"
			+ (catname.length < 14 ? catname : catname.substr(0, 14))
			+ "</span>\
      <span class='flr'>";
	if (imgUrl != "") {
		datailHtml += "<span id='viewImage' style='margin-right:10px;'>查看原图</span>";
	}
	if (ret.title == "" && imgUrl != "") {
		noteCallBack = function() {
			var img = new Image();
			if ($.browser.msie) {
				img.onreadystatechange = function() {
					if (img.readyState == "complete"
							|| img.readyState == "loaded") {
						setViewImage(img);
					}
				};
			} else {
				img.onload = function() {
					if (img.complete) {
						setViewImage(img);
					}
				};
			}
			img.src = imgUrl;
			function setViewImage(img) {
				var newImg = autoSize(img, 484, iwContentH - 75, 1);
				$("#datailNoteWindow").find(".contentData").css({
					"padding" : 0
				});
				$("#datailNoteWindow").find(".noteDetailShow").append(newImg);
			}
		};
	}
	var restitle = ret.title;
	datailHtml += "<span class='edit_in' onclick=\"modifySchedule('"
			+ ctype
			+ "', '"
			+ data.con.id
			+ "');\" title='编辑'>&nbsp;&nbsp;&nbsp;&nbsp;</span>\
      <span class='delete_in' onclick=\"ZHWNL.Content.operation.doDeleteEvent('"
			+ data.con.id
			+ "','#datailNoteWindow');\"  title='删除'>&nbsp;&nbsp;&nbsp;&nbsp;</span>\
     </span>\
    </div>\
    <div class='contentData'><div style='height:"
			+ (iwContentH - 68) + "px;' class='noteDetailShow'>" + restitle
			+ "</div></div>\
   </div>\
   </div>";
} else {
	catid = data.con.catid;
	var catIcon = "festivalIcon";
	var catname;
	var time_string = "时间";
	if (catid == "1000") {
		catname = "日程安排";
		catIcon = "reminderIcon";
	} else if (catid == "1003") {
		catname = "生日";
		time_string = "生日";
	} else if (catid == "1004") {
		catname = "纪念日";
	} else if (catid == "1005") {
		catname = "倒数日";
	}
	var ht = new Date(parseFloat(data.con.happen_time));
	var Anniversary_html = "";
	var Anniversary;
	if (catid == "1003" || catid == "1004") {
		if (ret.syear != 0) {
			if (time == 0) {
				Anniversary = currentDate.getFullYear() - ht.getFullYear();
			} else {
				var listYear = time.substr(0, 4);
				Anniversary = listYear - ht.getFullYear();
			}
			if (catid == "1003") {
				Anniversary_html = "<strong style='font-size:14px;color:orange;padding-left: 15px;'>&nbsp;["
						+ Anniversary + "周岁]</strong>";
			} else {
				Anniversary_html = "<strong style='font-size:14px;color:orange;padding-left: 15px;'>&nbsp;["
						+ Anniversary + "周年]</strong>";
			}
		}
	}
	var newDate = null;
	if (time != 0) {
		newDate = new Date(time);
	} else {
		newDate = new Date(parseFloat(data.con.happen_time));
		if (ret.syear == 0) {
			newDate.setFullYear(new Date().getFullYear());
		}
	}
	newDate.setHours(ht.getHours(), ht.getMinutes(), ht.getSeconds());
	var daojishi = "";
	daojishi = "<strong class='flr'><span end='" + newDate.getTime()
			+ "' id='timeleft_alert' class='timeleft_label'></span></strong>";
	datailHtml = "<div id='datailNoteWindow' "
			+ valueStr
			+ " style='"
			+ styleStr
			+ "' class='oneDListW'>\
       <div class='head clearfix'>\
        <input type='button' class='returnBtn fll' id='return'>\
        <input type='button' class='addTitlt fll' value='"
			+ catname
			+ "详情'>\
       </div>\
       <div class='content eventDetail' style='height:"
			+ iwContentH + "px;'>";
	datailHtml += '<div class="clearfix contentHead">\
             <div class="fll '
			+ catIcon
			+ '"></div>\
             <span class="fll" id="mdateTime"></span>\
             <span class="flr">\
              <span class="edit_in" onclick="modifySchedule(\''
			+ ctype
			+ '\', \''
			+ data.con.id
			+ '\');" title="编辑">&nbsp;&nbsp;&nbsp;&nbsp;</span>\
              <span class="delete_in" onclick="ZHWNL.Content.operation.doDeleteEvent(\''
			+ data.con.id
			+ '\',\'#datailNoteWindow\');" title="删除">&nbsp;&nbsp;&nbsp;&nbsp;</span>\
             </span>\
            </div>\
           <table class="detailtable">\
            <tr>\
             <td width="10%" rowspan="2"></td>\
             <td width="87%" class="title">'
			+ htmlEscape(ret.title)
			+ Anniversary_html
			+ daojishi
			+ '</td></tr>';
	datailHtml += '<tr><td class="line_td ptm8">';
	if (ret.cycle == "0") {
		datailHtml += '<span>不重复</span>';
	} else {
		datailHtml += ZHWNL.Content.operation.cycleString(data.con.happen_time,
				ret.cycle, ret.cycleWeek, ret.isNormal);
	}
	if (ret.isRing != 0) {
		var advance = ret.advance;
		var a = "";
		if (advance == 0) {
			if (catid == "1000" || catid == "1005") {
				a = "正点提醒";
			} else {
				a = "当天提醒";
			}
		} else if (advance == 300) {
			a = "提前5分钟";
		} else if (advance == 600) {
			a = "提前10分钟";
		} else if (advance == 1800) {
			a = "提前30分钟";
		} else if (advance == 3600) {
			a = "提前1小时";
		} else if (advance == 86400) {
			a = "提前1天";
		} else if (advance == 259200) {
			a = "提前3天";
		} else if (advance == 172800) {
			a = "提前2天";
		} else if (advance == 604800) {
			a = "提前7天";
		} else if (advance == 1296000) {
			a = "提前半个月";
		} else if (advance == 2592000) {
			a = "提前1个月";
		}
		datailHtml += '&nbsp;&nbsp;&nbsp;&nbsp;<span>' + a
				+ '</span></td></tr>';
	} else {
		datailHtml += '&nbsp;&nbsp;&nbsp;&nbsp;<span>不提醒</span></td></tr>';
	}
	datailHtml += '<tr><td>&nbsp;</td><td class="line_td">分类: <span>' + catname
			+ '</span></td></tr>';
	var solar_date = ht;
	if (ret.syear == 0) {
		if (ret.sminute < 10) {
			ret.sminute = "0" + ret.sminute;
		}
		if (ret.shour < 10) {
			ret.shour = "0" + ret.shour;
		}
		if (ret.isNormal == 0) {
			var month = solar_date.getMonth() + 1;
			var day = solar_date.getDate();
			if (month < 10) {
				month = "0" + month;
			}
			if (day < 10) {
				day = "0" + day;
			}
			var month_day = calwnl.date.getLundarMD(month + "-" + day, "-");
			datailHtml += '<tr><td>&nbsp;</td><td class="line_td ptm8">'
					+ time_string + ': <span>农历 ' + month_day + " " + ret.shour
					+ ":" + ret.sminute + "&nbsp;&nbsp;</span></td></tr>";
			mdateTime = '农历' + month_day + " " + ret.shour + ":" + ret.sminute;
		} else {
			datailHtml += '<tr><td>&nbsp;</td><td class="line_td ptm8">'
					+ time_string + ': <span>' + solar_date.format("MM月dd日")
					+ " " + ret.shour + ":" + ret.sminute
					+ "&nbsp;&nbsp;</span></td></tr>";
			mdateTime = solar_date.format("MM月dd日") + " " + ret.shour + ":"
					+ ret.sminute;
		}
	} else {
		if (ret.isNormal == 0) {
			solar_date = getSolarDate(ht.getFullYear(), ht.getMonth() + 1, ht
					.getDate(), false);
			solar_date.setHours(ht.getHours());
			solar_date.setMinutes(ht.getMinutes());
		}
		datailHtml += '<tr><td>&nbsp;</td><td class="line_td ptm8">'
				+ time_string + ': <span>'
				+ solar_date.format("yyyy年MM月dd日 hh:mm") + "&nbsp;&nbsp;";
		var lunar = jp_templates.lunar_Info_detail(solar_date);
		datailHtml += " 农历" + (lunar.lunar).substring(2) + '</span></td></tr>';
		mdateTime = solar_date.format("yyyy年MM月dd日 hh:mm");
	}
	if (catid == "1003") {
		datailHtml += '<tr><td>&nbsp;</td><td class="line_td lineH20">备注：<span>';
		if (ret.note != "")
			datailHtml += ret.note;
		else
			datailHtml += "无";
		datailHtml += '</span></td></tr>';
	}
	if (content_data != undefined && content_data != "") {
		if (catid == "1000" || catid == "1004") {
			var p = content_data.peoples;
			if (p != undefined && p.length > 0) {
				datailHtml += '<tr><td>&nbsp;</td><td class="line_td">相关联系人：<span>';
				var len = p.length;
				if (len > 6) {
					len = 6;
				}
				for (var i = 0; i < len; i++) {
					datailHtml += p[i].name + "&nbsp;";
				}
				if (p.length > 6) {
					datailHtml += "...";
				}
				datailHtml += '</span></td></tr>';
			}
			datailHtml += '<tr><td>&nbsp;</td><td class="line_td lineH20">地点：<span>';
			if (content_data != null
					&& typeof content_data.place != "undefined"
					&& content_data.place.address != "") {
				datailHtml += content_data.place.address;
			} else {
				datailHtml += "无";
			}
			datailHtml += '</span></td></tr>';
		}
	}
	datailHtml += '</table></div>';
}
} else {
datailHtml = "操作失败";
}
$("#indexWindow").parent().append(datailHtml);
$("#datailNoteWindow #mdateTime").text(mdateTime).css("margin-left", "8px");
if (!!noteCallBack)
noteCallBack();
if (!!callback) {
callback();
} else {
toOtherWindow("datailNoteWindow", callBackSecond);
}
if (time != 0) {
updateEndTime("#datailNoteWindow ");
}
$("#datailNoteWindow").find("#return").click(function() {
returnIndexWindow("datailNoteWindow");
});
$("#datailNoteWindow #viewImage")
	.click(
			function() {
				showGlobalLoading("数据加载中");
				var img = new Image();
				if ($.browser.msie) {
					img.onreadystatechange = function() {
						if (img.readyState == "complete"
								|| img.readyState == "loaded") {
							setViewImage(img);
						}
					};
				} else {
					img.onload = function() {
						if (img.complete) {
							setViewImage(img);
						}
					};
				}
				img.src = imgUrl;
				function setViewImage(img) {
					var whjson = returnAutoSize(img, 522, 385, -1);
					$.dialog({
						id : "viewOriginalImage",
						content : "<img src='" + imgUrl + "' width='"
								+ whjson.width + "px' height='" + whjson.height
								+ "px' alt='图片' />",
						fixed : true,
						drag : false,
						lock : true,
						title : false
					});
					hideGlobalLoading();
				}
			});
}
function getBeforeXMonth(currDate, x) {
var tarMonth = currDate.getMonth() - x + 1;
var tarYear = currDate.getFullYear();
if (tarMonth < 0) {
tarYear--;
tarMonth = tarMonth + 12;
}
var objDate = new Date(tarYear, tarMonth, 0, 0, 0, 0);
var tarDate = objDate.getDate();
if (tarDate > currDate.getDate()) {
tarDate = currDate.getDate();
}
;
objDate.setDate(tarDate);
return new Date(objDate);
}
function getAfterXMonth(currDate, x) {
var tarMonth = currDate.getMonth() + x + 1;
var tarYear = currDate.getFullYear();
if (tarMonth > 11) {
tarYear++;
tarMonth = tarMonth - 12;
}
var objDate = new Date(tarYear, tarMonth, 0, 23, 59, 59);
var tarDate = objDate.getDate();
if (tarDate > currDate.getDate()) {
tarDate = currDate.getDate();
}
;
objDate.setDate(tarDate);
return new Date(objDate);
}
function getLastDayofMonth(currDate) {
return new Date(getAfterXMonth(currDate, 1).setDate(0));
}

/* loadData.js */
