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



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="DB_69755_aspclass")]
public partial class sliderLinqDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void InsertsliderImage(sliderImage instance);
  partial void UpdatesliderImage(sliderImage instance);
  partial void DeletesliderImage(sliderImage instance);
  #endregion
	
	public sliderLinqDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["DB_69755_aspclassConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public sliderLinqDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public sliderLinqDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public sliderLinqDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public sliderLinqDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<sliderImage> sliderImages
	{
		get
		{
			return this.GetTable<sliderImage>();
		}
	}
	
	[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.getSliderImages")]
	public ISingleResult<getSliderImagesResult> getSliderImages()
	{
		IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())));
		return ((ISingleResult<getSliderImagesResult>)(result.ReturnValue));
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.sliderImages")]
public partial class sliderImage : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _sliderID;
	
	private string _simageName;
	
	private string _simageText;
	
	private int _simageOrder;
	
	private string _simageTitle;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnsliderIDChanging(int value);
    partial void OnsliderIDChanged();
    partial void OnsimageNameChanging(string value);
    partial void OnsimageNameChanged();
    partial void OnsimageTextChanging(string value);
    partial void OnsimageTextChanged();
    partial void OnsimageOrderChanging(int value);
    partial void OnsimageOrderChanged();
    partial void OnsimageTitleChanging(string value);
    partial void OnsimageTitleChanged();
    #endregion
	
	public sliderImage()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_sliderID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int sliderID
	{
		get
		{
			return this._sliderID;
		}
		set
		{
			if ((this._sliderID != value))
			{
				this.OnsliderIDChanging(value);
				this.SendPropertyChanging();
				this._sliderID = value;
				this.SendPropertyChanged("sliderID");
				this.OnsliderIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_simageName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string simageName
	{
		get
		{
			return this._simageName;
		}
		set
		{
			if ((this._simageName != value))
			{
				this.OnsimageNameChanging(value);
				this.SendPropertyChanging();
				this._simageName = value;
				this.SendPropertyChanged("simageName");
				this.OnsimageNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_simageText", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
	public string simageText
	{
		get
		{
			return this._simageText;
		}
		set
		{
			if ((this._simageText != value))
			{
				this.OnsimageTextChanging(value);
				this.SendPropertyChanging();
				this._simageText = value;
				this.SendPropertyChanged("simageText");
				this.OnsimageTextChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_simageOrder", DbType="Int NOT NULL")]
	public int simageOrder
	{
		get
		{
			return this._simageOrder;
		}
		set
		{
			if ((this._simageOrder != value))
			{
				this.OnsimageOrderChanging(value);
				this.SendPropertyChanging();
				this._simageOrder = value;
				this.SendPropertyChanged("simageOrder");
				this.OnsimageOrderChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_simageTitle", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string simageTitle
	{
		get
		{
			return this._simageTitle;
		}
		set
		{
			if ((this._simageTitle != value))
			{
				this.OnsimageTitleChanging(value);
				this.SendPropertyChanging();
				this._simageTitle = value;
				this.SendPropertyChanged("simageTitle");
				this.OnsimageTitleChanged();
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

public partial class getSliderImagesResult
{
	
	private string _simageName;
	
	private int _simageOrder;
	
	private string _simageTitle;
	
	private string _simageText;
	
	public getSliderImagesResult()
	{
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_simageName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string simageName
	{
		get
		{
			return this._simageName;
		}
		set
		{
			if ((this._simageName != value))
			{
				this._simageName = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_simageOrder", DbType="Int NOT NULL")]
	public int simageOrder
	{
		get
		{
			return this._simageOrder;
		}
		set
		{
			if ((this._simageOrder != value))
			{
				this._simageOrder = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_simageTitle", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string simageTitle
	{
		get
		{
			return this._simageTitle;
		}
		set
		{
			if ((this._simageTitle != value))
			{
				this._simageTitle = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_simageText", DbType="NVarChar(MAX) NOT NULL", CanBeNull=false)]
	public string simageText
	{
		get
		{
			return this._simageText;
		}
		set
		{
			if ((this._simageText != value))
			{
				this._simageText = value;
			}
		}
	}
}
#pragma warning restore 1591
