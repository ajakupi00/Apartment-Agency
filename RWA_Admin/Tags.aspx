<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Tags.aspx.cs" Inherits="RWA_Admin.Tags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <style>
        .rfv{
            font-size: 12px;
            font-weight: bold;
            color: darkred;
        }
    </style>
    <div class="p-3">
        <asp:GridView runat="server" AutoGenerateColumns="false" CssClass="table table-striped h-75" ID="tagGrid"
            OnRowDeleting="tagGrid_RowDeleting" DataKeyNames="Id" AllowPaging="true" ShowFooter="true"
            OnPageIndexChanging="tagGrid_PageIndexChanging" OnRowDataBound="tagGrid_RowDataBound">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:BoundField HeaderText="Category" DataField="Type" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:BoundField HeaderText="Tag" DataField="Name" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:BoundField HeaderText="Number of Apartments" DataField="ApartmentsHave" HeaderStyle-CssClass="bg-dark text-white" />
                <asp:TemplateField HeaderStyle-CssClass="bg-dark text-white">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" CausesValidation="false" CommandName="Delete" CssClass="btn btn-outline-danger w-100" runat="server" Text="Delete" OnClientClick="return ConfirmAlert();" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <FooterStyle BorderStyle="None" />
        </asp:GridView>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Creating a new Tag</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Croatian name</span>
                        </div>
                        <asp:TextBox class="form-control d-block" placeholder="Tag name" ID="txtName" runat="server" />
                        <asp:RequiredFieldValidator  CssClass="ml-1 align-middle rfv" Text="Required field" Display="Dynamic" ControlToValidate="txtName" runat="server" />
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">English name</span>
                        </div>
                        <asp:TextBox class="form-control" placeholder="Tag English name" ID="txtEngName" runat="server" />
                        <asp:RequiredFieldValidator CssClass="ml-1 align-middle rfv" Text="Required field" Display="Dynamic" ControlToValidate="txtEngName" runat="server" />
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Tag type</label>
                        </div>
                        <asp:DropDownList CssClass="custom-select" runat="server" ID="ddlType">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button Text="Save changes" CssClass="btn btn-primary" runat="server" ID="btnSaveTag" OnClick="btnSaveTag_Click" CausesValidation="true" />
                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script>
        function ConfirmAlert() {
            let isExecuted = confirm("Are you sure you want to delete this tag?");

            return isExecuted;
        }
    </script>



</asp:Content>
