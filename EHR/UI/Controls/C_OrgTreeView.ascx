<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_OrgTreeView.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.UI.Controls.OrgTreeView" %>
<div class="wp_listleft">
    <div class="wp_header">
        <div>
            <span>部门</span>
        </div>
    </div>
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span>
                            <asp:TreeView ID="tvOrganizationTree" runat="server" Height="100%" Width="100%" ShowLines="True"
                                onclick="selectOrg()">
                                <SelectedNodeStyle BackColor="#F7F7F7" />
                            </asp:TreeView>
                        </span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    function initCustomerPlugin() {
        $(window.parent.iFrameHeight(self.frameElement.id, "left"));
    }

    function selectOrg() {
        var selectedNodeID = $("#<%=tvOrganizationTree.ClientID %>_SelectedNode").val();
        var selectedNode = document.getElementById(selectedNodeID);
        if (selectedNode.href.indexOf("\\") > 0) {
            var value = selectedNode.href.substring(selectedNode.href.lastIndexOf("'") - 36, selectedNode.href.length - 2);
            var param = { id: value };
            //向webPart部件传参
            window.parent.setWebPartParam(self.frameElement.id, param);
        }
        else {
            var param = { id: ""};
            //向webPart部件传参
            window.parent.setWebPartParam(self.frameElement.id, param);
        }
    }

    //重写标准的事件，使得展开折叠节点时调用initCustomerPlugin()
    function TreeView_ToggleNode(data, index, node, lineType, children) {
        var img = node.childNodes[0];
        var newExpandState;
        try {
            if (children.style.display == "none") {
                children.style.display = "block";
                newExpandState = "e";
                if ((typeof (img) != "undefined") && (img != null)) {
                    if (lineType == "l") {
                        img.src = data.images[15];
                    }
                    else if (lineType == "t") {
                        img.src = data.images[12];
                    }
                    else if (lineType == "-") {
                        img.src = data.images[18];
                    }
                    else {
                        img.src = data.images[5];
                    }
                    img.alt = data.collapseToolTip.replace(/\{0\}/, TreeView_GetNodeText(node));
                }
            }
            else {
                children.style.display = "none";
                newExpandState = "c";
                if ((typeof (img) != "undefined") && (img != null)) {
                    if (lineType == "l") {
                        img.src = data.images[14];
                    }
                    else if (lineType == "t") {
                        img.src = data.images[11];
                    }
                    else if (lineType == "-") {
                        img.src = data.images[17];
                    }
                    else {
                        img.src = data.images[4];
                    }
                    img.alt = data.expandToolTip.replace(/\{0\}/, TreeView_GetNodeText(node));
                }
            }
            initCustomerPlugin();
        }
        catch (e) { }
        data.expandState.value = data.expandState.value.substring(0, index) + newExpandState + data.expandState.value.slice(index + 1);
    }

</script>
