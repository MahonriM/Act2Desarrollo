CREATE TABLE Municipio(
	idMunicipio int	 PRIMARY KEY,
	nombre varchar(100)
)
go
CREATE TABLE Empresa(
	idEmpresa int PRIMARY KEY,
	nombre varchar(100) ,
	direccion varchar(100) ,
	telefono varchar(20),
	idMunicipio int,
	constraint fk_idMunicipio FOREIGN KEY(idMunicipio) REFERENCES Municipio(idMunicipio))
go

--algunos datos
INSERT INTO Municipio VALUES(1,'Guadalupe')
INSERT INTO Municipio VALUES(2,'San Nicolas')
INSERT INTO Empresa VALUES(1,'Trans Rapido','conocida','123',1)
INSERT INTO Empresa VALUES(2,'Trans Lento','av pino suarez','321',1)
INSERT INTO Empresa VALUES(3,'Trans Despacio','av solidaridad','111',2)
go
--Store que devuelve la información de todas la empresas
CREATE PROCEDURE spEmpresaConsultarTodo
AS
BEGIN
		SELECT * FROM Empresa
END
GO
/*Store que devuelve la información de una empresa en particular. 
buscada por idEmpresa */
CREATE PROCEDURE spEmpresaConsultarPorID
		@idEmpresa int
AS
BEGIN
		SELECT * FROM Empresa
		WHERE idEmpresa = @idEmpresa
END
GO
--Store para registrar una nueva empresa (proporcionando todos los campos)
CREATE PROCEDURE spEmpresaInsertar
		@idEmpresa int,		
		@nombre varchar(100),
		@direccion varchar(100),
		@telefono varchar(20),
		@idMunicipio int
AS
BEGIN
		INSERT INTO Empresa VALUES(@idEmpresa,@nombre,@direccion,@telefono,@idMunicipio)
END
GO
--Store para modificar una nueva empresa (proporcionando todos los campos)
CREATE PROCEDURE spEmpresaModificar
		@idEmpresa int,		
		@nombre varchar(100),
		@direccion varchar(100),
		@telefono varchar(20),
		@idMunicipio int
AS
BEGIN
		UPDATE Empresa SET nombre=@nombre,direccion=@direccion,telefono=@telefono,idMunicipio=@idMunicipio
		WHERE idEmpresa=@idempresa
END
GO
--Store para eliminar una empresa 
CREATE PROCEDURE spEmpresaEliminar
		@idEmpresa int
AS
BEGIN
		DELETE FROM Empresa
		WHERE idEmpresa=@idempresa
END
GO

--Store que devuelve la información de todos los municipios
CREATE PROCEDURE spMunicipioConsultarTodo
AS
BEGIN
		SELECT * FROM Municipio
END
GO
/*Store que devuelve la información de un municipio en particular. 
buscado por idMunicipio */
CREATE PROCEDURE spMunicipioConsultarPorID
		@idMunicipio int
AS
BEGIN
		SELECT * FROM Municipio
		WHERE idMunicipio = @idMunicipio
END
GO
--Store para registrar un nuevo municipio (proporcionando todos los campos)
CREATE PROCEDURE spMunicipioInsertar
		@idMunicipio int,		
		@nombre varchar(100)		
AS
BEGIN
		INSERT INTO Municipio VALUES(@idMunicipio,@nombre)
END
GO
--Store para modificar un municipio (proporcionando todos los campos)
CREATE PROCEDURE spMunicipioModificar
		@idMunicipio int,		
		@nombre varchar(100)
AS
BEGIN
		UPDATE Municipio SET nombre=@nombre
		WHERE idMunicipio=@idMunicipio
END
GO
--Store para eliminar un municipio 
CREATE PROCEDURE spMunicipioEliminar
		@idMunicipio int
AS
BEGIN
		DELETE FROM Municipio
		WHERE idMunicipio=@idMunicipio
END
GO
