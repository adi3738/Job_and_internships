using System;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using Ubiety.Dns.Core;

namespace YSM2022_NEW
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if
               (Session["userid"] != null)
            {
                Response.Redirect("Home.aspx");
            }


        }



        protected void submit_Click(object sender, EventArgs e)
        {

            if (con.State == ConnectionState.Closed)
                con.Open();
            string CheckEmailOnce = "select user_id from [userinfo] where email ='" + email.Text.ToString() + "'";
            SqlCommand checkemailOnc = new SqlCommand(CheckEmailOnce, con);
            SqlDataReader readCheck = checkemailOnc.ExecuteReader();
            if (readCheck.HasRows)
            {
                lblErrorMsg.Text = "Email address is already exist. Please try with different email address.";
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                con.Close();
            }
            else
            {
                con.Close();


                Random rnd = new Random();
                int myRandom = rnd.Next(1000000, 99999999);
                string activation_code = myRandom.ToString();

                con.Open();
                string insertqry = "insert into [userinfo] (first_name,last_name,email,password,activation_code,is_active) values (@firstname,@lastname,@email,@password,@activation_code,@is_active)";
                SqlCommand insertcmd = new SqlCommand(insertqry, con);
                insertcmd.Parameters.AddWithValue("@firstname", fname.Text.ToString());
                insertcmd.Parameters.AddWithValue("@lastname", lname.Text.ToString());
                insertcmd.Parameters.AddWithValue("@email", email.Text.ToString());
                insertcmd.Parameters.AddWithValue("@password", password.Text.ToString());
                insertcmd.Parameters.AddWithValue("@activation_code", activation_code);
                insertcmd.Parameters.AddWithValue("@is_active", 0);
                insertcmd.ExecuteNonQuery();
                con.Close();



                MailMessage mail = new MailMessage();
                mail.To.Add(email.Text.Trim());
                mail.From = new MailAddress("nslcomp@gmail.com");
                mail.Subject = "Thankyou for registering with us.";
                string emailBody = "";

                emailBody += "<div style='background:#FFFFFF; font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px; margin:0; padding:0;'>";
                emailBody += "<table cellspacing='0' cellpadding='0' border='0' width='100%' style='font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px;'>";
                emailBody += "<tbody>";
                emailBody += "<tr>";
                emailBody += "<td valign='top' style='font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px;'>";
                emailBody += "<div style='width:600px;margin-left:auto;margin-right:auto;clear:both;'>";
                emailBody += "<div style='float:left;width:600px;min-height:35px;font-size:26px;font-weight:bold;text-align:left'>";
                emailBody += "<div style='clear:both;width:100%;text-align:center;'>&nbsp;&nbsp;&nbsp;Photography</div>";
                emailBody += "<div style='clear:both;width:100%;text-align:center;font-size:11px;font-style:italic;'>&nbsp;&nbsp;&nbsp;&nbsp;image World!</div>";
                emailBody += "</div>";
                emailBody += "</div>";
                emailBody += "</td>";
                emailBody += "</tr>";
                emailBody += "</tbody>";
                emailBody += "</table>";
                emailBody += "<table cellspacing='0' cellpadding='0' border='0' width='600' style='font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px;margin-left:auto;margin-right:auto;'>";
                emailBody += "<tbody>";
                emailBody += "<tr>";
                emailBody += "<td valign='top' colspan='2' style='width:600px;padding-left:20px;padding-right:20px;font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px;'>";
                emailBody += "<p style='font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px;padding-top:15px;line-height:22px;margin:0px;font-weight:bold;padding-bottom:5px'>Hi " + fname.Text + ",</p>";
                emailBody += "<p><a href='" + "http://localhost:65315/ActivateAccount.aspx?activation_code=" + activation_code + "&email=" + Base64Encode(email.Text.Trim()) + "'>Click here to activate your account.</a></p>";
                emailBody += "<p style='font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px;line-height:22px;color:rgb(41,41,41)'>Thanks for reaching us.. We ll contact you ASAP.</p>";
                emailBody += "<p>&nbsp;</p><p style='font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px;line-height:22px;margin:0px'>If you have any additional queries, please feel free to reach out us at +91 XXXXX XXXXX or drop us an email at <a href='mailto:Websiteweb.com' style='text-decoration:none;font-style:normal;font-variant:normal;font-weight:normal;font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px;line-height:normal;color:rgb(162,49,35)' target='_blank'>example@domain.com</a>. We are here to help you.</p>";
                emailBody += "<p>&nbsp;</p>";
                emailBody += "<p style='font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px;line-height:22px;margin:0px;font-weight:bold'>Best Regards,</p>";
                emailBody += "<p style='font-family:Arial,Helvetica,Verdana,sans-serif; font-size:14px;color:rgb(41,41,41);line-height:22px;margin:0px'>Support</p>";
                emailBody += "</td>";
                emailBody += "</tr>";
                emailBody += "</tbody>";
                emailBody += "</table>";
                emailBody += "</div>";

                mail.Body = emailBody;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                smtp.Credentials = new System.Net.NetworkCredential("sandeepinfotechv@gmail.com", "Sandeep@gmail");
                smtp.Send(mail);
                lblErrorMsg.Text = "You are successfully registered. Please check your Inbox/spam folder for activation link.";
                lblErrorMsg.ForeColor = System.Drawing.Color.Green;



            }

        }


        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }
        public static string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }
        private string MyEncrypt(string returnText)
        {
            string EncryptionKey = "E5C2B81A3B2B2";
            byte[] clearBytes = Encoding.Unicode.GetBytes(returnText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    returnText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return returnText;
        }
        /*private string MyDecrypt(string returnText)
        {
            string EncryptionKey = "E5C2B81A3B2B2";
            byte[] cipherBytes = Convert.FromBase64String(returnText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    returnText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return returnText;
        }*/
    }
}
