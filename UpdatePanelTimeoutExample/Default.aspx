<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UpdatePanelTimeoutExample.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"
            AsyncPostBackTimeout="5"
            OnAsyncPostBackError="ScriptManager1_AsyncPostBackError">
        </asp:ScriptManager>
        <div>
            <asp:Button ID="StandardButton" runat="server" Text="Standard Button" OnClick="StandardButton_Click" />
            <asp:Label ID="StandardLabel" runat="server" Text="Standard Label"></asp:Label>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Button ID="AsyncButton" runat="server" Text="Timeout Button" OnClick="AsyncButton_Click" />
                    <asp:Label ID="AsyncLabel" runat="server" Text="Timeout Label"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Button ID="GenericErrorButton" runat="server" Text="Generic Error Button" OnClick="GenericErrorButton_Click" />
                    <asp:Label ID="GenericErrorLabel" runat="server" Text="Generic Error Label"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <p>Loading...</p>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <asp:Label ID="ErrorMessageLabel" runat="server" Text="Any error messages should replace this text"></asp:Label>
    </form>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function EndRequestHandler(sender, args) {
            if (args.get_error() != undefined) {
                if (args.get_error().name === 'Sys.WebForms.PageRequestManagerTimeoutException') {
                    document.getElementById("ErrorMessageLabel").innerHTML = "The data was not able to be loaded allotted time.";
                    args.set_errorHandled(true);
                }
                else {
                    var msg = "";
                    if (args.get_error().message != undefined) {
                        msg = args.get_error().message;
                    }
                    else {
                        msg = args.get_error().name;
                    }
                    document.getElementById("ErrorMessageLabel").innerHTML = "An error occurred.  Please let the IT department know about the following error: " + msg;
                    args.set_errorHandled(true);
                }
            }
        }
    </script>
</body>
</html>
