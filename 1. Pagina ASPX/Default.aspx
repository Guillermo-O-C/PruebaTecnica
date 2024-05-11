<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        .send-button {
            background-color:#83ff62;
            border-radius:25px;
        }
        .form{
            display: flex;
            justify-content: center;
        }
    </style>
    <main>
        <formview class="form">
            <div class="row col-md-4 gap-4">
                <input type="text" placeholder="Usuario" required />
                <input type="password" placeholder="Contraseña" required />
                <input type="submit" class="send-button"/>
            </div>
        </formview>
    </main>

</asp:Content>
