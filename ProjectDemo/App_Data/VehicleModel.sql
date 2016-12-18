CREATE TABLE [dbo].[VehiceModel]
(
	[VehicleModelID] INT NOT NULL PRIMARY KEY,
	[VehicleID] int Foreign Key References VehicleMake(VehicleID),
	[Model] Varchar(50)
);
