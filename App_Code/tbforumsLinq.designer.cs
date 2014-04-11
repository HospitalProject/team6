﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34014
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



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="DataSource")]
public partial class tbforumsLinqDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Inserttb_forums(tb_forums instance);
  partial void Updatetb_forums(tb_forums instance);
  partial void Deletetb_forums(tb_forums instance);
  #endregion
	
	public tbforumsLinqDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["DataSourceConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public tbforumsLinqDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public tbforumsLinqDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public tbforumsLinqDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public tbforumsLinqDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<tb_forums> tb_forums
	{
		get
		{
			return this.GetTable<tb_forums>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tb_forums")]
public partial class tb_forums : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _id;
	
	private string _title;
	
	private System.Nullable<System.DateTime> _dates;
	
	private System.Nullable<System.Guid> _authorid;
	
	private System.Nullable<int> _hf_nums;
	
	private System.Nullable<int> _sfhf;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OntitleChanging(string value);
    partial void OntitleChanged();
    partial void OndatesChanging(System.Nullable<System.DateTime> value);
    partial void OndatesChanged();
    partial void OnauthoridChanging(System.Nullable<System.Guid> value);
    partial void OnauthoridChanged();
    partial void Onhf_numsChanging(System.Nullable<int> value);
    partial void Onhf_numsChanged();
    partial void OnsfhfChanging(System.Nullable<int> value);
    partial void OnsfhfChanged();
    #endregion
	
	public tb_forums()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int id
	{
		get
		{
			return this._id;
		}
		set
		{
			if ((this._id != value))
			{
				this.OnidChanging(value);
				this.SendPropertyChanging();
				this._id = value;
				this.SendPropertyChanged("id");
				this.OnidChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_title", DbType="NVarChar(100)")]
	public string title
	{
		get
		{
			return this._title;
		}
		set
		{
			if ((this._title != value))
			{
				this.OntitleChanging(value);
				this.SendPropertyChanging();
				this._title = value;
				this.SendPropertyChanged("title");
				this.OntitleChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_dates", DbType="DateTime")]
	public System.Nullable<System.DateTime> dates
	{
		get
		{
			return this._dates;
		}
		set
		{
			if ((this._dates != value))
			{
				this.OndatesChanging(value);
				this.SendPropertyChanging();
				this._dates = value;
				this.SendPropertyChanged("dates");
				this.OndatesChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_authorid", DbType="UniqueIdentifier")]
	public System.Nullable<System.Guid> authorid
	{
		get
		{
			return this._authorid;
		}
		set
		{
			if ((this._authorid != value))
			{
				this.OnauthoridChanging(value);
				this.SendPropertyChanging();
				this._authorid = value;
				this.SendPropertyChanged("authorid");
				this.OnauthoridChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_hf_nums", DbType="Int")]
	public System.Nullable<int> hf_nums
	{
		get
		{
			return this._hf_nums;
		}
		set
		{
			if ((this._hf_nums != value))
			{
				this.Onhf_numsChanging(value);
				this.SendPropertyChanging();
				this._hf_nums = value;
				this.SendPropertyChanged("hf_nums");
				this.Onhf_numsChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_sfhf", DbType="Int")]
	public System.Nullable<int> sfhf
	{
		get
		{
			return this._sfhf;
		}
		set
		{
			if ((this._sfhf != value))
			{
				this.OnsfhfChanging(value);
				this.SendPropertyChanging();
				this._sfhf = value;
				this.SendPropertyChanged("sfhf");
				this.OnsfhfChanged();
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
