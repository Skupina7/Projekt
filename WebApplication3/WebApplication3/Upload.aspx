<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="WebApplication3.Upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <div style="font-family:Arial">
        <asp:FileUpload ID="FileUpload1" runat="server" />

                <asp:RequiredFieldValidator  ValidationGroup='valGroup1' ErrorMessage="Required" ControlToValidate="FileUpload1"
    runat="server" Display="Dynamic" ForeColor="Red" />
<asp:RegularExpressionValidator  ValidationGroup='valGroup1' ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif|.jpeg)$"
    ControlToValidate="FileUpload1" runat="server" ForeColor="Red" ErrorMessage="Please select a valid image file PDF,GIF or JPG."
    Display="Dynamic" />

        <asp:Button ID="Button1" runat="server" Text="Upload (max 8 MB)"  ValidationGroup='valGroup1' OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Show list" />
    <div>
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    </div>
            
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="File">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="Download" Text='<%# Eval("File") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Size" HeaderText="Size in bits" />
                <asp:BoundField DataField="Type" HeaderText="Type of file" />
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
            
        </div>
</asp:Content>
