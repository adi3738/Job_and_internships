<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="YSM2022_NEW.MyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="contact">
  <div class="container">
    <div class="col-md-4 col-md-offset-4">
      <div class="row">
        <div class="section-title">
          <h2>My Profile</h2>
        </div>
        <div id="contactForm">
          <div class="row">
            <div class="col-md-12">
              First Name : <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
              Last Name : <%=HttpContext.Current.Session["last_name"]%><br />


                  
    
              email : <asp:Label ID="Label2" runat="server" Text=""></asp:Label><br />
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/editProfile.aspx" class="btn btn-danger" >Update Profile</asp:HyperLink><br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/changePassword.aspx" class="btn btn-danger" >Change Password</asp:HyperLink>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</asp:Content>
