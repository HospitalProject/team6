using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for linqUsers
/// </summary>
public class linqUsers
{
	public linqUsers()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //insert the additional user information to database
    public bool insertUserAdditionalInfo (Guid _userId, string _firstName, string _lastName, string _phone)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        using (objUserDC)
        {
            User_AddtionalInfo objUserAdditional = new User_AddtionalInfo();
            objUserAdditional.UserId = _userId;
            objUserAdditional.FirstName = _firstName;
            objUserAdditional.LastName = _lastName;
            objUserAdditional.Phone = _phone;
            objUserDC.User_AddtionalInfos.InsertOnSubmit(objUserAdditional);
            objUserDC.SubmitChanges();
            return true;
        }
    }

    //get user additional information by userid
    public IQueryable<User_AddtionalInfo> getUserAdditionalInfoByUserId(Guid _userId)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allUsers = objUserDC.User_AddtionalInfos.Where(x => x.UserId == _userId).Select(x => x);
        return allUsers;
    }

    //get all registered users (registered_users is a view)
    public IQueryable<registered_user> getAllRegisteredUsers()
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allRegisteredUsers = objUserDC.registered_users.Select(x => x);
        return allRegisteredUsers;
    }

    //get all doctors (doctors is a view)
    public IQueryable<doctor> getAllDoctors()
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allDoctors = objUserDC.doctors.Select(x => x);
        return allDoctors;
    }

}