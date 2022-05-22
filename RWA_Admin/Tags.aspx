<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Tags.aspx.cs" Inherits="RWA_Admin.Tags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="p-3">
        <%--<asp:Repeater ID="rptTags" runat="server">
                    <HeaderTemplate>
                        <table id="myTable" class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Tag</th>
                                    <th scope="col">Number of Apartments</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <th scope="row"><%# Eval(nameof(RWA_Library.Models.Tag.Id)) %></th>
                            <th><%# Eval(nameof(RWA_Library.Models.Tag.Type)) %></th>
                            <th><%# Eval(nameof(RWA_Library.Models.Tag.Name)) %></th>
                            <th><%# Eval(nameof(RWA_Library.Models.Tag.ApartmentsHave)) %></th>
                            <th>
                                <asp:LinkButton Text="Delete"  CssClass="btn btn-danger" CommandArgument="<%# Eval(nameof(RWA_Library.Models.Tag.Id)) %>" runat="server" />
                            </th>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                    </table>
                        </div>
                        
                    </FooterTemplate>
                </asp:Repeater>--%>

        <asp:GridView runat="server" AutoGenerateColumns="false" CssClass="table table-striped h-75" ID="tagGrid"
            OnRowDeleting="tagGrid_RowDeleting" DataKeyNames="Id" AllowPaging="true" ShowFooter="true"
            OnPageIndexChanging="tagGrid_PageIndexChanging" OnRowDataBound="tagGrid_RowDataBound">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id" HeaderStyle-CssClass="bg-dark text-white" />

                <asp:BoundField HeaderText="Category" DataField="Type" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:BoundField HeaderText="Tag" DataField="Name" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:BoundField HeaderText="Number of Apartments" DataField="ApartmentsHave" HeaderStyle-CssClass="bg-dark text-white"/>
                <asp:TemplateField HeaderStyle-CssClass="bg-dark text-white">
                    <ItemTemplate>
                        <asp:Button CommandName="Delete" CssClass="btn btn-danger" runat="server" Text="Delete" OnClientClick="return ConfirmAlert();" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <FooterStyle BorderStyle="None" />
        </asp:GridView>
    </div>
    <!-- DODATI MODAL-->
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script>
        function ConfirmAlert() {
            let isExecuted = confirm("Are you sure you want to delete this tag?");

            return isExecuted;
        }
    </script>

    

</asp:Content>
