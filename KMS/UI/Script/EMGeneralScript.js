
//获取项目信息
///reObj 接收选择的项目
//param 单选，多选参数
//projectType 选择的项目类型
//receiveXml 接收选择值的控件
function getProjectInfo(param, json, projectType, receiveXml, callBack) {
    if (projectType == "勘测设计项目" || projectType == "1") {//选择生产项目
        getDivProject(receiveXml, param, json, callBack);
    }
    else if (projectType == "总承包项目" || projectType == "2") {//选择总承包项目
        getDivGCProject(receiveXml, param, json, callBack);
    }
    else if (projectType == "科技项目" || projectType == "4") {//选择科技项目
        getDivTechProject(receiveXml, param, json, callBack);
    }
    else if (projectType == "5") {//选择科标业项目
        getDivEPSProject(receiveXml, param, json, callBack);
    }
    else {
        getDivProject(receiveXml, param, json, callBack);
    }
}