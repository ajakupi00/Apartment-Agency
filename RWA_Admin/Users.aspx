<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="RWA_Admin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="p-3">
        <asp:GridView runat="server" ID="usersGrid" AutoGenerateColumns="false" CssClass="table table-striped h-75"
            AllowPaging="true" OnPageIndexChanging="usersGrid_PageIndexChanging">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:BoundField HeaderText="First name" DataField="FName" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:BoundField HeaderText="Last name" DataField="LName" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:BoundField HeaderText="Email" DataField="Email" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:BoundField HeaderText="Address" DataField="Address" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:BoundField HeaderText="PhoneNumber" DataField="PhoneNumber" HeaderStyle-CssClass="bg-dark text-white" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
