﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18063
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="DB_69755_aspclass")]
public partial class tickerNewsLinqDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertticker_new(ticker_new instance);
  partial void Updateticker_new(ticker_new instance);
  partial void Deleteticker_new(ticker_new instance);
  #endregion
	
	public tickerNewsLinqDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["DB_69755_aspclassConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public tickerNewsLinqDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public tickerNewsLinqDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public tickerNewsLinqDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public tickerNewsLinqDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<ticker_new> ticker_news
	{
		get
		{
			return this.GetTable<ticker_new>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.ticker_news")]
public partial class ticker_new : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _tn_id;
	
	private string _tn_content;
	
	private bool _display_status;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void Ontn_idChanging(int value);
    partial void Ontn_idChanged();
    partial void Ontn_contentChanging(string value);
    partial void Ontn_contentChanged();
    partial void Ondisplay_statusChanging(bool value);
    partial void Ondisplay_statusChanged();
    #endregion
	
	public ticker_new()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tn_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int tn_id
	{
		get
		{
			return this._tn_id;
		}
		set
		{
			if ((this._tn_id != value))
			{
				this.Ontn_idChanging(value);
				this.SendPropertyChanging();
				this._tn_id = value;
				this.SendPropertyChanged("tn_id");
				this.Ontn_idChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tn_content", DbType="NVarChar(250) NOT NULL", CanBeNull=false)]
	public string tn_content
	{
		get
		{
			return this._tn_content;
		}
		set
		{
			if ((this._tn_content != value))
			{
				this.Ontn_contentChanging(value);
				this.SendPropertyChanging();
				this._tn_content = value;
				this.SendPropertyChanged("tn_content");
				this.Ontn_contentChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_display_status", DbType="Bit NOT NULL")]
	public bool display_status
	{
		get
		{
			return this._display_status;
		}
		set
		{
			if ((this._display_status != value))
			{
				this.Ondisplay_statusChanging(value);
				this.SendPropertyChanging();
				this._display_status = value;
				this.SendPropertyChanged("display_status");
				this.Ondisplay_statusChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591
