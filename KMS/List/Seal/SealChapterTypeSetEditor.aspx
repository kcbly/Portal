<%@ Page Title="配置用章类型和用章子类型编辑页" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="SealChapterTypeSetEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Seal.SealChapterTypeSetEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr>
            <td class="td-l">印章名称<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtSealName" field="SealName" PageHeight="650px"
                    SelectPageMode="Dialog" tablename="KMS_Seal_SealChapterTypeSet" activestatus="(23.*)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" 
                    ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                    IsMutiple="false" ResultForControls="{'hiSealRegisterId':'id'}" PageUrl="~/KMS/Obsolete/SealSelector.aspx" req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiSealRegisterId" field="SealRegisterId" tablename="KMS_Seal_SealChapterTypeSet" />
            </td>
        </tr>
        <tr>
            <td class="td-l">用章类型<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlChapterType" TableName="KMS_Seal_SealChapterTypeSet" Field="ChapterType" ActiveStatus="(23.*)" req="1"
                    runat="server" Width="128px" OnSelectedIndexChanged="ddlChapterType_SelectedIndexChanged" AutoPostBack="true"/>
                <input type="hidden" runat="server" id="hiChapterTypeText" field="ChapterTypeText" tablename="KMS_Seal_SealChapterTypeSet" />
            </td>

        </tr>
        <tr>
            
            <td class="td-l">用章子类型</td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlChapterItemType" TableName="KMS_Seal_SealChapterTypeSet" Field="ChapterItemType" ActiveStatus="(23.*)" 
                    runat="server" Width="100%" />
                <input type="hidden" runat="server" id="hiChapterItemTypeText" field="ChapterItemTypeText" tablename="KMS_Seal_SealChapterTypeSet" />
                 <input type="hidden" runat="server" id="hiChapterItemType" field="ChapterItemType" tablename="KMS_Seal_SealChapterTypeSet" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Seal_SealChapterTypeSet" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
        <tr>
            <td class="td-l">排序
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtSort" runat="server" TableName="KMS_Seal_SealChapterTypeSet"
                    Field="Sort" ActiveStatus="(23.*)" DataType="Integer" Width="100px" />
            </td>

        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Seal_SealChapterTypeSet" field="SealChapterTypeSetId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
