<%@ Page Language="C#" Title="发文台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="SendFileList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.KOA.SendFileList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
     <a class="subtoolbarlink" id="btnSend" onclick="return SendFlow();"  AccessLevel="2">
      <span><img width="15" height="15" title="发文流程" src="/Portal/Themes/Images/C_write.gif">发文流程</span>
            </a> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">流程状态</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlFlag" class="kpms-ddlsearch" EnableTheming="false"
                runat="server">
            </zhongsoft:LightDropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">文号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">文件标题</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileTitle" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">发文类型</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlSendFileType" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">签发人</span>
        <span>
            <zhongsoft:LightTextBox ID="SignUserName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">密级</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlSecurityLevel" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">拟稿部门</span>
        <span>
            <zhongsoft:LightTextBox ID="txtHostDeptName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    
    <span class="filter-block">
        <span class="filter-block-lb">拟稿日期</span>
        <span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtCreateDateStart" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
            <span>-</span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtCreateDateEnd" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="SendFileFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="文号" DataField="FileCode" />
             <asp:TemplateField HeaderText="文件标题" ItemStyle-HorizontalAlign="left" 
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewFlow('<%#Eval("SendFileFormId")%>');" style="color: Blue;">
                        <%#Eval("FileTitle")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="发文类型" DataField="FileCategoryText" />
            <zhongsoft:LightBoundField HeaderText="主送" DataField="MainSendDeptName" ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="抄送" DataField="CopySendDeptName" ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="签发人" DataField="SignUserName" />
            <zhongsoft:LightBoundField HeaderText="签发日期" DataField="SignDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="密级" DataField="SecurityLevelName" />
            <zhongsoft:LightBoundField HeaderText="拟稿人" DataField="CreateUserName" />
            <zhongsoft:LightBoundField HeaderText="拟稿部门" DataField="HostDeptName" />
            <zhongsoft:LightBoundField HeaderText="拟稿日期" DataField="CreateDate" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:TemplateField HeaderText="流程状态" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <%--            <zhongsoft:LightBoundField HeaderText="归档状态" DataField="ProjectCode"/>--%>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $isFlow = "1";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();//页面初始化时隐藏顶部查看按钮
        }
        //跳转到发文流程表单
        function SendFlow() {
            var pName = "KMSSendFileForm.xpdl";
            var url = "<%=WebAppPath%>/Sys/Workflow/FormDetail.aspx"
            var pId = "KMSSendFileForm_wp1";
            url = buildQueryUrl(url, { actionType: 2, packageName: pName, xpdlId: pId, formId: 907, ver: '|' });
            window.open(url);
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

