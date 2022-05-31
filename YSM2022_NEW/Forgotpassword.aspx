<%@ Page Title="" Language="C#" MasterPageFile="~/Site2_with_contact_page.Master" AutoEventWireup="true" CodeBehind="Forgotpassword.aspx.cs" Inherits="YSM2022_NEW.Forgotpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Label ID="lblerror" runat="server" Text=""></asp:Label> <br/>


    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

     
	 
	<style>
	.note
{
    text-align: center;
    height: 80px;
    background: -webkit-linear-gradient(left, #0072ff, #8811c5);
    color: #fff;
    font-weight: bold;
    line-height: 80px;
}
.form-content
{
    padding: 5%;
    border: 1px solid #ced4da;
    margin-bottom: 2%;
}
.form-control{
    border-radius:1.5rem;
}
.btnSubmit
{
    border:none;
    border-radius:1.5rem;
    padding: 1%;
    width: 20%;
    cursor: pointer;
    background: #0062cc;
    color: #fff;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	  

  <div class="container register-form">
            <div class="form">
                <div class="note">
                    <p>This is a simpleRegister Form made using Boostrap.</p>
                </div>

                <div class="form-content">
                    <div class="row">
                        <div class="col-md-12">
                            
                            <div class="form-group">
                                 <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email *"  ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*email address is required" ControlToValidate="email" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                 
                               <asp:TextBox ID="password" runat="server" class="form-control" placeholder="Password *" Textmode="Password"  ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*enter your password" ControlToValidate="password" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            </div>
                             
                        </div>
                    </div>
                     
      <asp:Button ID="Button1" runat="server" class="btnSubmit"  Text="Submit" OnClick="Button1_Click" />
                        
                   
                </div>
            </div>
        </div>
</asp:Content>
