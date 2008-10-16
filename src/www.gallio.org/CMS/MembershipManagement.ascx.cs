using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CMS_MembershipManagement : UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (GridView1.SelectedRow != null)
        {
            string selectedUser = GetSelectedUserId();
            DisplaySelectedUserInformation(selectedUser);
        }
    }

    private void DisplaySelectedUserInformation(string user)
    {
        if (user == null) throw new ArgumentNullException("user");

        string query =
            "SELECT au.UserName, m.Email, m.IsApproved, m.IsLockedOut, m.CreateDate, m.LastLoginDate, m.FailedPasswordAttemptCount " +
            "FROM dbo.aspnet_Membership m " +
            "INNER JOIN dbo.aspnet_Users au " +
            "ON m.UserId = au.UserId " +
            "WHERE au.UserId = @userId";

        SqlParameter[] sqlParameters = new SqlParameter[1];
        sqlParameters[0] = new SqlParameter("@userId", user);

        DataSet ds = ExecuteQuery(query, sqlParameters);

        memberDetails.DataSource = ds;
        memberDetails.DataBind();

        DisplayUsersRoles();
    }

    private void DisplayUsersRoles()
    {
        CheckBoxRepeater.DataSource = Roles.GetAllRoles();
        CheckBoxRepeater.DataBind();
    }

    private DataSet ExecuteQuery(string query, SqlParameter[] sqlParameters)
    {
        DataSet ds = new DataSet();
        using (SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["localSqlServer"].ConnectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand sqlCmd = new SqlCommand(query, sqlConn);
            sqlCmd.Parameters.AddRange(sqlParameters);
            adapter.SelectCommand = sqlCmd;
            adapter.Fill(ds);
        }

        return ds;
    }
    protected void disableUser_Click(object sender, EventArgs e)
    {
        string selectedUser = GetSelectedUserId();
        DisableUser(selectedUser);
    }

    private void DisableUser(string user)
    {
        string query =
            "UPDATE dbo.aspnet_Membership SET IsLockedOut = 1 WHERE UserId = (SELECT UserId from dbo.aspnet_Users WHERE UserId = @userId)";
        int rows;

        rows = ExecuteUpdate(query, user);


        if (rows == 1)
            status.Text = "User Disabled";
        else
            status.Text = "Problem disabling user. Account might still be enabled.";
    }

    private int ExecuteUpdate(string query, string user)
    {
        int rows;
        using (SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["localSqlServer"].ConnectionString))
        {
            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = sqlConn;
            sqlCmd.CommandText = query;
            sqlCmd.Parameters.Add(new SqlParameter("@userId", user));

            try
            {
                sqlConn.Open();
                rows = sqlCmd.ExecuteNonQuery();
            }
            finally
            {
                sqlConn.Close();
            }
        }
        return rows;
    }

    protected void EnableUser_Click(object sender, EventArgs e)
    {
        string selectedUser = GetSelectedUserId();
        EnableUser(selectedUser);
    }

    private string GetSelectedUserId()
    {
        string username = GetSelectedUserName();
        string userId = Membership.GetUser(username).ProviderUserKey.ToString();
        return userId;
    }

    private string GetSelectedUserName()
    {
        return GridView1.SelectedRow.Cells[1].Text;
    }

    private void EnableUser(string user)
    {
        string query =
            "UPDATE dbo.aspnet_Membership SET IsLockedOut = 0 WHERE UserId = (SELECT UserId from dbo.aspnet_Users WHERE UserId = @userId)";
        int rows;

        rows = ExecuteUpdate(query, user);


        if (rows == 1)
            status.Text = "User Enabled";
        else
            status.Text = "Problem enabling user. Account might still be disabled.";
    }

    protected void UserRoleChanged(object sender, EventArgs e)
    {
        CheckBox item = ((CheckBox) sender);
        string username = GetSelectedUserName();
        string role = item.Text;
        bool isChecked = item.Checked;

        UpdateRoleMembership(username, role, isChecked);
    }

    private void UpdateRoleMembership(string username, string role, bool add)
    {
        bool userInRole = Roles.IsUserInRole(username, role);
        try
        {
            if (add && !userInRole)
            {
                Roles.AddUserToRoles(username, new string[] { role });
            }
            else if (!add && userInRole)
            {
                Roles.RemoveUserFromRoles(username, new string[] { role });
            }
        }
        catch (Exception)
        {
        }
    }

    public bool IsUserInRole(string roleName)
    {
        if (string.IsNullOrEmpty(GetSelectedUserName()) ||
            string.IsNullOrEmpty(roleName))
        {
            return false;
        }

        return Roles.IsUserInRole(GetSelectedUserName(), roleName);
    }
}