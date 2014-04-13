using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class linqSurveyclass
{
	public IQueryable<Survey> getSurvey()
    {
		//creating an instance of the linq object
        linqSurveyDataContext objSurvDC = new linqSurveyDataContext();
        //creating an annonymous var with value being instance of the created object
        var allSurvey = objSurvDC.Surveys.Select(x => x);
        //return IQueryable<linqSurveyclass> to be binded
        return allSurvey;
	}

    public IQueryable<Survey> getSurveyByID(int _Id)
    {
        linqSurveyDataContext objSurvDC = new linqSurveyDataContext();
        var allSurvey = objSurvDC.Surveys.Where(x => x.Id == _Id).Select(x => x);
        return allSurvey;
    }

    public bool commitInsert(string _Title, string _Description, System.DateTime _CreatedOn, System.Nullable<System.DateTime> _ExpiresOn, int _CreatedBy, bool _Publish)
    {
        linqSurveyDataContext objSurvDC = new linqSurveyDataContext();
        using (objSurvDC)
        {
            //creating an instance of the table
            Survey objNewSurv = new Survey();
            //setting table to new values passed from web form
            objNewSurv.Title = _Title;
            objNewSurv.Description = _Description;
            objNewSurv.CreatedOn = _CreatedOn;
            objNewSurv.ExpiresOn = _ExpiresOn;
            objNewSurv.CreatedBy = _CreatedBy;
            objNewSurv.Publish = _Publish;

            //inserting command
            objSurvDC.Surveys.InsertOnSubmit(objNewSurv);
            //committing insert against database
            objSurvDC.SubmitChanges();
            return true;
        }
    }
        public bool commitUpdate(int _Id, string _Title, string _Description, System.DateTime _CreatedOn, System.Nullable<System.DateTime> _ExpiresOn, int _CreatedBy, bool _Publish)
        {
            linqSurveyDataContext objSurvDC = new linqSurveyDataContext();
        using (objSurvDC)
        {
            var objUpSurv = objSurvDC.Surveys.Single(x => x.Id == _Id);
            
            objUpSurv.Title = _Title;
            objUpSurv.Description = _Description;
            objUpSurv.CreatedOn = _CreatedOn;
            objUpSurv.ExpiresOn = _ExpiresOn;
            objUpSurv.CreatedBy = _CreatedBy;
            objUpSurv.Publish = _Publish;

            objSurvDC.SubmitChanges();
            return true;
        }
        }
        public bool commitDelete(int _Id)
        {
            linqSurveyDataContext objSurvDC = new linqSurveyDataContext();
            using (objSurvDC)
            {
                var objDelSurv = objSurvDC.Surveys.Single(x => x.Id == _Id);
                //to delete
                objSurvDC.Surveys.DeleteOnSubmit(objDelSurv);
                //committing to database
                objSurvDC.SubmitChanges();
                return true;
            }
        }

        public IQueryable<question> getQuestions()
        {
            //creating an instance of the linq object
            linqSurveyDataContext objQstnDC = new linqSurveyDataContext();
            //creating an annonymous var with value being instance of the created object
            var allQuestions = objQstnDC.questions.Select(x => x);
            //return IQueryable<linqSurveyclass> to be binded
            return allQuestions;
        }

        public IQueryable<question> getQuestionByID(int _Id)
        {
            linqSurveyDataContext objQstnDC = new linqSurveyDataContext();
            var allQuestions = objQstnDC.questions.Where(x => x.Id == _Id).Select(x => x);
            return allQuestions;
        }

        public bool commitInsertQ(string _Text, string _QuestionType, string _Options)
        {
            linqSurveyDataContext objQstnDC = new linqSurveyDataContext();
            using (objQstnDC)
            {
                //creating an instance of the table
                question objNewQstn = new question();
                //setting table to new values passed from web form
                objNewQstn.Text = _Text;
                objNewQstn.QuestionType = _QuestionType;
                objNewQstn.Options = _Options;        

                //inserting command
                objQstnDC.questions.InsertOnSubmit(objNewQstn);
                //committing insert against database
                objQstnDC.SubmitChanges();
                return true;
            }
        }
        public bool commitUpdateQ(int _Id, string _Text, string _QuestionType, string _Options)
        {
            linqSurveyDataContext objQstnDC = new linqSurveyDataContext();
            using (objQstnDC)
            {
                var objUpQstn = objQstnDC.questions.Single(x => x.Id == _Id);

                objUpQstn.Text = _Text;
                objUpQstn.QuestionType = _QuestionType;
                objUpQstn.Options = _Options;
                
                objQstnDC.SubmitChanges();
                return true;
            }
        }
        public bool commitQDelete(int _Id)
        {
            linqSurveyDataContext objQstnDC = new linqSurveyDataContext();
            using (objQstnDC)
            {
                var objDelQstn = objQstnDC.questions.Single(x => x.Id == _Id);
                //to delete
                objQstnDC.questions.DeleteOnSubmit(objDelQstn);
                //committing to database
                objQstnDC.SubmitChanges();
                return true;
            }
        }
        public enum QuestionTypes
        {
            SingleLineTextBox, // will render a textbox 
            MultiLineTextBox, // will render a text area
            YesOrNo, //will render a checkbox
            SingleSelect, //will render a dropdownlist
            MultiSelect //will render a listbox
        } 
}