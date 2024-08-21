using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentManagement
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string connection = System.Configuration.ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

        protected void AddStudent(object sender, EventArgs e)
        {
            string name = studentname.Text;
            DateTime Dob = DateTime.Parse(dob.Text);
            string Gender = gender.Text;
            string Email = email.Text;


            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();

                string sqlquery = "INSERT INTO STUDENT(StudentName,DOB,Gender,Email) VALUES (@StudentName,@DOB,@Gender,@Email);";

                using (SqlCommand cmd = new SqlCommand(sqlquery, con))
                {

                    cmd.Parameters.AddWithValue("@StudentName", name);
                    cmd.Parameters.AddWithValue("@DOB", Dob);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Create a DataTable to hold the data from the SqlDataReader
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        GridView1.DataBind();
                    }
                }
                studentname.Text = "";
                dob.Text = "";
                gender.Text = "";
                email.Text = "";
            }
        }

        protected void Update(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();

                string sqlquery = "UPDATE STUDENT SET StudentName=@StudentName, DOB = @DOB, Gender = @Gender ,Email = @Email WHERE ID = @ID;";

                string studentid = id.Text;
                string name = studentname.Text;
                DateTime Dob = DateTime.Parse(dob.Text);
                string Gender = gender.Text;
                string Email = email.Text;

                using (SqlCommand cmd = new SqlCommand(sqlquery, con))
                {
                    cmd.Parameters.AddWithValue("@ID", studentid);
                    cmd.Parameters.AddWithValue("@StudentName", name);
                    cmd.Parameters.AddWithValue("@DOB", Dob);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Create a DataTable to hold the data from the SqlDataReader
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        GridView1.DataBind();
                    }
                }
            }
        }

                    protected void Delete(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();

                string sqlquery = "DELETE FROM STUDENT WHERE ID = @ID;";

                string studentid = id.Text;

                using (SqlCommand cmd = new SqlCommand(sqlquery, con))
                {
                    cmd.Parameters.AddWithValue("@ID", studentid);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if(rowsAffected > 0)
                    {
                        GridView1.DataBind();
                    }

                }
            }
        }


        protected void RetreiveData(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connection))
            {
                con.Open();

                string sqlquery = "SELECT StudentName, DOB, Gender, Email FROM STUDENT WHERE ID = @ID";

                string studentid = id.Text;

                using (SqlCommand cmd = new SqlCommand(sqlquery, con))
                {
                    cmd.Parameters.AddWithValue("@ID", studentid);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                           
                            ViewState["StudentID"] = studentid;
                            ViewState["StudentName"] = reader["StudentName"].ToString();
                            ViewState["DOB"] = reader["DOB"].ToString();
                            ViewState["Gender"] = reader["Gender"].ToString();
                            ViewState["Email"] = reader["Email"].ToString();

                           
                            studentname.Text = reader["StudentName"].ToString();
                            dob.Text = reader["DOB"].ToString();
                            gender.Text = reader["Gender"].ToString();
                            email.Text = reader["Email"].ToString();
                        }
                    }
                    }
            }
        }


    }
}