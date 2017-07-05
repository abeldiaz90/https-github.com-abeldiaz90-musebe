﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MusebeWEBFinal
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="DB_9B18B8_musebe")]
	public partial class MUSEBEDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    #endregion
		
		public MUSEBEDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["DB_9B18B8_musebeConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public MUSEBEDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public MUSEBEDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public MUSEBEDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public MUSEBEDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.ROLES_MODIFICAR_PERMISOS")]
		public int ROLES_MODIFICAR_PERMISOS([global::System.Data.Linq.Mapping.ParameterAttribute(Name="ID_ROL", DbType="Int")] System.Nullable<int> iD_ROL, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="PERMISOS", DbType="VarChar(MAX)")] string pERMISOS)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), iD_ROL, pERMISOS);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Productos_Modificar_Foto")]
		public int Productos_Modificar_Foto([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Id", DbType="Int")] System.Nullable<int> id, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Imagen", DbType="Image")] System.Data.Linq.Binary imagen)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), id, imagen);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Usuarios_Insertar")]
		public int Usuarios_Insertar([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Usuario", DbType="VarChar(MAX)")] string usuario, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Password", DbType="VarChar(MAX)")] string password, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="ID_ROL", DbType="Int")] System.Nullable<int> iD_ROL, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Correo", DbType="VarChar(MAX)")] string correo)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), usuario, password, iD_ROL, correo);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Cotizaciones_Detalle_Insertar")]
		public int Cotizaciones_Detalle_Insertar([global::System.Data.Linq.Mapping.ParameterAttribute(Name="FolioCotizacion", DbType="VarChar(MAX)")] string folioCotizacion, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Producto", DbType="VarChar(MAX)")] string producto, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Cantidad", DbType="Real")] System.Nullable<float> cantidad)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), folioCotizacion, producto, cantidad);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Cotizaciones_Abrir")]
		public ISingleResult<Cotizaciones_AbrirResult> Cotizaciones_Abrir([global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdCotizacion", DbType="Int")] System.Nullable<int> idCotizacion)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), idCotizacion);
			return ((ISingleResult<Cotizaciones_AbrirResult>)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Usuarios_Consultar_Datos")]
		public ISingleResult<Usuarios_Consultar_DatosResult> Usuarios_Consultar_Datos([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Usuario", DbType="VarChar(MAX)")] string usuario)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), usuario);
			return ((ISingleResult<Usuarios_Consultar_DatosResult>)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Usuarios_Modificar_Datos")]
		public int Usuarios_Modificar_Datos([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Usuario", DbType="VarChar(MAX)")] string usuario, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Nombre", DbType="VarChar(MAX)")] string nombre, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Segundo_Nombre", DbType="VarChar(MAX)")] string segundo_Nombre, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Apellido_Paterno", DbType="VarChar(MAX)")] string apellido_Paterno, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Apellido_Materno", DbType="VarChar(MAX)")] string apellido_Materno, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Correo", DbType="VarChar(MAX)")] string correo)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), usuario, nombre, segundo_Nombre, apellido_Paterno, apellido_Materno, correo);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Empresas_Insertar_Logo")]
		public int Empresas_Insertar_Logo([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Id", DbType="Int")] System.Nullable<int> id, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Logo", DbType="Image")] System.Data.Linq.Binary logo)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), id, logo);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.ObtenerPassword")]
		public ISingleResult<ObtenerPasswordResult> ObtenerPassword([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Usuario", DbType="VarChar(MAX)")] string usuario, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Password", DbType="VarChar(MAX)")] string password)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), usuario, password);
			return ((ISingleResult<ObtenerPasswordResult>)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Usuarios_Cambiar_Contraseña")]
		public int Usuarios_Cambiar_Contraseña([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Usuario", DbType="VarChar(MAX)")] string usuario, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Password", DbType="VarChar(MAX)")] string password)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), usuario, password);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Documentos_Modificar_Requisicion")]
		public int Documentos_Modificar_Requisicion([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Id", DbType="Int")] System.Nullable<int> id, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="URL", DbType="VarChar(MAX)")] string uRL)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), id, uRL);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.COTIZACIONES_INSERTAR")]
		public int COTIZACIONES_INSERTAR([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Folio", DbType="VarChar(MAX)")] string folio, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Fecha", DbType="DateTime")] System.Nullable<System.DateTime> fecha, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Requisicion", DbType="VarChar(MAX)")] string requisicion, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdCliente", DbType="Int")] System.Nullable<int> idCliente, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdContacto", DbType="Int")] System.Nullable<int> idContacto, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Margen", DbType="Real")] System.Nullable<float> margen, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Usuario", DbType="VarChar(MAX)")] string usuario, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Titulo", DbType="VarChar(MAX)")] string titulo, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdPrecioLista", DbType="Int")] System.Nullable<int> idPrecioLista, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdFormaPago", DbType="Int")] System.Nullable<int> idFormaPago, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Referencia", DbType="VarChar(MAX)")] string referencia, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdMetodoPago", DbType="Int")] System.Nullable<int> idMetodoPago, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="TiempoEntrega", DbType="VarChar(MAX)")] string tiempoEntrega, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="LugarEntrega", DbType="VarChar(MAX)")] string lugarEntrega)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), folio, fecha, requisicion, idCliente, idContacto, margen, usuario, titulo, idPrecioLista, idFormaPago, referencia, idMetodoPago, tiempoEntrega, lugarEntrega);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.CotizacionCopiar")]
		public int CotizacionCopiar([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Id", DbType="Int")] System.Nullable<int> id)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), id);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Entradas_Obtener_Folio")]
		public ISingleResult<Entradas_Obtener_FolioResult> Entradas_Obtener_Folio()
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())));
			return ((ISingleResult<Entradas_Obtener_FolioResult>)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Entradas_Insertar")]
		public int Entradas_Insertar([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Id", DbType="Int")] System.Nullable<int> id, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdOrigen", DbType="Int")] System.Nullable<int> idOrigen, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Idproveedor", DbType="Int")] System.Nullable<int> idproveedor, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Fecha", DbType="DateTime")] System.Nullable<System.DateTime> fecha, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Factura", DbType="VarChar(MAX)")] string factura, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Documento", DbType="VarChar(MAX)")] string documento)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), id, idOrigen, idproveedor, fecha, factura, documento);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Entradas_Consultar_Detalle")]
		public ISingleResult<Entradas_Consultar_DetalleResult> Entradas_Consultar_Detalle([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Id", DbType="Int")] System.Nullable<int> id)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), id);
			return ((ISingleResult<Entradas_Consultar_DetalleResult>)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Entradas_Documentos_Factura")]
		public int Entradas_Documentos_Factura([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Id", DbType="Int")] System.Nullable<int> id, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Documento", DbType="VarChar(MAX)")] string documento)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), id, documento);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Entradas_Insertar_Detalle")]
		public int Entradas_Insertar_Detalle([global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdEntrada", DbType="Int")] System.Nullable<int> idEntrada, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Idproducto", DbType="Int")] System.Nullable<int> idproducto, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Cantidad", DbType="Int")] System.Nullable<int> cantidad, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="CostoUnitario", DbType="Money")] System.Nullable<decimal> costoUnitario)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), idEntrada, idproducto, cantidad, costoUnitario);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Compras_Detalle_Eliminar")]
		public int Compras_Detalle_Eliminar([global::System.Data.Linq.Mapping.ParameterAttribute(Name="Id", DbType="Int")] System.Nullable<int> id)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), id);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Compras_Detalle_Mostrar")]
		public ISingleResult<Compras_Detalle_MostrarResult> Compras_Detalle_Mostrar([global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdCompra", DbType="Int")] System.Nullable<int> idCompra)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), idCompra);
			return ((ISingleResult<Compras_Detalle_MostrarResult>)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Compras_Obtener_Folio")]
		public ISingleResult<Compras_Obtener_FolioResult> Compras_Obtener_Folio()
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())));
			return ((ISingleResult<Compras_Obtener_FolioResult>)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Compras_Detalle_Insertar")]
		public int Compras_Detalle_Insertar([global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdCompra", DbType="Int")] System.Nullable<int> idCompra, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Producto", DbType="VarChar(MAX)")] string producto, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="PrecioUnitario", DbType="Money")] System.Nullable<decimal> precioUnitario, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Cantidad", DbType="Real")] System.Nullable<float> cantidad)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), idCompra, producto, precioUnitario, cantidad);
			return ((int)(result.ReturnValue));
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.Compras_Insertar_Modificar")]
		public int Compras_Insertar_Modificar(
					[global::System.Data.Linq.Mapping.ParameterAttribute(Name="Id", DbType="VarChar(MAX)")] string id, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(Name="FechaCompra", DbType="DateTime")] System.Nullable<System.DateTime> fechaCompra, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(Name="Idproveedor", DbType="VarChar(MAX)")] string idproveedor, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdFormaPago", DbType="VarChar(MAX)")] string idFormaPago, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdTipoCredito", DbType="VarChar(MAX)")] string idTipoCredito, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="VarChar(MAX)")] string mesesCredito, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="VarChar(MAX)")] string diasCredito, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdMetodoPago", DbType="VarChar(MAX)")] string idMetodoPago, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(Name="IdTarjeta", DbType="VarChar(MAX)")] string idTarjeta, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(Name="NumeroCheque", DbType="VarChar(MAX)")] string numeroCheque, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(Name="FechaPagoTarjeta", DbType="DateTime")] System.Nullable<System.DateTime> fechaPagoTarjeta, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="Money")] System.Nullable<decimal> subtotal, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="Money")] System.Nullable<decimal> iva, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="Money")] System.Nullable<decimal> ieps, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="Money")] System.Nullable<decimal> ish, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="Money")] System.Nullable<decimal> propina, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="Bit")] System.Nullable<bool> ameses, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="VarChar(MAX)")] string xml, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="VarChar(MAX)")] string pdf, 
					[global::System.Data.Linq.Mapping.ParameterAttribute(DbType="VarChar(MAX)")] string tipogasto)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), id, fechaCompra, idproveedor, idFormaPago, idTipoCredito, mesesCredito, diasCredito, idMetodoPago, idTarjeta, numeroCheque, fechaPagoTarjeta, subtotal, iva, ieps, ish, propina, ameses, xml, pdf, tipogasto);
			return ((int)(result.ReturnValue));
		}
	}
	
	public partial class Cotizaciones_AbrirResult
	{
		
		private int _Id;
		
		private string _Folio;
		
		private System.Nullable<System.DateTime> _Fecha;
		
		private string _Requisicion;
		
		private System.Nullable<int> _IdCliente;
		
		private System.Nullable<int> _IdContacto;
		
		private System.Nullable<float> _Margen;
		
		private string _Usuario;
		
		private string _Titulo;
		
		private System.Nullable<int> _IdPrecioLista;
		
		private System.Nullable<int> _IdFormaPago;
		
		private string _TiempoEntrega;
		
		private string _Referencia;
		
		private string _LugarEntrega;
		
		public Cotizaciones_AbrirResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", DbType="Int NOT NULL")]
		public int Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this._Id = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Folio", DbType="VarChar(MAX)")]
		public string Folio
		{
			get
			{
				return this._Folio;
			}
			set
			{
				if ((this._Folio != value))
				{
					this._Folio = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Fecha", DbType="DateTime")]
		public System.Nullable<System.DateTime> Fecha
		{
			get
			{
				return this._Fecha;
			}
			set
			{
				if ((this._Fecha != value))
				{
					this._Fecha = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Requisicion", DbType="VarChar(MAX)")]
		public string Requisicion
		{
			get
			{
				return this._Requisicion;
			}
			set
			{
				if ((this._Requisicion != value))
				{
					this._Requisicion = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IdCliente", DbType="Int")]
		public System.Nullable<int> IdCliente
		{
			get
			{
				return this._IdCliente;
			}
			set
			{
				if ((this._IdCliente != value))
				{
					this._IdCliente = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IdContacto", DbType="Int")]
		public System.Nullable<int> IdContacto
		{
			get
			{
				return this._IdContacto;
			}
			set
			{
				if ((this._IdContacto != value))
				{
					this._IdContacto = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Margen", DbType="Real")]
		public System.Nullable<float> Margen
		{
			get
			{
				return this._Margen;
			}
			set
			{
				if ((this._Margen != value))
				{
					this._Margen = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Usuario", DbType="VarChar(MAX)")]
		public string Usuario
		{
			get
			{
				return this._Usuario;
			}
			set
			{
				if ((this._Usuario != value))
				{
					this._Usuario = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Titulo", DbType="VarChar(MAX)")]
		public string Titulo
		{
			get
			{
				return this._Titulo;
			}
			set
			{
				if ((this._Titulo != value))
				{
					this._Titulo = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IdPrecioLista", DbType="Int")]
		public System.Nullable<int> IdPrecioLista
		{
			get
			{
				return this._IdPrecioLista;
			}
			set
			{
				if ((this._IdPrecioLista != value))
				{
					this._IdPrecioLista = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IdFormaPago", DbType="Int")]
		public System.Nullable<int> IdFormaPago
		{
			get
			{
				return this._IdFormaPago;
			}
			set
			{
				if ((this._IdFormaPago != value))
				{
					this._IdFormaPago = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TiempoEntrega", DbType="VarChar(MAX)")]
		public string TiempoEntrega
		{
			get
			{
				return this._TiempoEntrega;
			}
			set
			{
				if ((this._TiempoEntrega != value))
				{
					this._TiempoEntrega = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Referencia", DbType="VarChar(MAX)")]
		public string Referencia
		{
			get
			{
				return this._Referencia;
			}
			set
			{
				if ((this._Referencia != value))
				{
					this._Referencia = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LugarEntrega", DbType="VarChar(MAX)")]
		public string LugarEntrega
		{
			get
			{
				return this._LugarEntrega;
			}
			set
			{
				if ((this._LugarEntrega != value))
				{
					this._LugarEntrega = value;
				}
			}
		}
	}
	
	public partial class Usuarios_Consultar_DatosResult
	{
		
		private int _Id;
		
		private System.Nullable<System.Guid> _Uuid;
		
		private string _Usuario;
		
		private string _Password;
		
		private string _Correo;
		
		private System.Nullable<bool> _Estado;
		
		private System.Nullable<int> _ID_ROL;
		
		private string _Nombre;
		
		private string _Segundo_Nombre;
		
		private string _Apellido_Paterno;
		
		private string _Apellido_Materno;
		
		public Usuarios_Consultar_DatosResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", DbType="Int NOT NULL")]
		public int Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this._Id = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Uuid", DbType="UniqueIdentifier")]
		public System.Nullable<System.Guid> Uuid
		{
			get
			{
				return this._Uuid;
			}
			set
			{
				if ((this._Uuid != value))
				{
					this._Uuid = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Usuario", DbType="VarChar(MAX)")]
		public string Usuario
		{
			get
			{
				return this._Usuario;
			}
			set
			{
				if ((this._Usuario != value))
				{
					this._Usuario = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Password", DbType="VarChar(MAX)")]
		public string Password
		{
			get
			{
				return this._Password;
			}
			set
			{
				if ((this._Password != value))
				{
					this._Password = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Correo", DbType="VarChar(MAX)")]
		public string Correo
		{
			get
			{
				return this._Correo;
			}
			set
			{
				if ((this._Correo != value))
				{
					this._Correo = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Estado", DbType="Bit")]
		public System.Nullable<bool> Estado
		{
			get
			{
				return this._Estado;
			}
			set
			{
				if ((this._Estado != value))
				{
					this._Estado = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID_ROL", DbType="Int")]
		public System.Nullable<int> ID_ROL
		{
			get
			{
				return this._ID_ROL;
			}
			set
			{
				if ((this._ID_ROL != value))
				{
					this._ID_ROL = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Nombre", DbType="VarChar(MAX)")]
		public string Nombre
		{
			get
			{
				return this._Nombre;
			}
			set
			{
				if ((this._Nombre != value))
				{
					this._Nombre = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Segundo_Nombre", DbType="VarChar(MAX)")]
		public string Segundo_Nombre
		{
			get
			{
				return this._Segundo_Nombre;
			}
			set
			{
				if ((this._Segundo_Nombre != value))
				{
					this._Segundo_Nombre = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Apellido_Paterno", DbType="VarChar(MAX)")]
		public string Apellido_Paterno
		{
			get
			{
				return this._Apellido_Paterno;
			}
			set
			{
				if ((this._Apellido_Paterno != value))
				{
					this._Apellido_Paterno = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Apellido_Materno", DbType="VarChar(MAX)")]
		public string Apellido_Materno
		{
			get
			{
				return this._Apellido_Materno;
			}
			set
			{
				if ((this._Apellido_Materno != value))
				{
					this._Apellido_Materno = value;
				}
			}
		}
	}
	
	public partial class ObtenerPasswordResult
	{
		
		private string _Password;
		
		public ObtenerPasswordResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Password", DbType="VarChar(MAX)")]
		public string Password
		{
			get
			{
				return this._Password;
			}
			set
			{
				if ((this._Password != value))
				{
					this._Password = value;
				}
			}
		}
	}
	
	public partial class Entradas_Obtener_FolioResult
	{
		
		private string _Folio;
		
		public Entradas_Obtener_FolioResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Folio", DbType="VarChar(MAX)")]
		public string Folio
		{
			get
			{
				return this._Folio;
			}
			set
			{
				if ((this._Folio != value))
				{
					this._Folio = value;
				}
			}
		}
	}
	
	public partial class Entradas_Consultar_DetalleResult
	{
		
		private int _Id;
		
		private int _IdOrigen;
		
		private int _IdProveedor;
		
		private System.DateTime _Fecha;
		
		private string _Factura;
		
		private string _Documento;
		
		public Entradas_Consultar_DetalleResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", DbType="Int NOT NULL")]
		public int Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this._Id = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IdOrigen", DbType="Int NOT NULL")]
		public int IdOrigen
		{
			get
			{
				return this._IdOrigen;
			}
			set
			{
				if ((this._IdOrigen != value))
				{
					this._IdOrigen = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IdProveedor", DbType="Int NOT NULL")]
		public int IdProveedor
		{
			get
			{
				return this._IdProveedor;
			}
			set
			{
				if ((this._IdProveedor != value))
				{
					this._IdProveedor = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Fecha", DbType="DateTime NOT NULL")]
		public System.DateTime Fecha
		{
			get
			{
				return this._Fecha;
			}
			set
			{
				if ((this._Fecha != value))
				{
					this._Fecha = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Factura", DbType="VarChar(50)")]
		public string Factura
		{
			get
			{
				return this._Factura;
			}
			set
			{
				if ((this._Factura != value))
				{
					this._Factura = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Documento", DbType="VarChar(MAX)")]
		public string Documento
		{
			get
			{
				return this._Documento;
			}
			set
			{
				if ((this._Documento != value))
				{
					this._Documento = value;
				}
			}
		}
	}
	
	public partial class Compras_Detalle_MostrarResult
	{
		
		private int _Id;
		
		private System.Nullable<int> _IdCompra;
		
		private System.Nullable<int> _IdProducto;
		
		private System.Nullable<decimal> _PrecioUnitario;
		
		private System.Nullable<float> _Cantidad;
		
		public Compras_Detalle_MostrarResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", DbType="Int NOT NULL")]
		public int Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this._Id = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IdCompra", DbType="Int")]
		public System.Nullable<int> IdCompra
		{
			get
			{
				return this._IdCompra;
			}
			set
			{
				if ((this._IdCompra != value))
				{
					this._IdCompra = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IdProducto", DbType="Int")]
		public System.Nullable<int> IdProducto
		{
			get
			{
				return this._IdProducto;
			}
			set
			{
				if ((this._IdProducto != value))
				{
					this._IdProducto = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PrecioUnitario", DbType="Money")]
		public System.Nullable<decimal> PrecioUnitario
		{
			get
			{
				return this._PrecioUnitario;
			}
			set
			{
				if ((this._PrecioUnitario != value))
				{
					this._PrecioUnitario = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Cantidad", DbType="Real")]
		public System.Nullable<float> Cantidad
		{
			get
			{
				return this._Cantidad;
			}
			set
			{
				if ((this._Cantidad != value))
				{
					this._Cantidad = value;
				}
			}
		}
	}
	
	public partial class Compras_Obtener_FolioResult
	{
		
		private string _Folio;
		
		public Compras_Obtener_FolioResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Folio", DbType="VarChar(MAX)")]
		public string Folio
		{
			get
			{
				return this._Folio;
			}
			set
			{
				if ((this._Folio != value))
				{
					this._Folio = value;
				}
			}
		}
	}
}
#pragma warning restore 1591