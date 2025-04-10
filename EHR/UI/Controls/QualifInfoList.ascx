<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QualifInfoList.ascx.cs" Inherits="Zhongsoft.Portal.EHR.UI.Controls.QualifInfoList" %>
<table class="tz-table">
    <tr>
        <td class="td-l">登录号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtCode" class="kpms-textbox" activestatus="(2.N)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">姓名
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtName" class="kpms-textbox" activestatus="(2.N)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">所属部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtDept" class="kpms-textbox" activestatus="(2.N)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-l" style="text-align: center; font-weight: bold">专业技术资格
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-l">
            <zhongsoft:LightPowerGridView ID="gvTech" runat="server" AutoGenerateColumns="false"
                AllowPaging="true" PageSize="10" UseDefaultDataSource="true" BindGridViewMethod="BindTechGrid" DataKeyNames="TECHQUALIFID"
                AllowSorting="true" RowStyle-Wrap="false">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="专业技术资<br/>格系列" DataField="TECHQUALIFSERIES"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="专业技术资<br/>格名称" DataField="TECHQUALIFNAME"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="专业技术资<br/>格等级" DataField="TECHQUALIFLEVEL"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="专业技术资<br/>格证书编号" DataField="QUALIFICATIONCODE"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="取得资格日期" DataField="QUALIFYINGTIME" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="最高等<br/>级标识" DataField="ISHIGHESTT2" HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="备注">
                        <ItemTemplate>
                            <asp:Label ID="lbMemo" Text='<%#gvTech.GetSubString(Eval("MEMO"), 6)%>' ToolTip='<%#Eval("MEMO") %>' runat="server"></asp:Label>
                            <input type="hidden" id="hidTechQyalifID" runat="server" value='<%#Eval("TECHQUALIFID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightButtonField HeaderText="查看" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        CausesValidation="false" CommandName="ViewData" EditIdField="TECHQUALIFID" EditPageUrl="~/EHR/List/QualifManagement/TechQualifSubEditor.aspx"
                        EditPageHeight="600px" EditPageWidth="800px">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
