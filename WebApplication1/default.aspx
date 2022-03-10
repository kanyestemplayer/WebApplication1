<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication1._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            PIZZA<br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem Value="12">Small (12 inch) - £12</asp:ListItem>
                <asp:ListItem Selected="True" Value="14">Medium (14 inch) - £14</asp:ListItem>
                <asp:ListItem Value="16">Large (16 inch) - £16</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                <asp:ListItem Selected="True" Value="0">Regular Crust</asp:ListItem>
                <asp:ListItem Value="0.000000000000000">Thin Crust</asp:ListItem>
                <asp:ListItem Value="2">Stuffed Crust (+£2)</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                <asp:ListItem Value="2">Sausage - £2</asp:ListItem>
                <asp:ListItem Value="1.5">Peperoni - £1.50</asp:ListItem>
                <asp:ListItem Value="1">Onions - £1</asp:ListItem>
                <asp:ListItem Value="1">Green Peppers - £1</asp:ListItem>
            </asp:CheckBoxList>
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    Order Total: £<asp:Label ID="Label1" runat="server" Text="14"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <p>
            Name:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        <p>
            Address line 1:
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </p>
        <p>
            Address line 2:
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </p>
        <p>
            Town:
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </p>
        <p>
            Postcode:
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        </p>
        <p>
            Contact Number:
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        </p>
        <p>
            Delivery Instructions:
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Place Order" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="pizzaSize" HeaderText="pizzaSize" SortExpression="pizzaSize" />
                    <asp:BoundField DataField="crustType" HeaderText="crustType" SortExpression="crustType" />
                    <asp:BoundField DataField="sausage" HeaderText="sausage" SortExpression="sausage" />
                    <asp:BoundField DataField="peperoni" HeaderText="peperoni" SortExpression="peperoni" />
                    <asp:BoundField DataField="onions" HeaderText="onions" SortExpression="onions" />
                    <asp:BoundField DataField="peppers" HeaderText="peppers" SortExpression="peppers" />
                    <asp:BoundField DataField="address1" HeaderText="address1" SortExpression="address1" />
                    <asp:BoundField DataField="address2" HeaderText="address2" SortExpression="address2" />
                    <asp:BoundField DataField="town" HeaderText="town" SortExpression="town" />
                    <asp:BoundField DataField="postcode" HeaderText="postcode" SortExpression="postcode" />
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="extra" HeaderText="extra" SortExpression="extra" />
                    <asp:BoundField DataField="cost" HeaderText="cost" SortExpression="cost" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database1ConnectionString1 %>" DeleteCommand="DELETE FROM [order] WHERE [Id] = @Id" InsertCommand="INSERT INTO [order] ([pizzaSize], [crustType], [sausage], [peperoni], [onions], [peppers], [address1], [address2], [town], [postcode], [phone], [extra], [cost]) VALUES (@pizzaSize, @crustType, @sausage, @peperoni, @onions, @peppers, @address1, @address2, @town, @postcode, @phone, @extra, @cost)" ProviderName="<%$ ConnectionStrings:Database1ConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [pizzaSize], [crustType], [sausage], [peperoni], [onions], [peppers], [address1], [address2], [town], [postcode], [phone], [extra], [cost] FROM [order]" UpdateCommand="UPDATE [order] SET [pizzaSize] = @pizzaSize, [crustType] = @crustType, [sausage] = @sausage, [peperoni] = @peperoni, [onions] = @onions, [peppers] = @peppers, [address1] = @address1, [address2] = @address2, [town] = @town, [postcode] = @postcode, [phone] = @phone, [extra] = @extra, [cost] = @cost WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="pizzaSize" Type="Byte" />
                    <asp:Parameter Name="crustType" Type="Byte" />
                    <asp:Parameter Name="sausage" Type="Byte" />
                    <asp:Parameter Name="peperoni" Type="Byte" />
                    <asp:Parameter Name="onions" Type="Byte" />
                    <asp:Parameter Name="peppers" Type="Byte" />
                    <asp:Parameter Name="address1" Type="String" />
                    <asp:Parameter Name="address2" Type="String" />
                    <asp:Parameter Name="town" Type="String" />
                    <asp:Parameter Name="postcode" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="extra" Type="String" />
                    <asp:Parameter Name="cost" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pizzaSize" Type="Byte" />
                    <asp:Parameter Name="crustType" Type="Byte" />
                    <asp:Parameter Name="sausage" Type="Byte" />
                    <asp:Parameter Name="peperoni" Type="Byte" />
                    <asp:Parameter Name="onions" Type="Byte" />
                    <asp:Parameter Name="peppers" Type="Byte" />
                    <asp:Parameter Name="address1" Type="String" />
                    <asp:Parameter Name="address2" Type="String" />
                    <asp:Parameter Name="town" Type="String" />
                    <asp:Parameter Name="postcode" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="extra" Type="String" />
                    <asp:Parameter Name="cost" Type="Decimal" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
