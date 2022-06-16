<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="YSM2022_NEW.ForgotPassword" %>
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
.btn
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
                <p>Forgot password</p>
            </div>

            <div class="form-content">
                <div class="row">
                    <asp:label ID="lblErrorMsg" runat="server" text=""></asp:label>
                    <div class="col-md-12">

                        <div class="form-group">
                            <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Enter your email address" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email Address is Required." ControlToValidate="email" ForeColor="#ff0000"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please provide correct email format" ControlToValidate="email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                        </div>


                    </div>
 

                </div>
            </div>

            <asp:Button ID="forgotPwdBtn" runat="server" Text="Submit" class="btn btn-custom btn-lg" OnClick="forgotPwdBtn_Click" />


        </div>
    </div>
</asp:Content>
