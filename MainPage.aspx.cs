using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentManagement
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                Retreive_Student(); 
            

        }

        protected void Add_Student(object sender, EventArgs e)
        {
            try
            {
                string name = studentName.Text;
                DateTime Dob = DateTime.Parse(studentDOB.Text);
                string Gender = studentGender.SelectedValue;
                string Email = studentEmail.Text;

                string connection = System.Configuration.ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connection))
                {
                    con.Open();
                    string sqlquery = "INSERT INTO STUDENT(StudentName,DOB,Gender,Email) VALUES (@StudentName,@DOB,@Gender,@Email);";

                    SqlCommand cmd = new SqlCommand(sqlquery, con);

                    cmd.Parameters.AddWithValue("@StudentName", name);
                    cmd.Parameters.AddWithValue("@DOB", Dob);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@Email", Email);

                    int newID = Convert.ToInt32(cmd.ExecuteScalar());

                    TableRow newrow = new TableRow();

                    TableCell cellid = new TableCell();
                    cellid.Text = newID.ToString();
                    newrow.Cells.Add(cellid);

                    TableCell cellname = new TableCell();
                    cellname.Text = name;
                    newrow.Cells.Add(cellname);

                    TableCell celldob = new TableCell();
                    celldob.Text = Dob.ToString();
                    newrow.Cells.Add(celldob);

                    TableCell cellgender = new TableCell();
                    cellgender.Text = Gender;
                    newrow.Cells.Add(cellgender);

                    TableCell cellemail = new TableCell();
                    cellemail.Text = Email;
                    newrow.Cells.Add(cellemail);

                    TableCell actionCell = new TableCell();
                    Button deleteButton = new Button();
                    deleteButton.Text = "Delete";
                    deleteButton.CssClass = "btn btn-danger";
                    deleteButton.CommandArgument = newID.ToString();
                    deleteButton.Command += new CommandEventHandler(DeleteStudent);
                    actionCell.Controls.Add(deleteButton);
                    newrow.Cells.Add(actionCell);

                    studentablebody.Controls.Add(newrow);

                    //Retreive_Student();

                    studentName.Text = "";
                    studentDOB.Text = "";
                    studentGender.SelectedIndex = 0;
                    studentEmail.Text = "";
                }
                

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        private void Retreive_Student()
        {
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT ID, StudentName, DOB, Gender, Email FROM STUDENT";

                    SqlCommand cmd = new SqlCommand(query, con);


                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();


                    studentablebody.Controls.Clear();

                    while (reader.Read())
                    {

                        TableRow newRow = new TableRow();

                        TableCell cellId = new TableCell();
                        cellId.Text = reader["ID"].ToString();
                        newRow.Cells.Add(cellId);

                        TableCell cellName = new TableCell();
                        cellName.Text = reader["StudentName"].ToString();
                        newRow.Cells.Add(cellName);

                        TableCell cellDob = new TableCell();
                        cellDob.Text = Convert.ToDateTime(reader["DOB"]).ToString();
                        newRow.Cells.Add(cellDob);

                        TableCell cellGender = new TableCell();
                        cellGender.Text = reader["Gender"].ToString();
                        newRow.Cells.Add(cellGender);

                        TableCell cellEmail = new TableCell();
                        cellEmail.Text = reader["Email"].ToString();
                        newRow.Cells.Add(cellEmail);

                        TableCell actionCell = new TableCell();
                        Button deleteButton = new Button();
                        deleteButton.Text = "Delete";
                        deleteButton.CssClass = "btn btn-danger";
                        deleteButton.CommandArgument = reader["ID"].ToString();
                        deleteButton.Command += new CommandEventHandler(DeleteStudent);
                        actionCell.Controls.Add(deleteButton);
                        newRow.Cells.Add(actionCell);


                        studentablebody.Controls.Add(newRow);
                    }

                    reader.Close();
                }
                //Response.Redirect("Default.aspx");
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

    

        protected void DeleteStudent(object sender, CommandEventArgs e)
        {
            try
            {


                string studentId = e.CommandArgument.ToString();
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "Delete FROM STUDENT where ID = @ID";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@ID", studentId);

                    cmd.ExecuteNonQuery();
                }
                //Retreive_Student();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}