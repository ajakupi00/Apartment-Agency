<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="NewApartment.aspx.cs" Inherits="RWA_Admin.NewApartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <link href="CSS/NewApartmentCSS.css" rel="stylesheet" runat="server" />
    <div id="mainContainer" class="d-flex flex-row mx-4">
        <div class="container mr-4 mt-5">
            <div class="container d-flex mb-3">
                <div class="container pr-0">
                    <h2>Croatian</h2>
                    <asp:TextBox placeholder="Apartment name in Croatian" type="text" class="form-control" ID="txtName" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvName" ControlToValidate="txtName" Display="Dynamic" Text=" * Required field" ForeColor="Red" Visible="true" runat="server" />
                </div>
                <div class="container">
                    <h2>English</h2>
                    <asp:TextBox placeholder="Apartment name in English" type="text" class="form-control" ID="txtEngName" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvEngName" ControlToValidate="txtEngName" Display="Dynamic" Text=" * Required field" ForeColor="Red" Visible="true" runat="server" />
                </div>
            </div>
            <div class="container d-flex mb-3">
                <div class="container">
                    <h2>Apartment Owner</h2>
                    <asp:TextBox class="form-control" ID="txtOwner" runat="server" AutoPostBack="true" />
                    <asp:RequiredFieldValidator ID="rfvOwner" ControlToValidate="txtOwner" Display="Dynamic" Text=" * Required field" ForeColor="Red" Visible="true" runat="server" />
                </div>
            </div>
            <div class="container d-flex mb-3">
                <div class="container">
                    <h2>City</h2>
                    <asp:TextBox class="form-control" ID="txtCity" runat="server" AutoPostBack="true" />
                    <asp:RequiredFieldValidator ID="rfvCity" ControlToValidate="txtAddress" Display="Dynamic" Text=" * Required field" ForeColor="Red" Visible="true" runat="server" />
                </div>
            </div>
            <div class="container d-flex mb-3">
                <div class="container">
                    <h2>Address</h2>
                    <asp:TextBox class="form-control" ID="txtAddress" runat="server" AutoPostBack="true" />
                    <asp:RequiredFieldValidator ID="rfvAddress" ControlToValidate="txtAddress" Display="Dynamic" Text=" * Required field" ForeColor="Red" Visible="true" runat="server" />
                </div>
                <div class="container">
                    <h2>Beach distance</h2>
                    <asp:TextBox TextMode="Number" class="form-control" ID="txtBD" runat="server" OnTextChanged="Number_TextChanged" AutoPostBack="true" />
                </div>
            </div>
            <div class="container d-flex mb-3">
                <div class="container">
                    <h2>Price</h2>
                    <div class="input-group mb-3 w-50">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">€</span>
                        </div>
                        <asp:TextBox placeholder="Enter the price in €" TextMode="Number" class="form-control" ID="txtPrice" runat="server" OnTextChanged="Number_TextChanged" AutoPostBack="true" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPrice" ControlToValidate="txtPrice" Display="Dynamic" Text=" * Required field" ForeColor="Red" Visible="true" runat="server" />
                </div>
            </div>
            <div class="container d-flex mb-3">
                <div class="container" style="width: 225%;">
                    <h2>Total rooms</h2>
                    <asp:TextBox TextMode="Number" class="form-control" ID="txtTotalRooms" runat="server" OnTextChanged="Number_TextChanged" AutoPostBack="true" />
                    <asp:RequiredFieldValidator ID="rfvRooms" ControlToValidate="txtTotalRooms" Display="Dynamic" Text=" * Required field" ForeColor="Red" Visible="true" runat="server" />
                </div>
                <div class="container">
                    <h2>Adults</h2>
                    <asp:TextBox TextMode="Number" class="form-control" ID="txtAdults" runat="server" OnTextChanged="Number_TextChanged" AutoPostBack="true" />
                    <asp:RequiredFieldValidator ID="rfvAdults" ControlToValidate="txtAdults" Display="Dynamic" Text=" * Required field" ForeColor="Red" Visible="true" runat="server" />
                </div>
                <div class="container pr-0">
                    <h2>Children</h2>
                    <asp:TextBox TextMode="Number" class="form-control" ID="txtChildren" runat="server" OnTextChanged="Number_TextChanged" AutoPostBack="true" />
                    <asp:RequiredFieldValidator ID="rfvChildren" ControlToValidate="txtChildren" Display="Dynamic" Text=" * Required field" ForeColor="Red" Visible="true" runat="server" />
                </div>
            </div>
            <div class="container d-flex mb-3">
                <div class="container d-flex">
                    <h2>Pictures</h2>
                    <div class="container d-flex align-items-center">
                        <asp:FileUpload ID="FileUpload" runat="server" accept=".png,.jpg,.jpeg" />
                    </div>
                </div>
                <asp:Button ID="btnChooseFile" OnClick="btnChooseFile_Click" CssClass="btn btn-outline-success ml-2 w-75" Style="border-radius: 50px;" Text="Add picture" runat="server" />
            </div>
            <div class="container d-flex flex-wrap">
                <asp:Repeater ID="rptImages" runat="server">
                    <ItemTemplate>
                        <div class="imgContainer w-100 d-flex flex-row mb-4">
                            <asp:Image ImageUrl="<%# Eval(nameof(RWA_Library.Models.ApartmentPicture.SRC)) %>" runat="server" Style="width: 200px;" />
                            <div class="p-4 ">
                                <h3><%# Eval(nameof(RWA_Library.Models.ApartmentPicture.Name)) %></h3>
                                <div class="d-flex imgControl">
                                    <h6 class="form-label">Is Representative</h6>
                                    <asp:CheckBox ID="cbSelectedImg" OnCheckedChanged="cbSelectedImg_CheckedChanged" runat="server" AutoPostBack="true" />
                                </div>
                            </div>
                            <div class="w-100 d-flex align-items-end justify-content-end">
                                <asp:Button Text="Remove" CommandArgument="<%# Eval(nameof(RWA_Library.Models.ApartmentPicture.Name)) %>" CssClass="removeBtn" ID="btnRemovePicture" OnClick="btnRemovePicture_Click" runat="server" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="container mt-5 d-flex flex-column">
            <div class="container mb-3">
                <h2>Add tags</h2>
                <asp:DropDownList class="form-control" Style="width: 50%;" ID="ddlTags" runat="server" OnSelectedIndexChanged="ddlTags_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <div class="container tags">
                <asp:Repeater ID="rptTags" runat="server">
                    <ItemTemplate>
                        <asp:Button Text="<%# Eval(nameof(RWA_Library.Models.Tag.Name)) %>" OnClick="Tag_Click" CssClass="btn btn-light btn-tag mr-1" runat="server" />
                    </ItemTemplate>
                </asp:Repeater>


            </div>

        </div>
    </div>
    <asp:Button CausesValidation="false" CssClass="btn btn-danger" Text="Canel" runat="server" ID="btnCancel" OnClick="btnCancel_Click" />
    <asp:Button CssClass="btn btn-success" Text="Save apartment" runat="server" ID="btnSave" OnClick="btnSave_Click" />
    <svg id="svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
        <path fill="#D9D9D9" fill-opacity="0.2" d="M0,320L40,272C80,224,160,128,240,101.3C320,75,400,117,480,122.7C560,128,640,96,720,101.3C800,107,880,149,960,154.7C1040,160,1120,128,1200,96C1280,64,1360,32,1400,16L1440,0L1440,320L1400,320C1360,320,1280,320,1200,320C1120,320,1040,320,960,320C880,320,800,320,720,320C640,320,560,320,480,320C400,320,320,320,240,320C160,320,80,320,40,320L0,320Z"></path>
    </svg>
</asp:Content>
