﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2_with_contact_page.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="YSM2022_NEW.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


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
 .container register-form{
    padding-top:5%;
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
                        <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:TextBox ID="fname" runat="server" class="form-control" placeholder="First Name *"  ></asp:TextBox>
                                 
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="lname" runat="server" class="form-control" placeholder="Last Name *"  ></asp:TextBox>
                                 
                            </div>
                            <div class="form-group">
                                 <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email *"  ></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">

                               <asp:TextBox ID="password" runat="server" class="form-control" placeholder="Password *" Textmode="Password"  ></asp:TextBox>
                            </div>
                             
                        </div>
                    </div>
                        <asp:Button ID="submit" runat="server" class="btnSubmit"  Text="Submit" OnClick="submit_Click"  />
                   
                </div>
            </div>
        </div>
</asp:Content>