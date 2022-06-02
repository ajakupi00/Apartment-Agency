<%@ Page Title="" Language="C#"  MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Apartments.aspx.cs" Inherits="RWA_Admin.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
 
    <asp:Panel runat="server" ID="pnlApartments">
        <div class="my-2 w-100" id="divAction" runat="server">
        </div>
        <div class="p-3 d-flex justify-content-end">
            <div class="col-md-6" style="width: 20%">
                <asp:Label CssClass="form-label" Text="City" runat="server" />
                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlCity" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="All" Selected="True" Value="A" />
                </asp:DropDownList>
            </div>
            <div class="col-md-6" style="width: 20%">
                <asp:Label CssClass="form-label" Text="Status" runat="server" />
                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlStatus" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="All" Selected="True" Value="A" />
                </asp:DropDownList>
            </div>

        </div>
        <div class="p-3">
            <div class="col-md-6 mw-100">
                <asp:Repeater ID="rptApartments" runat="server">
                    <HeaderTemplate>
                        <table id="myTable" class="table table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">City</th>
                                    <th scope="col">Adults</th>
                                    <th scope="col">Children</th>
                                    <th scope="col">Rooms</th>
                                    <th scope="col">Pictures</th>
                                    <th scope="col">Price</th>
                                    <th scope="col"></th>

                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval(nameof(RWA_Library.Models.Apartment.Name)) %></td>
                            <td><%# Eval(nameof(RWA_Library.Models.Apartment.City)) %></td>
                            <td><%# Eval(nameof(RWA_Library.Models.Apartment.MaxAdults)) %></td>
                            <td><%# Eval(nameof(RWA_Library.Models.Apartment.MaxChildren)) %></td>
                            <td><%# Eval(nameof(RWA_Library.Models.Apartment.TotalRooms)) %></td>
                            <td><%# Eval(nameof(RWA_Library.Models.Apartment.NumberOfPictures)) %></td>
                            <td><%# Eval(nameof(RWA_Library.Models.Apartment.Price)) %> €</td>
                            <td>
                                <asp:LinkButton OnClick="LinkButton1_Click" CommandArgument="<%# Eval(nameof(RWA_Library.Models.Apartment.Id)) %>" ID="LinkButton1" runat="server">Odaberi</asp:LinkButton>
                            </td>
                        </tr>

                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                    </table>
                       
                    </FooterTemplate>

                </asp:Repeater>
            </div>
        </div>
        <div class="container d-flex justify-content-end mr-0">
            <asp:Button ID="btnNewApt" Text="Add new apartment" CssClass="btn btn-outline-success px-4 mr-4" runat="server" style="border-radius: 50px;" OnClick="btnNewApt_Click"   />
        </div>
    </asp:Panel>

    <%-- <div class="col-md-6">
                <asp:GridView ID="gvUsers" AutoGenerateColumns="false" CssClass="table" runat="server">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="Username" />     
                    </Columns>
                </asp:GridView>
            </div>--%>
</asp:Content>
