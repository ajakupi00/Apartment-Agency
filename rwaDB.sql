USE [RwaApartmani]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[OwnerId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[CityId] [int] NULL,
	[Address] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NOT NULL,
	[NameEng] [nvarchar](250) NOT NULL,
	[Price] [money] NOT NULL,
	[MaxAdults] [int] NULL,
	[MaxChildren] [int] NULL,
	[TotalRooms] [int] NULL,
	[BeachDistance] [int] NULL,
 CONSTRAINT [PK_Apartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentOwner]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentOwner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ApartmentOwner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentPicture]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentPicture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ApartmentId] [int] NULL,
	[Path] [nvarchar](250) NULL,
	[Base64Content] [varchar](max) NULL,
	[Name] [nvarchar](250) NOT NULL,
	[IsRepresentative] [bit] NULL,
	[DataBytes] [varbinary](max) NULL,
 CONSTRAINT [PK_ApartmentPicture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentReservation]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentReservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ApartmentId] [int] NOT NULL,
	[Details] [nvarchar](1000) NULL,
	[UserId] [int] NULL,
	[UserName] [nvarchar](250) NULL,
	[UserEmail] [nvarchar](250) NULL,
	[UserPhone] [nchar](20) NULL,
	[UserAddress] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ApartmentReservation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentReview]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ApartmentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Details] [nvarchar](1000) NULL,
	[Stars] [int] NULL,
 CONSTRAINT [PK_ApartmentReview] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentStatus]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[NameEng] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ApartmentStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Address] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[NameEng] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaggedApartment]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaggedApartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[ApartmentId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TaggedApartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagType]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[NameEng] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TagType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apartment] ADD  CONSTRAINT [DF_Apartment_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Apartment] ADD  CONSTRAINT [DF_Apartment_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ApartmentOwner] ADD  CONSTRAINT [DF_ApartmentOwner_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[ApartmentOwner] ADD  CONSTRAINT [DF_ApartmentOwner_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ApartmentPicture] ADD  CONSTRAINT [DF_ApartmentPicture_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[ApartmentPicture] ADD  CONSTRAINT [DF_ApartmentPicture_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ApartmentReservation] ADD  CONSTRAINT [DF_ApartmentReservation_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[ApartmentReservation] ADD  CONSTRAINT [DF_ApartmentReservation_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ApartmentReview] ADD  CONSTRAINT [DF_ApartmentReview_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[ApartmentReview] ADD  CONSTRAINT [DF_ApartmentReview_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ApartmentStatus] ADD  CONSTRAINT [DF_ApartmentStatus_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_User_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_User_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_Address]  DEFAULT ((1)) FOR [Address]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Tag] ADD  CONSTRAINT [DF_Tag_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Tag] ADD  CONSTRAINT [DF_Tag_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Tag] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TaggedApartment] ADD  CONSTRAINT [DF_TaggedApartment_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[TaggedApartment] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TagType] ADD  CONSTRAINT [DF_TagType_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_ApartmentOwner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[ApartmentOwner] ([Id])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_ApartmentOwner]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_ApartmentStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApartmentStatus] ([Id])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_ApartmentStatus]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_City]
GO
ALTER TABLE [dbo].[ApartmentPicture]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentPicture_Apartment] FOREIGN KEY([ApartmentId])
REFERENCES [dbo].[Apartment] ([Id])
GO
ALTER TABLE [dbo].[ApartmentPicture] CHECK CONSTRAINT [FK_ApartmentPicture_Apartment]
GO
ALTER TABLE [dbo].[ApartmentReservation]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentReservation_Apartment] FOREIGN KEY([ApartmentId])
REFERENCES [dbo].[Apartment] ([Id])
GO
ALTER TABLE [dbo].[ApartmentReservation] CHECK CONSTRAINT [FK_ApartmentReservation_Apartment]
GO
ALTER TABLE [dbo].[ApartmentReservation]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentReservation_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ApartmentReservation] CHECK CONSTRAINT [FK_ApartmentReservation_User]
GO
ALTER TABLE [dbo].[ApartmentReview]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentReview_Apartment] FOREIGN KEY([ApartmentId])
REFERENCES [dbo].[Apartment] ([Id])
GO
ALTER TABLE [dbo].[ApartmentReview] CHECK CONSTRAINT [FK_ApartmentReview_Apartment]
GO
ALTER TABLE [dbo].[ApartmentReview]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentReview_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ApartmentReview] CHECK CONSTRAINT [FK_ApartmentReview_User]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_TagType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TagType] ([Id])
GO
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_TagType]
GO
ALTER TABLE [dbo].[TaggedApartment]  WITH CHECK ADD  CONSTRAINT [FK_TaggedApartment_Apartment] FOREIGN KEY([ApartmentId])
REFERENCES [dbo].[Apartment] ([Id])
GO
ALTER TABLE [dbo].[TaggedApartment] CHECK CONSTRAINT [FK_TaggedApartment_Apartment]
GO
ALTER TABLE [dbo].[TaggedApartment]  WITH CHECK ADD  CONSTRAINT [FK_TaggedApartment_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[TaggedApartment] CHECK CONSTRAINT [FK_TaggedApartment_Tag]
GO
/****** Object:  StoredProcedure [dbo].[ApartmentStars]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[ApartmentStars]
@id INT
AS
SELECT AVG(Stars) AS Stars FROM ApartmentReview
WHERE ApartmentId = @id
GO
/****** Object:  StoredProcedure [dbo].[AuthUser]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AuthUser]
	@username NVARCHAR(50),
	@password NVARCHAR(128)
AS
BEGIN
	SELECT * FROM AspNetUsers WHERE Username=@username AND PasswordHash=@password AND DeletedAt IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[CreateApartment]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateApartment]
@name NVARCHAR(1000), @nameEng NVARCHAR(1000),
@owner NVARCHAR(1000), @cityID INT,
@address NVARCHAR(1000), @beachDistance INT,
@price FLOAT, @rooms INT, 
@maxAdults INT, @maxChildren INT
AS
DECLARE @ownerID INT, @ID INT
EXEC GetOwner @owner, @ownerID OUTPUT
INSERT INTO Apartment
		([Guid], [CreatedAt], [OwnerId], 
		[TypeId], [CityId], [Address], 
		[Name], [NameEng], [Price], [MaxAdults], 
		[MaxChildren], [TotalRooms], [BeachDistance], [StatusId])
VALUES(
	NEWID(), GETDATE(), @ownerID,
	999, @cityID, @address,
	@name, @nameEng, @price, @maxAdults,
	@maxChildren, @rooms, @beachDistance, 3)
SET @ID = SCOPE_IDENTITY()
SELECT @ID AS Id
GO
/****** Object:  StoredProcedure [dbo].[CreateCityByName]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCityByName]
@name NVARCHAR(1000)
AS
INSERT INTO City([Guid], [Name])
VALUES(NEWID(), @name)
GO
/****** Object:  StoredProcedure [dbo].[CreateOwnerByName]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOwnerByName]
@name NVARCHAR(1000)
AS
INSERT INTO ApartmentOwner([Guid], [CreatedAt], [Name])
VALUES(NEWID(), GETDATE(), @name)
GO
/****** Object:  StoredProcedure [dbo].[CreatePictureForApartment]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreatePictureForApartment]
@aptID INT, @name NVARCHAR(1000),
@path NVARCHAR(1000), @isRepr BIT, @data VARCHAR(MAX)
AS
INSERT INTO ApartmentPicture([Guid], [ApartmentId], [CreatedAt], [Name], [Path], [IsRepresentative], [Base64Content])
VALUES(NEWID(), @aptID, GETDATE(), @name, @path, @isRepr, @data)
GO
/****** Object:  StoredProcedure [dbo].[CreateTag]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateTag]
@name NVARCHAR(1000), @nameEng NVARCHAR(1000),
@typeID INT
AS
INSERT INTO Tag([Guid], [CreatedAt], [IsDeleted], [Name], [NameEng], [TypeId])
VALUES(NEWID(), GETDATE(), 0, @name, @nameEng, @typeID)
GO
/****** Object:  StoredProcedure [dbo].[CreateTagForApartment]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateTagForApartment]
@aptID INT, @tagID INT
AS
INSERT INTO TaggedApartment([Guid], [ApartmentId], [TagId], [IsDeleted])
VALUES(NEWID(), @aptID, @tagID, 0)
GO
/****** Object:  StoredProcedure [dbo].[DeleteApartmentByID]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteApartmentByID]
@ID INT
AS
UPDATE Apartment
SET DeletedAt = GETDATE()
WHERE Id = @ID
SELECT @ID
GO
/****** Object:  StoredProcedure [dbo].[DeleteApartmentPicture]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[DeleteApartmentPicture]
@aptID INT, @pictureID INT
AS
DELETE FROM ApartmentPicture
WHERE ApartmentId = @aptID AND Id = @pictureID AND IsRepresentative = 0
GO
/****** Object:  StoredProcedure [dbo].[DeleteTagByID]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteTagByID]
@id INT
AS
UPDATE Tag
SET IsDeleted = 1
WHERE Id = @id
SELECT * FROM Tag WHERE IsDeleted = 1 AND Id = @id
GO
/****** Object:  StoredProcedure [dbo].[GetAllApartments]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllApartments]
AS
SELECT * FROM Apartment
WHERE DeletedAt IS NULL
GO
/****** Object:  StoredProcedure [dbo].[GetAllCities]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllCities]
AS
SELECT DISTINCT C.Id, C.Name
FROM City AS C
INNER JOIN Apartment AS A ON A.CityId = C.Id
WHERE A.DeletedAt IS NULL

GO
/****** Object:  StoredProcedure [dbo].[GetAllStatuses]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStatuses]
AS
SELECT DISTINCT s.*
FROM ApartmentStatus AS s
INNER JOIN Apartment AS A ON A.StatusId = s.Id

GO
/****** Object:  StoredProcedure [dbo].[GetAllTags]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTags]
AS
SELECT *, 
(
	SELECT COUNT(*)
	FROM TaggedApartment AS ta
	WHERE ta.TagId = t.Id
) AS ApartmentsHave
FROM Tag AS t
WHERE IsDeleted = 0
GO
/****** Object:  StoredProcedure [dbo].[GetAllTagTypes]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTagTypes]
AS
SELECT * FROM TagType
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsersProcedure]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAllUsersProcedure]
AS
SELECT * FROM AspNetUsers
GO
/****** Object:  StoredProcedure [dbo].[GetAparmtentOwnerByID]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAparmtentOwnerByID]
@id int
AS
SELECT * FROM ApartmentOwner WHERE Id = @id
GO
/****** Object:  StoredProcedure [dbo].[GetApartmentByID]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetApartmentByID]
@ID int
as
SELECT Id, CreatedAt, OwnerId, StatusId, CityId, Address, Name, NameEng, CONVERT(float, Price) AS Price, MaxAdults, MaxChildren, TotalRooms, BeachDistance
FROM Apartment WHERE Id = @ID
GO
/****** Object:  StoredProcedure [dbo].[GetApartmentStatusByID]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetApartmentStatusByID]
@id int
AS
SELECT * FROM ApartmentStatus WHERE Id = @id
GO
/****** Object:  StoredProcedure [dbo].[GetCityByID]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCityByID]
@id int
AS
SELECT * FROM City WHERE Id = @id
GO
/****** Object:  StoredProcedure [dbo].[GetCityByName]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCityByName]
@name NVARCHAR(1000)
AS
IF EXISTS (SELECT * FROM City WHERE LOWER(Name) = LOWER(@name))
	BEGIN
		SELECT * FROM City WHERE Name = @name
	END
ELSE
	BEGIN
		EXEC CreateCityByName @name
		SELECT * FROM City WHERE Name = @name
	END
GO
/****** Object:  StoredProcedure [dbo].[GetNumberOfPicturesByApartmentID]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNumberOfPicturesByApartmentID]
@id int
AS
SELECT COUNT(*)
FROM ApartmentPicture
WHERE ApartmentId = @id
GO
/****** Object:  StoredProcedure [dbo].[GetOwner]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOwner]
@name NVARCHAR(1000), @ID INT OUTPUT
AS
DECLARE @ownerID INT
IF EXISTS (SELECT * FROM ApartmentOwner WHERE LOWER(Name) = LOWER(@name))
	BEGIN
		SELECT @ID = Id FROM ApartmentOwner WHERE Name = @name
	END
ELSE
	BEGIN
		EXEC CreateOwnerByName @name
		SELECT @ID = Id FROM ApartmentOwner WHERE Name = @name
	END
GO
/****** Object:  StoredProcedure [dbo].[GetPicturesByApartmentID]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPicturesByApartmentID]
@id int
AS
SELECT * FROM ApartmentPicture
WHERE ApartmentId = @id
GO
/****** Object:  StoredProcedure [dbo].[GetStatusByName]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStatusByName]
@name nvarchar(200)
AS
SELECT *
FROM ApartmentStatus
WHERE Name = @name
GO
/****** Object:  StoredProcedure [dbo].[GetTagByTagName]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTagByTagName]
@NAME NVARCHAR(100)
AS
SELECT * FROM Tag AS t
WHERE t.Name = @NAME
GO
/****** Object:  StoredProcedure [dbo].[GetTagsByApartmentID]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetTagsByApartmentID]
@ID INT
AS
SELECT t.Id,t.Name, t.NameEng, tt.Id AS TypeID
FROM TaggedApartment AS ta
INNER JOIN Tag AS t ON ta.TagId = t.Id
INNER JOIN Apartment AS a ON ta.ApartmentId = a.Id
INNER JOIN TagType AS tt ON t.TypeId = tt.Id
WHERE a.Id = @ID AND ta.IsDeleted = 0
GO
/****** Object:  StoredProcedure [dbo].[GetTypeById]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTypeById]
@ID INT
AS
SELECT * FROM TagType WHERE Id = @ID
GO
/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserByID]
@id INT
AS
SELECT * FROM AspNetUsers
WHERE Id = @id
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RegisterUser]
@email NVARCHAR(500), @username NVARCHAR(500),
@pnumber NVARCHAR(500), @address NVARCHAR(500),
@password NVARCHAR(MAX)
AS
INSERT INTO AspNetUsers
	([Email], [EmailConfirmed], [UserName], [PhoneNumber], [CreatedAt], [Address], [PasswordHash], 
	[AccessFailedCount], [Guid], [LockoutEnabled], [PhoneNumberConfirmed])

VALUES(@email, 1, @username, @pnumber,GETDATE(), @address, @password, 0, NEWID(), 0, 1)
GO
/****** Object:  StoredProcedure [dbo].[ReserveApartment]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[ReserveApartment]
@apartmentID INT, @fname NVARCHAR(50),
@lname NVARCHAR(50), @email NVARCHAR(100),
@phone NVARCHAR(15), @adults INT,
@children INT, @from DATETIME,
@to DATETIME
AS
DECLARE @userID INT, @address NVARCHAR(100)
IF EXISTS (SELECT  * FROM AspNetUsers WHERE UserName = @fname + ' ' + @lname )
	BEGIN
		SELECT @userID = Id, @address = Address FROM AspNetUsers WHERE UserName = @fname + ' ' + @lname
		
		INSERT INTO ApartmentReservation
		(	[Guid], [CreatedAt], [ApartmentId], [UserId], [UserName], [UserEmail],
			[UserPhone], [Details], [UserAddress])
		VALUES (NEWID(), GETDATE(), @apartmentID, @userID, @fname + ' ' + @lname, @email, @phone, 
				CONCAT('Adults: ', @adults , ', children: ', @children ,'. ' , @from , '-' , @to), @address)
	END
ELSE
	BEGIN
		INSERT INTO ApartmentReservation
		(	[Guid], [CreatedAt], [ApartmentId], [UserName], [UserEmail],
			[UserPhone], [Details])
		VALUES (NEWID(), GETDATE(), @apartmentID, @fname + ' ' + @lname, @email, @phone, 
				CONCAT('Adults: ', @adults , ', children: ', @children ,'. ' , @from , '-' , @to))
	END
GO
/****** Object:  StoredProcedure [dbo].[SendReview]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[SendReview]
@userid INT, @apartmentID INT,
@stars INT, @details NVARCHAR(1000)
AS
INSERT INTO ApartmentReview ([Guid], [CreatedAt], [ApartmentId], [UserId], [Details], [Stars])
VALUES (NEWID(), GETDATE(), @apartmentID, @userid, @details, @stars)
GO
/****** Object:  StoredProcedure [dbo].[UpdateApartment]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[UpdateApartment]
@aptID INT, @aptName NVARCHAR(1000), @price FLOAT, @rooms INT,
@maxAdults INT, @maxChildren INT, @rPictureID INT,
@statusName NVARCHAR(1000)
AS
UPDATE Apartment
SET Name = @aptName, Price = @price, 
	TotalRooms = @rooms, MaxAdults = @maxAdults, 
	MaxChildren = @maxChildren, StatusId = 3
WHERE Id = @aptID


UPDATE ApartmentPicture
SET IsRepresentative = 0
WHERE ApartmentId = @aptID

UPDATE ApartmentPicture
SET IsRepresentative = 1
WHERE ApartmentId = @aptID AND Id = @rPictureID
GO
/****** Object:  StoredProcedure [dbo].[UpdateApartmentTags]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateApartmentTags]
@aptID INT, @tagID INT, @flag CHAR
AS
IF (@flag = 'U')
	BEGIN
		IF NOT EXISTS(SELECT * FROM TaggedApartment WHERE ApartmentId = @aptID AND TagId = @tagID)
			BEGIN
				IF EXISTS (SELECT * FROM Apartment WHERE Id = @aptID) AND EXISTS (SELECT * FROM Tag WHERE Id = @tagID)
					BEGIN
						INSERT INTO TaggedApartment([Guid], [ApartmentId], [TagId], [IsDeleted])
						VALUES (NEWID(), @aptID, @tagID, 0)
					END
			END
	END
ELSE IF (@flag = 'D')
	BEGIN
		IF EXISTS (SELECT * FROM TaggedApartment WHERE ApartmentId = @aptID AND TagId = @tagID )
			BEGIN
				UPDATE TaggedApartment
				SET IsDeleted = 1
				WHERE ApartmentId = @aptID AND TagId = @tagID
			END
	END
GO
/****** Object:  StoredProcedure [dbo].[UpdateApartmentWithUser]    Script Date: 13.7.2022. 16:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateApartmentWithUser]
@aptID INT, @aptName NVARCHAR(1000), @price FLOAT, @rooms INT,
@maxAdults INT, @maxChildren INT, @userID INT, @rPictureID INT,
@statusName NVARCHAR(1000)
AS

DECLARE @statusID INT
IF EXISTS (SELECT * FROM ApartmentStatus WHERE Name = @statusName)
	BEGIN
		SELECT @statusID = Id FROM ApartmentStatus WHERE Name = @statusName
	END
ELSE
	BEGIN
	SELECT @statusID = 1
	END

UPDATE Apartment
SET Name = @aptName, Price = @price, 
	TotalRooms = @rooms, MaxAdults = @maxAdults, 
	MaxChildren = @maxChildren, StatusId = @statusID
WHERE Id = @aptID

UPDATE ApartmentPicture
SET IsRepresentative = 1
WHERE Id = @rPictureID

INSERT INTO ApartmentReservation([ApartmentId], [CreatedAt], [Guid], [UserId], [Details])
VALUES (@aptID, GETDATE(), NEWID(), @userID, @statusName)
GO
