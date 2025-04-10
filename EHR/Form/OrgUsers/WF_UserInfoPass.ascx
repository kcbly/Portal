<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_UserInfoPass.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.WF_UserInfoPass" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<table class="kpms-table" width="100%">
    <tr>
        <td class="td-l">
            申请人
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiApplyManId" field="APPLYUSERID" tablename="EHR_USERINFOPASS"
                activestatus="(23.申请人填写信息)" />
            <input type="hidden" runat="server" id="hiApplyManCode" field="APPLYUSERCODE" tablename="EHR_USERINFOPASS"
                activestatus="(23.申请人填写信息)" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyManName" readonly="readonly"
                class="kpms-textbox" style="width: 100px" field="APPLYUSERNAME" tablename="EHR_USERINFOPASS"
                activestatus="(23.申请人填写信息)" />
        </td>
        <td class="td-l">
            申请部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDeptName" readonly="readonly"
                class="kpms-textbox" field="APPLYDEPTNAME" tablename="EHR_USERINFOPASS" activestatus="(23.申请人填写信息)" />
            <input type="hidden" runat="server" id="hiApplyDeptId" field="APPLYDEPTID" tablename="EHR_USERINFOPASS"
                activestatus="(23.申请人填写信息)" />
        </td>
        <td class="td-l">
            申请日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDate" class="kpms-textbox-date"
                field="APPLYDATE" tablename="EHR_USERINFOPASS" activestatus="(23.申请人填写信息)" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td colspan="6" align="right">
            <asp:LinkButton runat="server" ID="lbtnPersonnel" CssClass="kpms-btn" activestatus="(123.*)"
                OnClientClick="return EditItem('','','');" OnClick="lbtnPersonnel_Click">
                <span>基本信息</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td colspan="6" align="center" style="font-weight: bold">
            变更信息列表
        </td>
    </tr>
    <tr>
        <td colspan="6">
            变更类型
            <zhongsoft:LightDropDownList runat="server" ID="ddlTableType" Width="100px">
                <asp:ListItem Value="">请选择</asp:ListItem>
                <asp:ListItem Value="EHR_OrganizationUsersTemp|EHR_OrganizationUserProfileTemp">联系方式</asp:ListItem>
                <asp:ListItem Value="EHR_ACADEMICDEGREETEMP">学历学位</asp:ListItem>
                <asp:ListItem Value="EHR_PRIZEINFOTEMP">获奖信息</asp:ListItem>
                <asp:ListItem Value="EHR_MULTIMEDIATEMP">多媒体信息</asp:ListItem>
                <asp:ListItem Value="EHR_PROEXPERIENCETEMP">项目履历</asp:ListItem>
            </zhongsoft:LightDropDownList>
            类型
            <zhongsoft:LightDropDownList runat="server" ID="ddlType" Width="100px">
                <asp:ListItem Value="">请选择</asp:ListItem>
                <asp:ListItem Value="修改">修改</asp:ListItem>
                <asp:ListItem Value="补充">补充</asp:ListItem>
                <asp:ListItem Value="新建">新建</asp:ListItem>
                <asp:ListItem Value="删除">删除</asp:ListItem>
            </zhongsoft:LightDropDownList>
            <asp:LinkButton runat="server" ID="btnSearch" OnClick="btnSearch_Click" EnableTheming="false">
                 <img alt =""  src="../../Themes/Images/btn_search.gif"  content="searchResult"/><span>查找</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnReset" OnClick="btnReset_Click" EnableTheming="false">
                <img alt ="" src="../../Themes/Images/btn_empty.gif"/><span>重置</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="true" DataKeyNames="USERINFOCHANGEID"
                AutoGenerateColumns="false" AllowSorting="true" OnRowCommand="gvList_RowCommand"
                OnRowDataBound="gvList_RowDataBound" OnExport="gvList_Export" ShowExport="true"
                OnSorting="gvList_Sorting">
                <Columns>
                    <asp:TemplateField HeaderText="信息类型" SortExpression="ChangeTableName ASC">
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiChangeTableCode" value='<%#Eval("ChangeTableCode") %>' />
                            <asp:Label runat="server" ID="lblChangeTableName" Text='<%#Eval("ChangeTableName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="信息名称" SortExpression="ChangeFieldName ASC">
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiChangeFieldCode" value='<%#Eval("ChangeFieldCode") %>' />
                            <asp:Label runat="server" ID="lblChangeFieldName" Text='<%#Eval("ChangeFieldName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OriginalValue" HeaderText="原值" SortExpression="OriginalValue ASC" />
                    <asp:BoundField DataField="NewValue" HeaderText="新值" SortExpression="NewValue ASC" />
                    <asp:BoundField DataField="ChangeType" HeaderText="类型" SortExpression="ChangeType ASC" />
                    <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnView" CommandName="view" EnableTheming="false">
                                <img alt="" src="../../Themes/Images/btn_dg_view.gif"  onclick='return EditItem("<%#Eval("ChangePrimaryId")%>","1","<%#Eval("DetailUrl") %>");' />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" CommandArgument='<%#Eval("USERINFOCHANGEID") %>'
                                CommandName="DeleteData" EnableTheming="false">
                                <img alt="" src="../../Themes/Images/btn_dg_delete.gif" onclick='return confirm("确定要删除吗?");' />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiPersonelInfoPassMainID" field="USERINFOPASSID"
    tablename="EHR_USERINFOPASS" />
<input type="hidden" runat="server" id="hiISPASS" field="ISPASS" tablename="EHR_USERINFOPASS" />
<script type="text/javascript">

    //打开明细页面
    function EditItem(bizId, actionType, pageurl) {
        if (bizId == "")//点击基本信息按钮时先判断是否已保存数据
        {
            if ($bizCtx.action == 2) {
                alert("请先保存表单数据!");
                return false;
            }
        }

        var sFeature = "dialogHeight:850px; dialogWidth: 1000px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
        var mainId = "";
        mainId = $("#<%=hiPersonelInfoPassMainID.ClientID %>").val();
        if (pageurl == "") {
            pageurl = "<%=WebAppPath %>/EHR/Form/OrgUsers/PersonnelInfoPassForm.aspx";
        }
        if (actionType == "") {
            actionType = "<%=ActType %>";
        }

        var url = pageurl + "?" + encodeURI("actionType=" + actionType + "&mainId=" + mainId + "&stepName=" + $actName);
        if (bizId != '') {
            url += "&bizId=" + bizId;
        }
        //        window.open(url);
        var ret = window.showModalDialog(encodeURI(url), null, sFeature);

        if (actionType == "1") {
            return false;
        }
        return true;
    }

</script>
