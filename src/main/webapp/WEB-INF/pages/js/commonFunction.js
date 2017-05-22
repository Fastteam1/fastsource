
/* Common Function */
//var defaultApp = 'webtube';
var communityIdGlobal = 1;//12891401;//12217479;// 9203765;//12217479;//10020727;
if(localStorage.getItem("communityIdCurrent")) communityIdGlobal = localStorage.getItem("communityIdCurrent");
if(localStorage.getItem("communityId")) loginedUserId = localStorage.getItem("communityId");
//url

var baseUrl = "http://10.1.36.36:8084/ApiBase/api/";

//var appNameCurent = 'myhomework';//webtube
var urlCommon = baseUrl + "login";
var urlCommonOffica = baseUrl + "user/action";
var urlMyHomeWork = baseUrl + "myhomework/action";
var urlWebtube = baseUrl + "webtube/action";
var urlFeedback = baseUrl + "feedback/action";
var urlAppInstaller = baseUrl + "appinstaller/action";
//var urlMyHomeWork = baseUrl + appNameCurent + "/action";
var urlMyHomeWorkPermission = baseUrl + "applicator/action";
var urlUpload = 'http://upload.truelife.vn/cdn/upload';
var urlAppManager = baseUrl + 'appstore/action';
var urlReportEngine = baseUrl + "reportengine/action";
var urlAppRole = baseUrl + "approle/action";
var urlLiveVideo = baseUrl + "livevideo/action";
var URL_visa = baseUrl + "bras/action";
var URL_uservisa = baseUrl + "uservisa/action";
var url_right = baseUrl + "right/action";
var url_role = baseUrl + "role/action";

var URL_visa_ipPool = baseUrl + "ipPool/action";
var URL_visa_category = baseUrl + "category/action";


