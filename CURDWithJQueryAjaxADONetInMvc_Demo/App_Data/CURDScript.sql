USE [MvcDemo]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 29-05-2020 15:55:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[Office] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[StartDate] [datetime] NULL,
	[Salary] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateEmployee]    Script Date: 29-05-2020 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AddUpdateEmployee]
( 
@Id int, 
@Name  nvarchar(50), 
@Age   INTEGER,                                        
@State nvarchar(50),                                         
@Country nvarchar(50),                                        
@Action  nvarchar(50) 
)
AS 
  BEGIN 
      IF @Action = 'Insert' 
        BEGIN 
            INSERT INTO Employee (Name, Age, [state], country) 
            VALUES (@Name, @Age, @State, @Country); 
        END 
      IF @Action = 'Update' 
        BEGIN 
            UPDATE Employee 
            SET    NAME = @Name, 
                   age = @Age, 
                   [state] = @State, 
                   country = @Country 
            WHERE  employeeid = @Id; 
        END 
  END 
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 29-05-2020 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteEmployee]
(
@Id int
)
as
begin
  delete from Employee Where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 29-05-2020 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetEmployees]
as
begin
	select Id,Name,Position,Office,Age,StartDate,Salary from Employee
end
GO
/****** Object:  StoredProcedure [dbo].[NewEmployee]    Script Date: 29-05-2020 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NewEmployee]
( 
@Name  nvarchar(50), 
@Position  nvarchar(50), 
@Office  nvarchar(50), 
@Age   int,                                        
@StartDate datetime,                                         
@Salary int                                        
)
as
begin
  INSERT INTO Employee (Name,Position,Office,Age,StartDate,Salary) 
  VALUES (@Name,@Position,@Office,@Age,@StartDate,@Salary); 
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 29-05-2020 15:55:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateEmployee]
(
@Id int, 
@Name  nvarchar(50), 
@Position  nvarchar(50), 
@Office  nvarchar(50), 
@Age   int,                                        
@StartDate datetime,                                         
@Salary int                                        
)
as
begin
	UPDATE Employee
	SET 
	NAME = @Name,
	Position=@Position,
	Office=@Office,
	Age=@Age,
	StartDate=GETDATE(),
	Salary=@Salary
	Where Id=@Id
end
GO
