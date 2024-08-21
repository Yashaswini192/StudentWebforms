<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="StudentManagement.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style1 {
            width: 900px;
            margin-left: 50px;
        }

        #addStudentbtn {
            margin-left: 50px;
            width: 100px;
        }

        #updateStudentbtn {
            margin-left: 30px;
            width: 120px;
        }

        #deleteStudentbtn {
            margin-left: 30px;
            width: 120px;
        }

        #StudentTable {
            margin-top: 20px;
        }
    </style>
</head>
<body class="w-100">
    <h2 class="pt-3 text-center" style="color: #800000">Students List</h2>
    <form id="form1" runat="server">
        <div>

            <asp:Button type="button" runat="server" class="btn btn-primary text-white " OnClick="Add_Student" Text=" Add " ID="addStudentbtn" data-toggle="modal" data-target="#addStudentModal" />

<%--            <asp:Button type="button" runat="server" class="btn btn-success text-white" Text="Update" ID="updateStudentbtn" OnClick="UpdateStudent" data-toggle="modal" data-target="#UpdateStudentModalLabel" />--%>

            <%--<asp:Button type="button" runat="server" class="btn btn-danger text-white" OnClick="DeleteStudent" Text="Delete" id="deleteStudentbtn" />--%>
        </div>
        <div>
            <table class="auto-style1 table table-bordered text-center " id="StudentTable">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">DOB</th>
                        <th class="text-center">Gender</th>
                        <th class="text-center">Email</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody runat="server" id="studentablebody">
                </tbody>
            </table>
        </div>


        <div class="modal fade" id="addStudentModal" tabindex="-1" role="dialog" aria-labelledby="addStudentModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addStudentModalLabel">Add New Student</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="studentName">Name</label>
                            <asp:TextBox ID="studentName" runat="server" CssClass="form-control" Placeholder="Enter student's name"></asp:TextBox>

                        </div>
                        <div class="form-group">

                            <label for="studentDOB">Date of Birth</label>

                            <asp:TextBox ID="studentDOB" runat="server" CssClass="form-control" Placeholder="Enter student's DOB"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="studentGender">Gender</label>
                            <asp:DropDownList ID="studentGender" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="studentEmail">Email</label>
                            <asp:TextBox ID="studentEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="Enter student's email"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button type="button" runat="server" class="btn btn-primary" OnClick="Add_Student" Text="Save changes" />
                        <asp:Button type="button" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Close" />

                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="UpdateStudentModal" tabindex="-1" role="dialog" aria-labelledby="UpdateStudentModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateStudentModalLabel">Add New Student</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="updatestudentName">Name</label>
                            <asp:TextBox ID="updatestudentName" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                        <div class="form-group">

                            <label for="updatestudentDOB">Date of Birth</label>

                            <asp:TextBox ID="updatestudentDOB" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="updatestudentGender">Gender</label>
                            <asp:DropDownList ID="updatestudentGender" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="updatestudentEmail">Email</label>
                            <asp:TextBox ID="updatestudentEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                       <%-- <asp:Button type="button" runat="server" class="btn btn-primary" OnClick="UpdateStudent" Text="Update" />--%>
                        <asp:Button type="button" runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Close" />

                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</body>
</html>
