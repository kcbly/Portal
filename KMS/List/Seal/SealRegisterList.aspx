<%@ Page Title="印章登记台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="SealRegisterList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Seal.SealRegisterList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">印章名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtSealName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">印章类别</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlSealType" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">责任部门</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlResponsibleDeptName" class="kpms-ddlsearch" runat="server" EnableTheming="false" />
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">印章状态</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlSealStatus" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData" OnRowCommand="gvList_RowCommand"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="SealRegisterId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                    <input type="hidden" id="hiTestId" runat="server" value='<%#Eval("SealStatus") %>' />
                    <input type="hidden" id="hiResponsiblePersonId" runat="server" value='<%#Eval("ResponsiblePersonId") %>'/>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="印章名称" DataField="SealName" />
            <zhongsoft:LightBoundField HeaderText="印章类别" DataField="SealTypeText" />
            <zhongsoft:LightBoundField HeaderText="开始使用日期" DataField="StartUseDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="责任部门" DataField="ResponsibleDeptName" />
            <zhongsoft:LightBoundField HeaderText="责任人" DataField="ResponsiblePerson" />
            <zhongsoft:LightBoundField HeaderText="使用范围" DataField="UseScope" />
            <zhongsoft:LightBoundField HeaderText="印章状态" DataField="SealStatusText" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Seal/SealRegisterEditor.aspx";
        $isFlow = "0";
       //点击编辑之前判断该数据是否可以编辑：SealStatus=0 印章状态为正常使用可以编辑，SealStatus=1 印章状态为已销毁不可以编辑
        function beforeDialog(actionType, bizId) {
            if (actionType == '3') {
                var objList = $("#<%=gvList.ClientID %> tbody tr")
                var count = 0;
                for (var i = 0; i < objList.length; i++) {
                    if ($(objList[i]).children().children().children().prop('checked')) {
                        for (var j = 0; j < objList.length; j++) {
                            if ($(objList[j]).children().children().children().prop('checked')) {
                                var $orgID = $("#<%=gvList.ClientID %> [id$=hiResponsiblePersonId]")[j].value;
                                if ($orgID !='<%=KPMSUser.UserId%>') {
                                    alert("只有责任人才可以修改");
                                    return false;
                                }
                                count++;
                            }
                        }
                        if (count > 1) {
                            alert("只能选择一条数据");
                            return false;
                        }
                        else {
                            if ($(objList[i]).children().next().find("input").val() == "1") {
                                alert("该印章已销毁不可以编辑");
                                return false;
                            }
                            else {

                                var keyUrl = "<%=WebAppPath %>" + $KeyUrl;
                                url = buildQueryUrl(keyUrl, { actionType: actionType, bizId: KeyID });
                                showDivDialog(encodeURI(url), null, 1150, 800, rebindGridData);
                            }
                        }
                    }
                }
            }
            else {
                var keyUrl = "<%=WebAppPath %>" + $KeyUrl;
                var url = buildQueryUrl(keyUrl, { actionType: 2 });

                if ($isFlow != "1" || $isFlow == undefined) {
                    if (actionType == '1' || actionType == '3') {
                        url = buildQueryUrl(keyUrl, { actionType: actionType, bizId: KeyID });

                    }
                    showDivDialog(encodeURI(url), null, 1150, 800, rebindGridData);
                }

                else {
                    ViewItem(KeyID);
                }
              
            }
              return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
