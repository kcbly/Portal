<%@ Control Language="C#" EnableViewState="true" AutoEventWireup="true" CodeBehind="ProjectMgrUser.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.OBS.ProjectMgrUser" %>
<tr runat="server" id="trTY">
    <td colspan="6" class="td-m" nowrap="noWrap">
        <asp:LinkButton runat="server" ID="lbtnCopyProjUser" Text="复制套用历史工程项目组成员&nbsp;&nbsp;"
            activestatus="(23.填写勘测设计任务书)(23.汇总意见)(23.编制计划)" OnClientClick="return copyProjectUser();"
            OnClick="btnCopyProjUser_Click" /><span class="req-star">&nbsp;&nbsp;注：可复制套用历史工程的项目组成员，包括项目管理人员、专业人员。</span>
    </td> 
</tr>
<tr runat="server" id="trRoleConfig" visible="false">
    <td class="td-l">
        选择项目管理角色
    </td>
    <td colspan="5" class="td-m" nowrap="noWrap">
        <asp:Label runat="server" ID="lbTips" Text="请先保存表单再选择需配置项目角色" displaystatus="(123.?)"
            Style="color: Red;"></asp:Label>
        <asp:CheckBoxList runat="server" ID="cblRoles" RepeatDirection="Horizontal" RepeatColumns="9"
            activestatus="(23.填写勘测设计任务书)(23.汇总意见)"
            displaystatus="(23.*)" AutoPostBack="true" OnSelectedIndexChanged="cblRoles_SelectedIndexChanged">
        </asp:CheckBoxList>
        <br />
        <a id="aAddOtherPost" class="aStyle" activestatus="(3.填写勘测设计任务书)(3.汇总意见)(23.编制计划)"
            displaystatus="(23.*)" runat="server" onclick="showSetInfoOtherPost('divAddOtherPost')"><span>添加其他岗位</span></a>
        <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
        <div id="divAddOtherPost" style="display: none" title="添加其他角色岗位">
            <table class="tz-table" width="100%">
                <tr>
                    <td class="td-l">
                        角色名称
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlRoles">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        岗位
                    </td>
                    <td class="td-r">
                        <asp:CheckBoxList ID="cblABSigns" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                        </asp:CheckBoxList>
                        <input type="hidden" runat="server" id="hiABSigns" />
                    </td>
                </tr>
            </table>
        </div>
    </td>
</tr>
<asp:Repeater runat="server" ID="roleRepeater" OnItemDataBound="roleRepeater_ItemDataBound">
    <ItemTemplate>
        <asp:Label ID="lbBegin" runat="server"></asp:Label>
        <td class="td-l">
            <%#Eval("UnitPostName")%>
            <input type="hidden" runat="server" id="hiOrganizationPostId" value='<%#Eval("OrganizationPostId")%>' />
        </td>
        <td class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.填写勘测设计任务书)(23.汇总意见)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,UserCode" PageWidth="850" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode'}">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiUserId" />
        </td>
        <asp:Label ID="lbEnd" runat="server"></asp:Label>
    </ItemTemplate>
</asp:Repeater>
<input type="hidden" runat="server" id="hidProjManagerUserId"/>
<input type="hidden" runat="server" id="hiFilterByRank" value="" />
<input type="hidden" runat="server" id="hiFilterByDept" value="<root><o roleName='分管院长' deptCode='01' /><o roleName='分管总工' deptCode='07' /><o roleName='市场协调人员' deptCode='03' /><o roleName='生产协调人员' deptCode='04' /></root>" />
<!---质量工程师【默认技术质量部的质量工程师】，计划工程师【默认项目组织部门的计划工程师】，财务部【默认财务部的费用工程师】--->
<!---xiedx 增加项目负责人，不按资格筛选--->
<input type="hidden" runat="server" id="hiFilterByDeptRole" value="<root><o roleName='质量工程师' deptCode='07' deptRoleName='质量工程师'/><o roleName='计划工程师' deptCode='hostDept' deptRoleName='计划工程师'/><o roleName='设总' deptCode='hostDept' deptRoleName='设总'/><o roleName='费用工程师' deptCode='10' deptRoleName='费用工程师'/></root>" />
<input type="hidden" runat="server" id="hiHostDeptCode" />
<input type="hidden" runat="server" id="hiMgrCount" />
<script type="text/javascript">
    $(function () {
        initEventOtherPost('divAddOtherPost', 'SaveOtherRolePost');
    });
    //加载div默认事件
    function initEventOtherPost(div, funcName) {
        $("#" + div + ":ui-dialog").dialog("destroy");
        $("#" + div).dialog({
            resizable: false,
            autoOpen: false,
            minHeight: 150,
            minWidth: 300,
            modal: true,
            buttons: {
                "确定": function () {
                    var r = updateConfig(div, funcName, true);
                    if (r == false) { return false; }
                    $(this).dialog("close");
                },
                "取消": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    //弹出对应层
    function showSetInfoOtherPost(div) {
        initEventOtherPost('divAddOtherPost', 'SaveOtherRolePost');
        $("#" + div).dialog('open');
        $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
        return false;
    }

    //更新
    function updateConfig(div, funcName, isLoad) {
        var roleId = $('#<%=ddlRoles.ClientID %>').val();
        if (roleId == "") {
            alert("请选择角色！");
            return false;
        }
        var len = $("#<%=cblABSigns.ClientID%>").find("input:checked").length;
        if (len == "0") {
            alert("请选择岗位！");
            return false;
        }
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }


    function copyProjectUser() {
        var json = { orgId: "<%=ProjectId %>", curActName: "<%=CurActName %>" };
        var url = buildBizUrl(2, null, "EPMS/List/OBS/CopyProjectUser.aspx", json);
        showDivDialog(encodeURI(url), null, 700, 400, afterCopy);
        return false;
    }
    function afterCopy() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnCopyProjUser, "")%>;
    }

    //获取项目负责人信息
    function checkHasChooseProjectManager() {
        var hasChooseProjManager = false;
        var $projManager = $("[specialtyReq=1]");
        if ($projManager.length < 1) {
            hasChooseProjManager = false;
        }
        else {
            for (i = 0; i < $projManager.length; i++) {
                if ($($projManager[i]).val() != "") {
                    hasChooseProjManager = true;
                    break;
                }
            }
        }
        if (!hasChooseProjManager) {
            alert("请配置项目负责人");
            return false;
        }
        return true;
    }   
 
</script>
