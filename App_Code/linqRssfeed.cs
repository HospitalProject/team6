﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Rssfeed Class
/// </summary>
public class linqRssfeed
{

    public IQueryable<rss> getrssfeeds() // get the database from rss table
    {
        rssfeedDataContext objRF = new rssfeedDataContext(); //An instance of the data context class with the name which was generated by LINQ
        var allrssfeeds = objRF.rsses.Select(x => x); // <-- method syntax -->
        //For binding the data bound control
        return allrssfeeds;
    }
    //Call the value by id
    public IQueryable<rss> getrssfeedsByID(int _id)
    {
        rssfeedDataContext objRF = new rssfeedDataContext();
        var allrssfeeds = objRF.rsses.Where(x => x.rss_Id == _id).Select(x => x);
        return allrssfeeds;
    }


    // This is LINQ insert
    public bool commitInsert(string _rss_title, string _rss_url)// Generate property for insert
    {
        //Creat an example of the table
        rssfeedDataContext objRF = new rssfeedDataContext();
        using (objRF)
        {//Set the value to table from user page
            rss objInRF = new rss();
            objInRF.rss_title = _rss_title;// pass the variable (_rss_title) to field of table (field of table is rss_title)
            objInRF.rss_url = _rss_url;
            objRF.rsses.InsertOnSubmit(objInRF);//Insert command
            objRF.SubmitChanges();// Tells Linq to execute for inserting data
            return true;

        }
    }
    //This is LINQ update
    public bool commitEdit(int _id, string _rss_title, string _rss_url)// Generate property for update
    {
        rssfeedDataContext objRF = new rssfeedDataContext();
        using (objRF)
        {
            var objEdRF = objRF.rsses.Single(x => x.rss_Id == _id);
            objEdRF.rss_title = _rss_title; // pass the variable to field of table
            objEdRF.rss_url = _rss_url;
            objRF.SubmitChanges(); // Tells Linq to execute for updating data
            return true;
        }
    }
    //This is LINQ delete
    public bool commitDelete(int _id)
    {
        rssfeedDataContext objRF = new rssfeedDataContext();
        using (objRF)
        {
            var objDelRF = objRF.rsses.Single(x => x.rss_Id == _id);
            objRF.rsses.DeleteOnSubmit(objDelRF);//Delete command
            objRF.SubmitChanges();// Tells Linq to execute for deleting data
            return true;
        }
    }

}
