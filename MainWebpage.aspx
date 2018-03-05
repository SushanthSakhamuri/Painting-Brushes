<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainWebpage.aspx.cs" Inherits="WebApplication3.MainWebpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>sushanth</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <b><asp:Label ID="Label1" runat="server" Text="Please Select an Option below to choose the brushes"></asp:Label></b>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="WebForm1.aspx">Brushes1</asp:ListItem>
                <asp:ListItem Value="WebForm2.aspx">Brushes2</asp:ListItem>
                <asp:ListItem Value="WebForm3.aspx">Brushes3</asp:ListItem>
                <asp:ListItem Value="WebForm4.aspx">Brushes4</asp:ListItem>
                <asp:ListItem Value="WebForm5.aspx">Brushes5</asp:ListItem>
                <asp:ListItem Value="WebForm6.aspx">Brushes6</asp:ListItem>
                <asp:ListItem Value="WebForm7.aspx">Brushes7</asp:ListItem>
                <asp:ListItem Value="WebForm8.aspx">Brushes8</asp:ListItem>
                <asp:ListItem Value="WebForm9.aspx">Brushes9</asp:ListItem>
                <asp:ListItem Value="WebForm10.aspx">Brushes10</asp:ListItem>
                <asp:ListItem Value="WebForm11.aspx">Brushes11</asp:ListItem>
                <asp:ListItem Value="WebForm12.aspx">Brushes12</asp:ListItem>
                <asp:ListItem Value="WebForm13.aspx">Brushes13</asp:ListItem>
                <asp:ListItem Value="WebForm14.aspx">Brushes14</asp:ListItem>
                <asp:ListItem Value="WebForm15.aspx">Brushes15</asp:ListItem>
                <asp:ListItem Value="WebForm16.aspx">Brushes16</asp:ListItem>
                <asp:ListItem Value="WebForm17.aspx">Brushes17</asp:ListItem>
                <asp:ListItem Value="WebForm18.aspx">Brushes18</asp:ListItem>
                <asp:ListItem Value="WebForm19.aspx">Brushes19</asp:ListItem>
                <asp:ListItem Value="WebForm20.aspx">Brushes20</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="BtnSelect" runat="server" Text="Navigate" OnClick="BtnSelect_Click" />
        </div>
        
    </form>
</body>
</html>
