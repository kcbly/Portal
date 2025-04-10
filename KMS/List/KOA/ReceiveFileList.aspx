<%@ Page Language="C#" Title="收文台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="ReceiveFileList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.KOA.ReceiveFileList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="btnSend" CssClass="subtoolbarlink" EnableTheming="false" OnClientClick="return SendFlow()" AccessLevel="2">
      <span><img title="发文流程" src="<%=WebAppPath %>/Themes/Images/C_write.gif" width="15" height="15" />收文登记</span>
    </asp:LinkButton>
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
        <span class="filter-block-lb">收文编号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtSerialCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">文件标题</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileTitle" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">收文类别</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlFileStyle" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">原文字号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">发文单位</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileDeptName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
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
        <span class="filter-block-lb">收文日期</span>
        <span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtReceiveFileDateStart" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
            <span>-</span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtReceiveFileDateEnd" runat="server" class="kpms-textbox-comparedate" compare="1"
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
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="ReceiveFileFormID" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <%--                        <zhongsoft:LightBoundField HeaderText="收文日期" DataField="SignDate" DataFormatString="{0:yyyy-MM-dd}" />--%>
            <zhongsoft:LightBoundField HeaderText="收文编号" DataField="SerialCode" />
            <asp:TemplateField HeaderText="文件标题" ItemStyle-HorizontalAlign="left"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewFlow('<%#Eval("ReceiveFileFormID")%>');" style="color: Blue;">
                        <%#Eval("FileTitle")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="收文类别" DataField="FileStyleText" />
            <zhongsoft:LightBoundField HeaderText="发文单位" DataField="FileDeptName" ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="原文字号" DataField="FileCode" />
            <zhongsoft:LightBoundField HeaderText="份数" DataField="Copies" />
            <zhongsoft:LightBoundField HeaderText="形成日期" DataField="FileDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="收文日期" DataField="ReceiveFileDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="密级" DataField="SecurityLevelName" />
            <zhongsoft:LightBoundField HeaderText="紧急程度" DataField="PriorityLevelName" />
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
        //跳转到收文流程表单
        function SendFlow() {
            var pName = "KMSReceiveFileForm.xpdl";
            var url = "<%=WebAppPath%>/Sys/Workflow/FormDetail.aspx"
            var pId = "KMSReceiveFileForm_wp1";
            url = buildQueryUrl(url, { actionType: 2, packageName: pName, xpdlId: pId, formId: 908, ver: '|' });
            window.open(url);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>


