/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      dbPos.DM1
 *
 * Date Created : Friday, October 20, 2023 22:21:19
 * Target DBMS : Microsoft SQL Server 2017
 */

USE master
go
CREATE DATABASE DbPOS
go
USE DbPOS
go
/* 
 * TABLE: Categoria 
 */

CREATE TABLE Categoria(
    IdCategoria        int              IDENTITY(1,1),
    NombreCategoria    nvarchar(100)    NULL,
    Estado             tinyint          NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (IdCategoria)
)
go



IF OBJECT_ID('Categoria') IS NOT NULL
    PRINT '<<< CREATED TABLE Categoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Categoria >>>'
go

/* 
 * TABLE: CierreCaja 
 */

CREATE TABLE CierreCaja(
    IdCierreCaja    int         NOT NULL,
    IdCompras       int         NOT NULL,
    IdProveedor     int         NOT NULL,
    IdVenta         int         NOT NULL,
    IdCliente       int         NOT NULL,
    IdUsuario       int         NOT NULL,
    IdEmpresa       int         NOT NULL,
    MontoCaja       float       NULL,
    FechaHora       datetime    NULL,
    CajaNumero      int         NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (IdCierreCaja, IdCompras, IdProveedor, IdVenta, IdCliente, IdUsuario, IdEmpresa)
)
go



IF OBJECT_ID('CierreCaja') IS NOT NULL
    PRINT '<<< CREATED TABLE CierreCaja >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CierreCaja >>>'
go

/* 
 * TABLE: Clientes 
 */

CREATE TABLE Clientes(
    IdCliente    int              IDENTITY(1,1),
    Nombre       nvarchar(100)    NOT NULL,
    Correo       nvarchar(100)    NULL,
    Contacto     nvarchar(20)     NULL,
    Ruc          nvarchar(60)     NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (IdCliente)
)
go



IF OBJECT_ID('Clientes') IS NOT NULL
    PRINT '<<< CREATED TABLE Clientes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Clientes >>>'
go

/* 
 * TABLE: Compras 
 */

CREATE TABLE Compras(
    IdCompras           int             IDENTITY(1,1),
    IdProveedor         int             NOT NULL,
    FechaCancelado      date            NULL,
    FechaVencimiento    date            NULL,
    EstadoCompras       tinyint         NULL,
    FechaCompra         datetime        NOT NULL,
    MontoFac            float           NOT NULL,
    TransaccionFac      nvarchar(20)    NOT NULL,
    FacturaNo           nvarchar(20)    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (IdCompras, IdProveedor)
)
go



IF OBJECT_ID('Compras') IS NOT NULL
    PRINT '<<< CREATED TABLE Compras >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Compras >>>'
go

/* 
 * TABLE: Empresa 
 */

CREATE TABLE Empresa(
    IdEmpresa    int               IDENTITY(1,1),
    Nombre       nvarchar(100)     NOT NULL,
    Ruc          nvarchar(60)      NULL,
    Correo       nvarchar(100)     NULL,
    Telefono     nvarchar(20)      NULL,
    Imagen       varbinary(max)    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (IdEmpresa)
)
go



IF OBJECT_ID('Empresa') IS NOT NULL
    PRINT '<<< CREATED TABLE Empresa >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Empresa >>>'
go

/* 
 * TABLE: Finanzas 
 */

CREATE TABLE Finanzas(
    IdFinanzas       int      IDENTITY(1,1),
    IdCierreCaja     int      NOT NULL,
    IdCompras        int      NOT NULL,
    IdProveedor      int      NOT NULL,
    IdVenta          int      NOT NULL,
    IdCliente        int      NOT NULL,
    IdUsuario        int      NOT NULL,
    IdEmpresa        int      NOT NULL,
    FechaFinanzas    date     NULL,
    MontoFinanzas    float    NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (IdFinanzas, IdCierreCaja, IdCompras, IdProveedor, IdVenta, IdCliente, IdUsuario, IdEmpresa)
)
go



IF OBJECT_ID('Finanzas') IS NOT NULL
    PRINT '<<< CREATED TABLE Finanzas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Finanzas >>>'
go

/* 
 * TABLE: Producto 
 */

CREATE TABLE Producto(
    IdProducto        int                 IDENTITY(1,1),
    IdCategoria       int                 NOT NULL,
    NombreProducto    nvarchar(100)       NOT NULL,
    PrecioUnitario    float               NOT NULL,
    PrecioVenta       float               NOT NULL,
    PrecioMayor       float               NOT NULL,
    Stock             double precision    NOT NULL,
    Imagen            varbinary(max)      NULL,
    Descripcion       nvarchar(100)       NULL,
    MarcaProducto     nvarchar(100)       NULL,
    EstadoProducto    tinyint             NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (IdProducto, IdCategoria)
)
go



IF OBJECT_ID('Producto') IS NOT NULL
    PRINT '<<< CREATED TABLE Producto >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Producto >>>'
go

/* 
 * TABLE: Proveedor 
 */

CREATE TABLE Proveedor(
    IdProveedor        int              IDENTITY(1,1),
    Nombre             nvarchar(100)    NOT NULL,
    Ruc                nvarchar(20)     NULL,
    Correo             nvarchar(100)    NULL,
    Contacto           nvarchar(20)     NULL,
    EstadoProveedor    tinyint          NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (IdProveedor)
)
go



IF OBJECT_ID('Proveedor') IS NOT NULL
    PRINT '<<< CREATED TABLE Proveedor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Proveedor >>>'
go

/* 
 * TABLE: Usuario 
 */

CREATE TABLE Usuario(
    IdUsuario        int               IDENTITY(1,1),
    Nombres          nvarchar(60)      NOT NULL,
    Apellidos        nvarchar(60)      NULL,
    Estado           tinyint           NOT NULL,
    Correo           nvarchar(100)     NULL,
    Rol              nvarchar(20)      NOT NULL,
    UserName         nvarchar(20)      NOT NULL,
    Password         nvarchar(60)      NOT NULL,
    Cedula           nvarchar(30)      NOT NULL,
    ClaveUnica       nvarchar(20)      NULL,
    ImagenUsuario    varbinary(max)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (IdUsuario)
)
go



IF OBJECT_ID('Usuario') IS NOT NULL
    PRINT '<<< CREATED TABLE Usuario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Usuario >>>'
go

/* 
 * TABLE: Ventas 
 */

CREATE TABLE Ventas(
    IdVenta               int             IDENTITY(1,1),
    IdCliente             int             NOT NULL,
    IdUsuario             int             NOT NULL,
    IdEmpresa             int             NOT NULL,
    FechaHora             datetime        NOT NULL,
    EstadoVentas          tinyint         NULL,
    MontoVenta            float           NOT NULL,
    TipoTransaccion       nvarchar(20)    NOT NULL,
    IdVentas_Productos    int             NULL,
    IdProducto            int             NULL,
    IdCategoria           int             NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (IdVenta, IdCliente, IdUsuario, IdEmpresa)
)
go



IF OBJECT_ID('Ventas') IS NOT NULL
    PRINT '<<< CREATED TABLE Ventas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Ventas >>>'
go

/* 
 * TABLE: Ventas_productos 
 */

CREATE TABLE Ventas_productos(
    IdVentas_Productos    int        IDENTITY(1,1),
    IdProducto            int        NOT NULL,
    IdCategoria           int        NOT NULL,
    Cantidad              float      NOT NULL,
    Precio                float      NOT NULL,
    EstadoVentasProd      tinyint    NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (IdVentas_Productos, IdProducto, IdCategoria)
)
go



IF OBJECT_ID('Ventas_productos') IS NOT NULL
    PRINT '<<< CREATED TABLE Ventas_productos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Ventas_productos >>>'
go

/* 
 * TABLE: CierreCaja 
 */

ALTER TABLE CierreCaja ADD CONSTRAINT RefCompras10 
    FOREIGN KEY (IdCompras, IdProveedor)
    REFERENCES Compras(IdCompras, IdProveedor)
go

ALTER TABLE CierreCaja ADD CONSTRAINT RefVentas11 
    FOREIGN KEY (IdVenta, IdCliente, IdUsuario, IdEmpresa)
    REFERENCES Ventas(IdVenta, IdCliente, IdUsuario, IdEmpresa)
go


/* 
 * TABLE: Compras 
 */

ALTER TABLE Compras ADD CONSTRAINT RefProveedor2 
    FOREIGN KEY (IdProveedor)
    REFERENCES Proveedor(IdProveedor)
go


/* 
 * TABLE: Finanzas 
 */

ALTER TABLE Finanzas ADD CONSTRAINT RefCierreCaja1 
    FOREIGN KEY (IdCierreCaja, IdCompras, IdProveedor, IdVenta, IdCliente, IdUsuario, IdEmpresa)
    REFERENCES CierreCaja(IdCierreCaja, IdCompras, IdProveedor, IdVenta, IdCliente, IdUsuario, IdEmpresa)
go


/* 
 * TABLE: Producto 
 */

ALTER TABLE Producto ADD CONSTRAINT RefCategoria9 
    FOREIGN KEY (IdCategoria)
    REFERENCES Categoria(IdCategoria)
go


/* 
 * TABLE: Ventas 
 */

ALTER TABLE Ventas ADD CONSTRAINT RefClientes3 
    FOREIGN KEY (IdCliente)
    REFERENCES Clientes(IdCliente)
go

ALTER TABLE Ventas ADD CONSTRAINT RefVentas_productos12 
    FOREIGN KEY (IdVentas_Productos, IdProducto, IdCategoria)
    REFERENCES Ventas_productos(IdVentas_Productos, IdProducto, IdCategoria)
go

ALTER TABLE Ventas ADD CONSTRAINT RefUsuario13 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go

ALTER TABLE Ventas ADD CONSTRAINT RefEmpresa14 
    FOREIGN KEY (IdEmpresa)
    REFERENCES Empresa(IdEmpresa)
go


/* 
 * TABLE: Ventas_productos 
 */

ALTER TABLE Ventas_productos ADD CONSTRAINT RefProducto7 
    FOREIGN KEY (IdProducto, IdCategoria)
    REFERENCES Producto(IdProducto, IdCategoria)
go


