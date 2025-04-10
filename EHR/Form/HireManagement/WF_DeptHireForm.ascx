<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DeptHireForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.HireManagement.WF_DeptHireForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            填写人姓名
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiFillUserId" field="FillUserId" tablename="EHR_DeptHireForm" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelName" readonly="readonly"
                class="kpms-textbox" style="width: 100px" field="FillUserName" tablename="EHR_DeptHireForm"
                activestatus="(23.下达年度人才需求计划通知)" />
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <input type="hidden" id="hiDeptId" runat="server" field="DeptId" tablename="EHR_DeptHireForm" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtDeptName" readonly="readonly" class="kpms-textbox"
                field="DeptName" tablename="EHR_DeptHireForm" activestatus="(23.下达年度人才需求计划通知)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            填写日期<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
        
            <input type="hidden" id="hiHireYear" runat="server" field="HireYear" tablename="EHR_DeptHireForm" />
            <zhongsoft:XHtmlInputText ID="txtFillDate" runat="server" class="kpms-textbox-date"
                readonly="readonly" field="FillDate" tablename="EHR_DeptHireForm" activestatus="(23.下达年度人才需求计划通知)"
                req="1" />
        </td>
    </tr>
     <tr id="Tr1" runat="server">
        <td class="td-m" colspan="6" style="text-align: left">
            部门<asp:DropDownList ID="ddlManageDeptId" runat="server"    Width="150px" />
            
            <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                                <span content="searchResult">查找</span></asp:LinkButton>
            <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                                <span>重置</span></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td colspan="6" style="text-align: center">
            <span style="float: right">
                <asp:Button ID="btnAddHire" runat="server" Text="添加人才需求" OnClientClick="return AddProposal('2','','1');"
                    OnClick="btnAddHire_Click" activestatus="(3.下达年度人才需求计划通知)(3.填写部门年度人才需求计划)" displaystatus="(3.下达年度人才需求计划通知)(3.填写部门年度人才需求计划)"
                     />
            </span>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" PageSize="1000"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="ItemId"
                ShowFooter="false" OnRowCommand="gvList_RowCommand" OnRowDeleting="gvList_RowDeleting"
                OnRowDataBound="gvList_RowDataBound"  >
                <Columns>
                    <asp:TemplateField HeaderText="填报部门" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="DeptName" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("DeptName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="建议毕业院校" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="ItemId" value='<%#Eval("ItemId") %>' />
                            <input type="text" runat="server" id="GraduateSchool" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("GraduateSchool") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="tbGraduateSchool" class="kpms-text" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="需求专业" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Specialty" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Specialty") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty">
                            </zhongsoft:LightDropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="学历" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Education" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Education") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlEducation">
                            </zhongsoft:LightDropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="性别" ItemStyle-Width="50px" FooterStyle-Width="50px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Sex" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Sex") %>' style="width: 40px;" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlSex">
                            </zhongsoft:LightDropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="人数" ItemStyle-Width="50px" FooterStyle-Width="50px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Number" class="kpms-textbox-money" readonly="readonly"
                                value='<%#Eval("Number") %>' style="width: 40px;" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="tbNumber" class="kpms-text" Style="width: 40px;" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="需求岗位性质" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="EmploymentForm" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("EmploymentForm") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentForm">
                                <asp:ListItem Value="">请选择</asp:ListItem>
                                <asp:ListItem Value="正式职工">正式职工</asp:ListItem>
                                <asp:ListItem Value="劳务派遣">劳务派遣</asp:ListItem>
                            </zhongsoft:LightDropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="应届毕业生或</br>具有工作经验" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Work" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Work") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="tbWork" class="kpms-text" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="备注" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Memo" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Memo") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="tbMemo" class="kpms-text" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnad" runat="server" EnableTheming="false"  >
                                <img alt="查看信息" src="<%=WebAppPath %>/Themes/Images/btn_chakan.gif" 
                                 onclick="return AddProposal('1','<%#Eval("ItemId") %>','1')" title="点击查看信息" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" EnableTheming="false" CommandName="EditData">
                                <img alt="编辑信息" src="<%=WebAppPath %>/Themes/Images/btn_dg_edit.gif" 
                                 onclick="return AddProposal('3','<%#Eval("ItemId") %>','1')" title="点击编辑信息" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                        <FooterStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete" CommandArgument='<%#Eval("ItemId") %>'
                                EnableTheming="false">
						        <img id="btnDelete" alt="删除" title="删除" style="CURSOR: hand" onclick='if(!confirm("您确定要删除吗？")) return false;'
							        src="/Portal/Themes/Images/btn_dg_delete.gif" border="0">
                            </asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="btnSave" runat="server" CommandName="save" title="保存并添加下一行"
                                ImageUrl="/Portal/Themes/Images/btn_save.gif"></asp:ImageButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
          
        </td>
    </tr>
     <tr runat="server"  activestatus="(3.汇总各部门 年度人才需求计划表)" displaystatus="(3.汇总各部门 年度人才需求计划表)">
        <td colspan="6" style="text-align: center">
            <span style="float: right">
                <asp:Button ID="Button1" runat="server" Text="添加人才需求" OnClientClick="return AddProposal('2','','2');"
                    OnClick="btnAddHire_Click" activestatus="(3.汇总各部门 年度人才需求计划表)" displaystatus="(3.汇总各部门 年度人才需求计划表)"
                     />
            </span>
        </td>
    </tr>
    <tr  runat="server"  activestatus="(3.汇总各部门 年度人才需求计划表)(3.审批)(3.接收反馈)" displaystatus="(3.汇总各部门 年度人才需求计划表)(3.审批)(3.接收反馈)">
        <td colspan="4">
            <zhongsoft:LightPowerGridView ID="gvList2" runat="server" AllowPaging="true" PageSize="1000"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="ItemId"
                ShowFooter="false" OnRowCommand="gvList2_RowCommand" OnRowDeleting="gvList2_RowDeleting"
                 >
                <Columns>
                    <asp:TemplateField HeaderText="填报部门" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="DeptName" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("DeptName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="建议毕业院校" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="ItemId" value='<%#Eval("ItemId") %>' />
                            <input type="text" runat="server" id="GraduateSchool" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("GraduateSchool") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="tbGraduateSchool" class="kpms-text" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="需求专业" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Specialty" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Specialty") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty">
                            </zhongsoft:LightDropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="学历" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Education" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Education") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlEducation">
                            </zhongsoft:LightDropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="性别" ItemStyle-Width="50px" FooterStyle-Width="50px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Sex" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Sex") %>' style="width: 40px;" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlSex">
                            </zhongsoft:LightDropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="人数" ItemStyle-Width="50px" FooterStyle-Width="50px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Number" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Number") %>' style="width: 40px;" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="tbNumber" class="kpms-text" Style="width: 40px;" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="需求岗位性质" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="EmploymentForm" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("EmploymentForm") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentForm">
                                <asp:ListItem Value="">请选择</asp:ListItem>
                                <asp:ListItem Value="正式职工">正式职工</asp:ListItem>
                                <asp:ListItem Value="劳务派遣">劳务派遣</asp:ListItem>
                            </zhongsoft:LightDropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="应届毕业生或</br>具有工作经验" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Work" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Work") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="tbWork" class="kpms-text" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="备注" ItemStyle-Width="150px" FooterStyle-Width="150px">
                        <ItemTemplate>
                            <input type="text" runat="server" id="Memo" class="kpms-textbox" readonly="readonly"
                                value='<%#Eval("Memo") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="tbMemo" class="kpms-text" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnad" runat="server" EnableTheming="false"  >
                                <img alt="查看信息" src="<%=WebAppPath %>/Themes/Images/btn_chakan.gif" 
                                 onclick="return AddProposal('1','<%#Eval("ItemId") %>','2')" title="点击查看信息" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" EnableTheming="false" CommandName="EditData">
                                <img alt="编辑信息" src="<%=WebAppPath %>/Themes/Images/btn_dg_edit.gif" 
                                 onclick="return AddProposal('3','<%#Eval("ItemId") %>','2')" title="点击编辑信息" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                        <FooterStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete" CommandArgument='<%#Eval("ItemId") %>'
                                EnableTheming="false">
						        <img id="btnDelete" alt="删除" title="删除" style="CURSOR: hand" onclick='if(!confirm("您确定要删除吗？")) return false;'
							        src="/Portal/Themes/Images/btn_dg_delete.gif" border="0">
                            </asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="btnSave" runat="server" CommandName="save" title="保存并添加下一行"
                                ImageUrl="/Portal/Themes/Images/btn_save.gif"></asp:ImageButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
          
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbRemark" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="Remark" tablename="EHR_DeptHireForm"
                activestatus="(23.下达年度人才需求计划通知)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input runat="server" id="chooseROW" type="hidden" />
<input type="hidden" id="hiFormID" runat="server" field="FormId" tablename="EHR_DeptHireForm" />
<!--传阅接收角色-->
<input type="hidden" id="hiPassManRole" runat="server" value="部门临聘传阅接收人" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    function AddProposal(actType, bizId, htype) {
        var formId = $("#<%=this.hiFormID.ClientID %>").val();
        var url = "<%=WebAppPath %>/EHR/List/Attendance/DeptHireEditor.aspx?actionType=" + actType + "&hireType=" + htype + "&FormId=" + formId;
        if (bizId != "") {
            url += "&bizId=" + bizId;
        }
        showModal(url, null, 650, 500);
        return true;
    }

    //选择要返聘的人员信息
    function SelectPersonnelInfo(UserCodeId, UserNameId, IdCardld) {
        var param = new InputParamObject("s");
        var reObj = getHirePersonUsers("re", param, "");
        if (null != reObj) {
            var idCard = reObj.getAttrVal(0, "o", "att3");
            var name = reObj.getAttrVal(0, "o", "name");
            var code = reObj.getAttrVal(0, "o", "id");
            $("#" + UserCodeId).val(code);
            $("#" + UserNameId).val(name);
            $("#" + IdCardld).val(idCard);
            return false;
        }
    }

    function KPMSCheckSubmit() {
        if ("<%=CurrentActivityName%>" == "人资登记") {
            if ($("#<%=gvList.ClientID%> tbody tr").length > 0) {
                for (var i = 0; i < $("#<%=gvList.ClientID%> tbody tr").length; i++) {
                    if ($($($("#<%=gvList.ClientID%> tbody tr")[i]).find("input")[1]).val() == "") {
                        $($($("#<%=gvList.ClientID%> tbody tr")[i]).find("input")[1]).focus();
                        alert("请填写工号！");
                        return false;
                    }
                    else {
                        //$($($("#<%=gvList.ClientID%> tbody tr")[i]).find("a img")).click();
                        //eval($($($("#<%=gvList.ClientID%> tbody tr")[i]).find("a")).attr("href"));
                    }
                }
            }
        }
        return true;
    }

    function chooseROW(i) {
        $("#<%=chooseROW.ClientID %>").val(i);
    }
    
</script>
