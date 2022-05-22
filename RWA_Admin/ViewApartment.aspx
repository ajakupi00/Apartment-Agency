<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="ViewApartment.aspx.cs" Inherits="RWA_Admin.ViewApartment" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/ViewSwitcher.ascx" TagPrefix="uc1" TagName="ViewSwitcher" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div id="bodyContainer" class="container d-flex flex-column justify-content-center align-items-center p-4 bg-light w-75">
        <div class="carousel">
            <asp:Repeater ID="rptImgs" runat="server">
                <ItemTemplate>
                    <div class="carousel__slide container w-50">
                        <asp:Image ImageUrl="<%# Eval(nameof(RWA_Library.Models.ApartmentPicture.Path)) %>" CssClass="d-block img-fluid" runat="server" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <div class="container d-flex mt-2 ">
            <div class="container py-2">
                <asp:Label CssClass="h5 " Text="Apartment name" runat="server" />
                <asp:TextBox runat="server" CssClass="form-control" ID="txtAptName" />
            </div>
            <div class="container py-2">
                <asp:Label CssClass="h5" Text="Price" runat="server" />
                <asp:TextBox TextMode="Number" runat="server" CssClass="form-control" ID="txtPrice" OnTextChanged="Number_TextChanged" AutoPostBack="true" />
            </div>
        </div>
        <div class="container d-flex">
            <div class="container py-2">
                <asp:Label CssClass="h5" Text="Number of Rooms" runat="server" />
                <asp:TextBox TextMode="Number" runat="server" CssClass="form-control" ID="txtRooms" OnTextChanged="Number_TextChanged" AutoPostBack="true" />
            </div>
            <div class="container py-2">
                <asp:Label CssClass="h5" Text="Adult rooms" runat="server" />
                <asp:TextBox TextMode="Number" runat="server" CssClass="form-control" ID="txtAdults" OnTextChanged="Number_TextChanged" AutoPostBack="true" />
            </div>
            <div class="container py-2">
                <asp:Label CssClass="h5" Text="Children rooms" runat="server" />
                <asp:TextBox TextMode="Number" runat="server" CssClass="form-control" ID="txtChildren" OnTextChanged="Number_TextChanged" AutoPostBack="true" />
            </div>

        </div>
        <div class="container d-flex mt-2 ">
            <div class="container py-2">
                <asp:Label CssClass="h5 " Text="Status" runat="server" />
                <asp:DropDownList runat="server" CssClass="form-control btn btn-secondary dropdown-toggle" OnSelectedIndexChanged="ApartmentStatus_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true" ID="ddlStatus">
                    <asp:ListItem Text="Rezervirano" Value="R" onclick="pokaziModal();" />
                    <asp:ListItem Text="Zauzeto" Value="Z" />
                    <asp:ListItem Text="Slobodno" Selected="True" Value="S" />
                </asp:DropDownList>
            </div>
            <div class="container py-2">
                <asp:Panel runat="server" ID="pnl" Visible="false">
                    <asp:Label CssClass="h5" Text="Choose option:" runat="server" />
                    <div class="">
                        <asp:Button Text="Registered User" CssClass="btn btn-outline-warning" runat="server" ID="btnRegUser" OnClick="btnRegUser_Click" />
                        <asp:Button Text="Unregistered User" CssClass="btn btn-outline-warning" runat="server" ID="btnUnregUser" OnClick="btnUnregUser_Click" />
                    </div>
                    <asp:Panel runat="server" ID="pnlUnregistered" Visible="false">
                        <div class="py-2">
                            <asp:Label CssClass="text" Text="Name" runat="server" />
                            <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtFName" />
                            <asp:RequiredFieldValidator ControlToValidate="txtFName" Display="Dynamic" class="form-text text-muted text-red" ID="valFName" runat="server" />
                        </div>
                        <div class="py-2">
                            <asp:Label CssClass="text" Text="Last name" runat="server" />
                            <asp:TextBox runat="server" CssClass="form-control  form-control-sm" ID="txtLName" />
                            <asp:RequiredFieldValidator ControlToValidate="txtLName" Display="Dynamic" class="form-text text-muted text-red" ID="valLName" runat="server" />
                        </div>
                        <div class="py-2">
                            <asp:Label CssClass="text" Text="Email" runat="server" />
                            <asp:TextBox runat="server" CssClass="form-control  form-control-sm" ID="txtEmail" />
                            <asp:RequiredFieldValidator ControlToValidate="txtEmail" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" />

                        </div>
                        <div class="py-2">
                            <asp:Label CssClass="text" Text="Phone number" runat="server" />
                            <asp:TextBox runat="server" CssClass="form-control  form-control-sm" ID="txtPhone" />
                            <asp:RequiredFieldValidator ControlToValidate="txtPhone" Display="Dynamic" class="form-text text-muted text-red" ID="RequiredFieldValidator2" runat="server" />

                        </div>
                        <div class="py-2">
                            <asp:Label CssClass="text" Text="Address" runat="server" />
                            <asp:TextBox runat="server" CssClass="form-control  form-control-sm" ID="txtAdress" />
                            <asp:RequiredFieldValidator ControlToValidate="txtAdress" Display="Dynamic" class="form-text text-muted text-red" ID="valAddress" runat="server" />

                        </div>
                        <asp:Button Text="Submit" CssClass="btn btn-primary w-100" runat="server" ID="btnSubmitUser" OnClick="btnSubmitUser_Click" />
                    </asp:Panel>
                </asp:Panel>
            </div>
        </div>
        <div class="container mt-2">
            <asp:Panel runat="server" ID="pnlRegistered" Visible="false">
                <asp:Repeater ID="rptRegisteredUsers" runat="server">
                    <HeaderTemplate>
                        <table id="myTable" class="table table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">First name</th>
                                    <th scope="col">Last name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Address</th>
                                    <th scope="col"></th>

                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval(nameof(RWA_Library.Models.User.FName)) %></td>
                            <td><%# Eval(nameof(RWA_Library.Models.User.LName)) %></td>
                            <td><%# Eval(nameof(RWA_Library.Models.User.Email)) %></td>
                            <td><%# Eval(nameof(RWA_Library.Models.User.Address)) %></td>
                            <td>
                                <asp:LinkButton CommandArgument="<%# Eval(nameof(RWA_Library.Models.User.Id)) %>" ID="btnChooseUser" OnClick="btnChooseUser_Click" runat="server">Odaberi</asp:LinkButton>
                            </td>
                        </tr>

                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                    </table>
                       
                    </FooterTemplate>

                </asp:Repeater>
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlUser" Visible="false">
                <div class="container mt-2">
                    <h4>Selected User</h4>
                    <div class="container">
                        <asp:Label ID="uFName" runat="server" />
                    </div>
                    <div class="container">
                        <asp:Label ID="uPhone" runat="server" />
                    </div>
                    <div class="container">
                        <asp:Label ID="uEmail" runat="server" />
                    </div>
                    <div class="container">
                        <asp:Label ID="uAddress" runat="server" />
                    </div>
                </div>
            </asp:Panel>
        </div>
        <div class="container py-2">
            <div class="container">
                <a href="#" class="btn btn-dark w-100 " data-toggle="modal" data-target="#tagModal" runat="server">Tags</a>
            </div>
        </div>
        <div class="container py-2">
            <div class="container">
                <h4>Representative picture:</h4>
            </div>
        </div>
        <asp:Panel ID="pnlChoosePicture" CssClass="container d-flex flex-row flex-wrap" runat="server" Visible="true">
            <asp:Repeater ID="rptRepresentativePictures" runat="server">
                <ItemTemplate>
                    <div class="container d-flex flex-column align-items-center" id="repPictureDiv" style="width: 20%;">
                        <img src="<%# Eval(nameof(RWA_Library.Models.ApartmentPicture.Path)) %>" class="img-thumbnail choosenPicture" alt="Alternate Text" style="width: 100%; height=100%;" />
                        <asp:CheckBox CssClass="m-1" ID="cbChoosenImage" runat="server" OnCheckedChanged="cbChoosenImage_CheckedChanged" AutoPostBack="true" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>

        <div class="container d-flex w-100 py-2">
            <div class="container w-50 ">
                <a ID="btnCancel"  class="btn btn-danger w-100 text-white" data-toggle="modal" data-target="#deleteModal" >Delete</a>
            </div>
            <div class="container w-50 ">
                <asp:Button Text="Save Changes" CssClass="btn btn-success w-100" runat="server" ID="btnSaveApartment" OnClick="btnSaveApartment_Click" />
            </div>
        </div>
    </div>

    <div class="modal show" id="tagModal" tabindex="-1" role="dialog" aria-labelledby="tagModalLabel" aria-hidden="true">
        <div class="modal-dialog show" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tagModalLabel">Tags</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                        <label class="form-label">Add tags</label>
                        <asp:DropDownList CssClass="custom-select" ID="ddlTags" runat="server" EnableViewState="true" AutoPostBack="true" OnSelectedIndexChanged="ddlTags_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <asp:Panel runat="server" CssClass="my-2" ID="pnlTags">
                    </asp:Panel>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Are you sure you want to delete this apartment?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-success px-4" data-dismiss="modal">NO</button>
        <asp:Button Text="YES" type="button" class="btn btn-danger px-4" runat="server" ID="btnDeleteApt" OnClick="btnDeleteApt_Click"  />
      </div>
    </div>
  </div>
</div>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
    <script>
        const myCarousel = new Carousel(document.querySelector(".carousel"), {
        });



    </script>
</asp:Content>
