<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpireLaborContractSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.LaborContractManagement.ExpireLaborContractSelector"
    MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
        <table>
            <tr>
                <td>
                  
                    部门
                      <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="120px" AutoPostBack="True">
                </zhongsoft:LightDropDownList>
                    工号/名称/简拼
                    <zhongsoft:LightTextBox ID="tbUser"  CssClass="kpms-textboxsearch" runat="server" EnableTheming="false">
                    </zhongsoft:LightTextBox>
                    合同终止日期
                    <asp:CheckBox ID="cbEndDate" runat="server" Text="" />
                    <zhongsoft:XHtmlInputText runat="server" ID="txtEndDateFrom" readonly="readonly"
                        compare="2" class="kpms-textbox-comparedate" />
                    至
                    <zhongsoft:XHtmlInputText runat="server" ID="txtEndDateTo" readonly="readonly" compare="2"
                        class="kpms-textbox-comparedate" />
                  
                </td>
            </tr>
            <tr>
                <td>
                  用工形式
                    <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentForm" class="kpms-ddlsearch" EnableTheming="false">
                    </zhongsoft:LightDropDownList>
             
                    <zhongsoft:LightDropDownList runat="server" ID="ddlPersonnelState" class="kpms-ddlsearch" EnableTheming="false" Visible="false">
                    </zhongsoft:LightDropDownList>
                 
                    <zhongsoft:LightDropDownList runat="server" ID="ddlContractState" class="kpms-ddlsearch" EnableTheming="false" Visible="false">
                    </zhongsoft:LightDropDownList>
                    合同类型
                    <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" class="kpms-ddlsearch" EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                    距到期日（天）
                    <asp:CheckBox ID="cbDay" runat="server" Text="" Width="10px" />
                    <zhongsoft:LightTextBox type="text" ID="tbMinDay" runat="server" regex="^[1-9]\d*$"
                        errmsg="请输入正整数" class="kpms-textbox-money" Style="width: 30px;" />
                    至
                    <zhongsoft:LightTextBox type="text" ID="tbMaxDay" runat="server" regex="^[1-9]\d*$"
                        errmsg="请输入正整数" class="kpms-textbox-money" Style="width: 30px;" />
                </td>
            </tr>
        </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
        OnRowCommand="gvList_RowCommand" AllowPaging="true" PageSize="10" UseDefaultDataSource="true"
        BindGridViewMethod="BindDataGrid" ShowJsonRowColName="true" OnJsonClick="addObject"
        JsonClickMode="onclick" BindJsonClick="true">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="USERCODE" SortExpression="USERCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="USERNAME" SortExpression="USERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="DEPTNAME" SortExpression="DEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同编号" DataField="CONTRACTCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同类型" DataField="CONTRACTTYPE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同状态" DataField="CONTRACTSTATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同起始日期" DataField="STARTDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同终止日期" DataField="ENDDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="距到期天数" DataField="TODUEDAYS" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
