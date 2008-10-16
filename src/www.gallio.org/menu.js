function toggle(e, x)
{
    if (document.getElementById(e).style.display == 'none')
    {
        document.getElementById(e).style.display = 'block';
        document.getElementById(x).style.backgroundPosition = '-192px 11px';
    }
    else
    {
        document.getElementById(e).style.display = 'none';
        document.getElementById(x).style.backgroundPosition = '0px 11px';
    }
    saveMenuState();
}

function saveMenuState()
{
    /*  cookie format 'firstSubMenu:block,secondSubMenu:none,thirdSubMenu:block'  */
    var cookieValue = 'aboutSubMenu:';
    cookieValue += document.getElementById('aboutSubMenu').style.display;
    cookieValue += ',';
    cookieValue += 'gettingStartedSubMenu:';
    cookieValue += document.getElementById('gettingStartedSubMenu').style.display;
    cookieValue += ',';
    cookieValue += 'communitySubMenu:';
    cookieValue += document.getElementById('communitySubMenu').style.display;
    
    eraseCookie('gallio.orgMenuState');
    createCookie('gallio.orgMenuState',cookieValue,0);
}

function getMenuState()
{

    var value = readCookie('gallio.orgMenuState');
    if(value == null)
    {
        value = 'aboutSubMenu:none,gettingStartedSubMenu:none,communitySubMenu:none';
    }
    if(value)
    {
        var subMenus = value.split(',');
        for(var i=0;i < subMenus.length;i++)
        {
            var kv = subMenus[i].split(':');
            var subMenu = kv[0];
            var displayStyle = kv[1];
            var parent = subMenu.substring(0, subMenu.length - 7);
            document.getElementById(subMenu).style.display = displayStyle;
            placeBackground(parent, displayStyle);
        }
    }
}
function placeBackground(parent,displayStyle)
{
    if(displayStyle == 'none')
    {
        document.getElementById(parent).style.backgroundPosition = '0px 11px';
    }else{
        document.getElementById(parent).style.backgroundPosition = '-192px 11px';
    }
}

function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function eraseCookie(name) {
	createCookie(name,"",-1);
}

