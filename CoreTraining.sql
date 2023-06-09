USE [CoreTraining]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/4/2023 3:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 4/4/2023 3:08:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedUserId] [nvarchar](100) NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedUserId] [nvarchar](100) NULL,
	[DeletedDate] [datetime] NULL,
	[DeletedUserId] [nvarchar](100) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/4/2023 3:08:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 4/4/2023 3:08:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/4/2023 3:08:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[DOB] [datetime] NULL,
	[Role] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Profile] [varbinary](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedUserId] [nvarchar](100) NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedUserId] [nvarchar](100) NULL,
	[DeletedDate] [datetime] NULL,
	[DeletedUserId] [nvarchar](100) NULL,
	[ProfileName] [nvarchar](50) NULL,
	[TokenDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 4/4/2023 3:08:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 4/4/2023 3:08:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 4/4/2023 3:08:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 4/4/2023 3:08:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'04e5442b-d622-490f-a182-444f2f0361c1', N'fddfssfd', N'dsfffdfd', 0, 1, CAST(N'2023-03-31T10:23:57.810' AS DateTime), N'febde762-fca5-430a-ac1c-0c2528342477', NULL, N'', CAST(N'2023-03-31T11:05:57.820' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'05db3d47-e1b2-4f27-a05d-f8ef42a799c2', N'Testing11', N'Testing', 0, 1, CAST(N'2023-03-31T11:09:04.340' AS DateTime), N'8dbba413-e724-4382-a153-b593256b92da', NULL, N'', CAST(N'2023-04-04T13:07:51.137' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'0e6e1c03-9346-461f-a348-ac2383efb2a9', N'ddd', N'ddd', 0, 1, CAST(N'2023-03-29T14:23:03.187' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', CAST(N'2023-03-29T14:33:10.683' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'1883dee2-b262-49f7-849b-eac03994fdac', N'Music', N'News', 1, 0, CAST(N'2023-04-04T14:48:13.467' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'18cc0efc-80cf-4bd1-a8d4-6157d99594ec', N'fddfdf', N'fdfdfdffd', 1, 1, CAST(N'2023-03-30T08:55:37.477' AS DateTime), N'3ff910a1-3dca-43d8-a289-c7b8f80dbbdf', NULL, N'', CAST(N'2023-03-30T08:55:55.483' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'20c4aff5-10b8-46f4-aa92-a7ece0bc6518', N'Business News', N'News', 0, 0, CAST(N'2023-04-04T14:49:35.547' AS DateTime), N'1a9b92c5-06ba-436b-83de-87105e6b1a27', NULL, N'', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'23b5ace0-0519-4ab1-b7e6-d079acff2fa1', N'Business New', N'New', 1, 1, CAST(N'2023-03-29T11:11:31.247' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-29T14:33:52.297' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', CAST(N'2023-04-04T13:07:46.033' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'2568bd5c-aa00-4149-973e-4f4cbaf6b61e', N'rrrrr', N'rereerer', 0, 1, CAST(N'2023-03-30T16:42:51.047' AS DateTime), N'3ff910a1-3dca-43d8-a289-c7b8f80dbbdf', NULL, N'', CAST(N'2023-03-31T11:06:16.693' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'2743a868-6080-474b-82f6-ef7c9793378d', N'Apple', N'Apple', 0, 1, CAST(N'2023-03-31T11:11:30.277' AS DateTime), N'b3a0a3d8-225a-422a-b680-b47088168bbf', NULL, N'', CAST(N'2023-03-31T11:12:02.427' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'28d3f735-5cda-4736-a556-3ea29e8cd5e5', N'fddsffddddddddds', N'fdfdsdf', 0, 1, CAST(N'2023-03-30T09:29:01.633' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-30T09:29:11.273' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-30T09:29:24.257' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'2b34e278-fd8c-42e1-83f4-d394295e61ee', N'Musicsssssssssss Pop', N'Shareing', 1, 1, CAST(N'2023-03-29T11:11:58.060' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-29T11:13:51.570' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-29T14:33:14.660' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'305cf411-64cd-41d8-acac-ede657bfb4b4', N'New', N'New', 1, 1, CAST(N'2023-03-30T08:49:04.290' AS DateTime), N'2b6216ee-a267-4751-85c6-398028866034', CAST(N'2023-03-30T08:49:57.653' AS DateTime), N'2b6216ee-a267-4751-85c6-398028866034', CAST(N'2023-04-04T13:07:48.463' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'340805a6-5bfb-4ea5-b33a-3d46efc9a864', N'dfssss', N'sssfdsaaaaaa', 0, 1, CAST(N'2023-03-31T09:22:20.600' AS DateTime), N'a6004819-f20e-46f0-829c-75706dc6caf4', NULL, N'', CAST(N'2023-03-31T11:06:07.933' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'3f9375ae-cac0-44cb-ac63-1dc9412fc1ca', N'dfsssss', N'fdsa', 0, 1, CAST(N'2023-03-31T08:39:21.913' AS DateTime), N'f6c313fe-6603-4008-aa30-32cf71eeeaeb', NULL, N'', CAST(N'2023-03-31T11:06:13.630' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'41572783-726a-44a3-8c94-3b3e80cf2a7d', N'Testing 12345', N'123', 0, 1, CAST(N'2023-03-29T14:25:55.067' AS DateTime), N'eddb1dd7-4d9c-428a-9e11-d2e278a9d3a3', CAST(N'2023-03-29T14:26:07.753' AS DateTime), N'eddb1dd7-4d9c-428a-9e11-d2e278a9d3a3', CAST(N'2023-03-29T14:31:10.603' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'45a84a9f-0880-42bd-ac50-3ed0f8e89d36', N'fd', N'dfs', 0, 1, CAST(N'2023-03-30T09:19:38.953' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', CAST(N'2023-03-30T09:20:21.097' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'646c822b-2de5-4ba9-8e74-77afb7436acc', N'Pop Music', N'News', 0, 0, CAST(N'2023-04-04T14:49:03.977' AS DateTime), N'1a9b92c5-06ba-436b-83de-87105e6b1a27', NULL, N'', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'692d11db-253a-4fa5-a4a2-929d444d3fe0', N'dfdsdfdfd4555', N'dfsdfsdfdf', 0, 1, CAST(N'2023-03-29T14:25:04.503' AS DateTime), N'eddb1dd7-4d9c-428a-9e11-d2e278a9d3a3', NULL, N'', CAST(N'2023-03-29T14:31:27.957' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'6a65805a-600d-4815-8bd4-8e597917dcd0', N'Health News', N'News', 1, 1, CAST(N'2023-03-29T11:09:19.610' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', CAST(N'2023-04-04T13:07:43.677' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'6bcb1207-2e69-441e-909c-aa52b241ff55', N'fdddddaaa111', N'dfsssss', 1, 1, CAST(N'2023-03-29T14:23:42.457' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-29T14:24:15.300' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-29T14:33:06.843' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'74b022ea-f3b7-429a-99cd-af523b037356', N'fddsf', N'fdfdsdf', 0, 1, CAST(N'2023-03-30T09:29:01.620' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', CAST(N'2023-03-30T09:29:29.110' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'793dcb5c-6f15-40cb-9a52-236901b0c7ed', N'Education News', N'New', 0, 1, CAST(N'2023-03-29T11:08:19.750' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', CAST(N'2023-03-30T16:45:45.707' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', CAST(N'2023-04-04T13:07:38.140' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'86ee1611-e07a-44e1-ae4e-f5e6c9cf035d', N'Newss', N'Newsss', 1, 1, CAST(N'2023-03-30T08:50:58.113' AS DateTime), N'2b6216ee-a267-4751-85c6-398028866034', CAST(N'2023-03-30T08:54:09.840' AS DateTime), N'2b6216ee-a267-4751-85c6-398028866034', CAST(N'2023-03-30T08:54:16.520' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'91fa80f7-c881-4185-bff8-b3fdb70d2055', N'fd', N'dfs', 0, 1, CAST(N'2023-03-30T09:20:38.833' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-30T09:20:47.430' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-30T09:20:50.630' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'95d18040-1863-4a6e-b8ee-d4909f544e71', N'New Celebrity', N'Newsss', 0, 0, CAST(N'2023-04-04T14:47:58.827' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'ad126c1f-5170-4277-a201-59642b81152b', N'fdsaaaa', N'sadgfggghhgh', 0, 1, CAST(N'2023-03-31T10:20:00.630' AS DateTime), N'8620849c-1d93-40d9-8611-53f04d47ecba', NULL, N'', CAST(N'2023-03-31T11:06:03.673' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'b8d09c6a-a371-4bfa-b52b-cf554d765a19', N'Testing11', N'Testing', 0, 1, CAST(N'2023-03-31T11:08:17.867' AS DateTime), N'8dbba413-e724-4382-a153-b593256b92da', CAST(N'2023-03-31T11:08:48.617' AS DateTime), N'8dbba413-e724-4382-a153-b593256b92da', CAST(N'2023-03-31T11:08:54.280' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'c20a2be0-7566-48d3-9536-030831515c10', N'Business New 11', N'New 111', 1, 1, CAST(N'2023-03-29T14:50:50.490' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', NULL, N'', CAST(N'2023-03-29T14:51:28.563' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'ca93b29d-00be-4384-bf78-aedcf2405b27', N'Health', N'News', 0, 0, CAST(N'2023-04-04T14:53:01.617' AS DateTime), N'82288340-68d4-4480-9f37-18ccd8bcf536', NULL, N'', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'ccaa0be4-cd05-452a-b00b-e76d1b3b75f6', N'Apple', N'Apple', 0, 0, CAST(N'2023-03-31T11:11:11.737' AS DateTime), N'b3a0a3d8-225a-422a-b680-b47088168bbf', NULL, N'', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'd37fe85c-a7b1-4e9b-bd4a-af5f62873cc0', N'nhbgvcx', N'bgfvdcx', 0, 1, CAST(N'2023-03-31T08:39:58.907' AS DateTime), N'f6c313fe-6603-4008-aa30-32cf71eeeaeb', NULL, N'', CAST(N'2023-03-31T11:06:10.653' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'e89d69f5-e11b-41ea-a9a9-bb8ac1ebb1fc', N'Celebrity New', N'Newsss', 1, 1, CAST(N'2023-03-29T11:07:55.040' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', NULL, N'', CAST(N'2023-03-31T11:05:50.233' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'e8b61d23-4940-40b6-9f1f-4902c81831ac', N'Sport News', N'News', 1, 1, CAST(N'2023-03-29T11:08:52.150' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', CAST(N'2023-04-04T13:07:41.270' AS DateTime), NULL)
GO
INSERT [dbo].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'ADMIN', N'ADMIN', N'14e04685-6c09-48a0-a338-d3b14d2955c0')
INSERT [dbo].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'USER', N'USER', N'cb4136cd-c1cd-4458-a6a5-3fff65bfd2f4')
GO
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', N'mama@gmail.com', N'MAMA@GMAIL.COM', N'mama@gmail.com', N'Ma', N'Ma', N'MAMA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOBjd7tMVzX7tqAoJhE/1BbctuQu273Ly9N5LTypT8jlH/dmystVRVJkBmfLSuYwDw==', N'PDHXZ4L2RYE3KMHX577U4LGPVSFMSKVQ', N'ff542a39-51b2-4aea-b303-c4960286325f', N'', 0, 0, NULL, 1, 0, N'', NULL, 2, 1, 1, NULL, CAST(N'2023-03-29T08:44:17.667' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', CAST(N'2023-03-30T16:45:27.817' AS DateTime), N'', CAST(N'2023-04-04T14:39:45.997' AS DateTime), NULL, N'7bf08953-f12c-481d-bc05-deeec0bf6823.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'11de0730-106a-4685-abe1-6b3e0f5ce396', N'user04@gmail.com', N'USER04@GMAIL.COM', N'user04@gmail.com', N'User', N'04', N'USER04@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEA6PHiMEL+BCw17j8rd/44MJZj7tW1SISLAVc5X3bguoIuM22eQ26hsDNX7EBEQTmw==', N'OMFNVKEW6QQH6G63VPAMAP3ZJQR63TZY', N'c358ed6f-025a-4405-ab3d-bf69e6bfede2', N'0998877777', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-14T00:00:00.000' AS DateTime), 1, 1, 1, NULL, CAST(N'2023-03-29T09:02:15.897' AS DateTime), N'11de0730-106a-4685-abe1-6b3e0f5ce396', CAST(N'2023-03-29T09:41:44.763' AS DateTime), N'', CAST(N'2023-03-29T10:32:35.313' AS DateTime), NULL, N'44e86377-6154-4c5d-996a-385003e46e2d.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'130d9db7-c2cb-4d15-89c1-9156ff7fa511', N'success@gmail.com', N'SUCCESS@GMAIL.COM', N'success@gmail.com', N'Kay', N'07', N'SUCCESS@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEB1iXMIERlPzjcs87colEa4o/bYyFRnEl390yOOzNILbQv7UWNNUnBaQLGvBpJSMwQ==', N'564YCGPWKJ37LAWJ5HCS6BXFWP3ONYLN', N'bc84e398-7262-42c0-b6a1-9b0a2415a354', N'', 0, 0, NULL, 1, 0, N'', NULL, 1, 1, 1, NULL, CAST(N'2023-03-30T11:14:40.747' AS DateTime), N'130d9db7-c2cb-4d15-89c1-9156ff7fa511', CAST(N'2023-03-30T11:14:58.070' AS DateTime), N'', CAST(N'2023-03-31T11:07:15.620' AS DateTime), NULL, N'2a1d1897-f40d-4970-ba68-a655429ad359.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'1a3ee984-e524-4b52-8cc6-123f80529826', N'user00@gmail.com', N'USER00@GMAIL.COM', N'user00@gmail.com', N'user', N'00', N'USER00@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEI1VuKD3iCMruRUrRLQYybvB8eZ9dMwHRfCo7CEzGsYLKx+jIS5TVDhry69kAd4RbA==', N'HTLHL6PCWJ3XSDNSK3O2Y2A3V6PMRK34', N'fdd92668-8065-4798-b150-f9a512d7974b', N'09987655545', 0, 0, NULL, 1, 0, N'Mandalay', CAST(N'2023-03-23T00:00:00.000' AS DateTime), 1, 1, 1, NULL, CAST(N'2023-03-30T16:03:41.637' AS DateTime), N'1a3ee984-e524-4b52-8cc6-123f80529826', NULL, NULL, CAST(N'2023-03-31T11:06:55.810' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'1a9b92c5-06ba-436b-83de-87105e6b1a27', N'user@gmail.com', N'USER@GMAIL.COM', N'user@gmail.com', N'User', N'01', N'USER@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEP/UMD8tupK+7zueeXS1uBs+td2q8gPmpIVR5xCA8Ptk6IHd7bx1GLLlekO0KF5cQ==', N'IAXMUPNAK5P7MUJXQMAO7UXKHFC76FSD', N'437d3ee5-f058-4424-9022-aa085266119e', N'09987655545', 0, 0, NULL, 1, 0, N'Mandlay', CAST(N'2023-04-18T00:00:00.000' AS DateTime), 2, 1, 0, NULL, CAST(N'2023-04-04T14:42:08.500' AS DateTime), N'1a9b92c5-06ba-436b-83de-87105e6b1a27', CAST(N'2023-04-04T14:48:50.733' AS DateTime), N'', NULL, NULL, N'9ae87d5d-84f9-477c-90a2-91761ad9f801.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'2b6216ee-a267-4751-85c6-398028866034', N'user02@gmail.com', N'USER02@GMAIL.COM', N'user02@gmail.com', N'User', N'02', N'USER02@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPeY06k4GtbIzhc0w98oMynK2rN7skYnh9uRAK14DHyINMMXB4zwvHIhDvIVpz36KA==', N'RRUUF3R6P3LLNP52BZVWPNWDPRSV622Z', N'4cc28274-d922-4fe6-9ea0-302f3528961c', N'09987655545', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-29T00:00:00.000' AS DateTime), 1, 1, 1, NULL, CAST(N'2023-03-29T08:38:07.970' AS DateTime), N'2b6216ee-a267-4751-85c6-398028866034', CAST(N'2023-03-30T08:51:19.750' AS DateTime), N'', CAST(N'2023-04-04T14:39:54.927' AS DateTime), NULL, N'2cf97f35-cffe-422e-86a4-715fe0e1c941.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'36d7cf7c-0178-419c-9951-e37a5242a4df', N'test2@gmail.com', N'TEST2@GMAIL.COM', N'test2@gmail.com', N'test', N'2', N'TEST2@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPyb4DR8fJbd1qKBB3QCeK/N51UoVS21QfPrBvyVRaPrxXupXa8kjqFnqe3Yq+sIpg==', N'NYJTCNGNLQ7F4WXPRPAXNM4MY6WF7TEQ', N'6f6821bc-870b-4949-9442-398f7e628618', N'', 0, 0, NULL, 1, 0, N'', NULL, 1, 1, 1, NULL, CAST(N'2023-03-30T16:19:11.853' AS DateTime), N'36d7cf7c-0178-419c-9951-e37a5242a4df', NULL, NULL, CAST(N'2023-03-31T11:06:47.760' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'3ba0a2ec-dde9-4f28-8841-7e08b650da5e', N'admin01@gmail.com', N'ADMIN01@GMAIL.COM', N'admin01@gmail.com', N'admin', N'01', N'ADMIN01@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBY0hYSoLp0iN2yvgbZmY63M6VK7JShpdf6Fv1odGZOnpTg3Yz/3M80Gs+Twky3oWg==', N'LSXS5CERBFAOS5AYHXMCO5Q3CKBFL6J5', N'866dcf8f-02d1-4b51-ae64-e81323b33d7b', N'', 0, 0, NULL, 1, 0, N'', NULL, 1, 1, 1, NULL, CAST(N'2023-03-30T14:26:09.673' AS DateTime), N'3ba0a2ec-dde9-4f28-8841-7e08b650da5e', NULL, NULL, CAST(N'2023-03-31T11:07:09.393' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'3ff910a1-3dca-43d8-a289-c7b8f80dbbdf', N'user05@gmail.com', N'USER05@GMAIL.COM', N'user05@gmail.com', N'User', N'05', N'USER05@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHK3kKOTsmvBs/SOjQf102d4yC2IjzN61G8PdyIwVWAp7PpFJl51mD03RYTakZGTRA==', N'SPGA32NVKMXIROFFXNML46WEAVSBG2YY', N'd098f313-8f03-480a-94d0-455b70dae09c', N'09993388383', 0, 0, NULL, 1, 0, N'Mandalay', CAST(N'2023-03-07T00:00:00.000' AS DateTime), 2, 1, 1, NULL, CAST(N'2023-03-29T10:51:03.353' AS DateTime), N'3ff910a1-3dca-43d8-a289-c7b8f80dbbdf', CAST(N'2023-03-30T09:18:01.890' AS DateTime), N'', CAST(N'2023-04-04T14:39:43.413' AS DateTime), NULL, N'a7292ab8-4e05-46be-9746-37070cac4b06.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'53a5395d-5ea4-4009-ae1c-e052f0461279', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'Admin', N'', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECV7cvI9+euckN3O9wfrXhlu9MmT+ty4DlZtGhewtyEy6INOxiF54bQX8XrvQvBvzQ==', N'ROVFH4OEAEWTP2CUUHBCPT4JX2PS4WGI', N'ed30f29f-7789-4363-a1d9-757c49fc45c7', N'09987655545', 0, 0, NULL, 1, 0, N'Mandalay', CAST(N'2023-03-29T00:00:00.000' AS DateTime), 1, 1, 0, NULL, CAST(N'2023-03-29T08:20:41.833' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-04-04T14:45:25.843' AS DateTime), N'', NULL, NULL, N'bfbbb1c5-b437-4f2f-a8f5-2767bd069d44.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'57fd7b02-c9c3-48b4-b1b1-6d9cab8580ef', N'User06@gmail.com', N'USER06@GMAIL.COM', N'User06@gmail.com', N'User', N'06', N'USER06@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIWqTqpHy/+rryGZAjLFKiIczPqqoZOX1kzhXwn1NH2BnCV7+n7M14ZwoqTURuUnYw==', N'N2CYVJKAEKAUUIZPMTJ2HVEQJO5J3ZY4', N'00825d99-e9e4-48b4-b2ee-28026ff97d1a', N'09987655545', 0, 0, NULL, 1, 0, N'Mandalay', CAST(N'2023-03-30T00:00:00.000' AS DateTime), 2, 1, 1, NULL, CAST(N'2023-03-30T08:53:16.527' AS DateTime), N'57fd7b02-c9c3-48b4-b1b1-6d9cab8580ef', NULL, NULL, CAST(N'2023-03-30T08:53:32.360' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'6611ddf5-36c5-4f6a-a56e-ccaabe433950', N'test@gmail.com', N'TEST@GMAIL.COM', N'test@gmail.com', N'test', N'1', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEN69uLKtWhcMenAyIfylSmYh00wRt4PKaQy3fgPEbhxUJhpkzkThS2bBUE4qvkSc/Q==', N'D2U6ILHH7VWFAE5AN4UPG3DS4KGNAVJM', N'79e0d8a5-823b-4104-96d2-6150967de419', N'', 0, 0, NULL, 1, 0, N'', NULL, 1, 1, 1, NULL, CAST(N'2023-03-30T16:16:25.780' AS DateTime), N'6611ddf5-36c5-4f6a-a56e-ccaabe433950', NULL, NULL, CAST(N'2023-03-31T11:06:50.560' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'6bcf7ab3-0710-4061-864e-6b1fd26094c3', N'kay@gmail.com', N'KAY@GMAIL.COM', N'kay@gmail.com', N'fddffd', N'fdsfdsfdsf', N'KAY@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENwf91HSGDsatBiEoJ7JPI3tlbKBWHcG5ax+9h3nQzSuHldSvkOoneMiGVALWyxReQ==', N'CRBK3CMC7ZXKGGPNRIWR4XBGEF37GGBA', N'02c8e8ce-70a9-4233-8f76-7d534856c6fc', N'0998877777', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-29T00:00:00.000' AS DateTime), 1, 1, 1, NULL, CAST(N'2023-03-29T09:47:23.307' AS DateTime), N'6bcf7ab3-0710-4061-864e-6b1fd26094c3', NULL, NULL, CAST(N'2023-03-29T09:48:45.340' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'82288340-68d4-4480-9f37-18ccd8bcf536', N'koko@gmail.com', N'KOKO@GMAIL.COM', N'koko@gmail.com', N'ko', N'ko', N'KOKO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHB/HzLmdHtHpB5uT0tRf3T4k4jqUO6Ex/BgDqzoxa/Jsys06bBByKUf/+seRJjGSw==', N'AKAZLOFQUJ3NCP5HHK3RCFNPARE5IZ32', N'b406d2c7-c875-4a7b-b8cc-28e519960d6c', N'09987655545', 0, 0, NULL, 1, 0, N'Yangon', NULL, 1, 1, 0, NULL, CAST(N'2023-04-04T14:43:12.443' AS DateTime), N'82288340-68d4-4480-9f37-18ccd8bcf536', CAST(N'2023-04-04T14:51:31.210' AS DateTime), N'', NULL, NULL, N'9544fe69-22cd-4f47-bab1-7e25fb1ba1bc.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'8620849c-1d93-40d9-8611-53f04d47ecba', N'thar@gmail.com', N'THAR@GMAIL.COM', N'thar@gmail.com', N'Thar', N'Thar', N'THAR@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEF0dggiWrUKGqf8v/J9tMZIiDpH45ak6x7/T4JoryYL30VKp4w8QFAAiBUkZ+QweYQ==', N'2MGFWIQQPV54TX2FHKVFFBDOUTLLIV2B', N'30edae25-b969-47bf-bdd6-e6d9a0960a33', N'', 0, 0, NULL, 1, 0, N'', NULL, 1, 1, 1, NULL, CAST(N'2023-03-31T10:18:21.110' AS DateTime), N'8620849c-1d93-40d9-8611-53f04d47ecba', NULL, NULL, CAST(N'2023-03-31T11:06:38.893' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'866538ef-75f4-4bbf-93a4-85ce5c22a3e4', N'admin03@gmail.com', N'ADMIN03@GMAIL.COM', N'admin03@gmail.com', N'admin', N'03', N'ADMIN03@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENMuh48KpjM8+XhXHRrCg2hMl0HLs+PLqJUXvpmr/ZbspVbf/IpV+3xEK7fncXFZUQ==', N'BM4YWKDGSLHXUDAWSYXIZQM4SZM6645P', N'ce4dafc6-91b2-4998-9a60-dd207db374af', N'', 0, 0, NULL, 1, 0, N'', NULL, 1, 1, 1, NULL, CAST(N'2023-03-30T15:56:59.987' AS DateTime), N'866538ef-75f4-4bbf-93a4-85ce5c22a3e4', NULL, NULL, CAST(N'2023-03-31T11:07:06.693' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'8dbba413-e724-4382-a153-b593256b92da', N'user03@gmail.com', N'USER03@GMAIL.COM', N'user03@gmail.com', N'User', N'03', N'USER03@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAED7cCvZwPmTmmWtdNQlJcgEvf3uQK0Z/aIgQRzW00owT8xQ67C9Ptm3K+fIJ+j5u0w==', N'OYNYUO7CYXDRMP6QUVLQAO2PPOOMHBSW', N'40eb87c9-ba9d-400c-b4e2-7ebc241351b1', N'0998828282', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-01T00:00:00.000' AS DateTime), 2, 1, 1, NULL, CAST(N'2023-03-29T08:41:50.530' AS DateTime), N'8dbba413-e724-4382-a153-b593256b92da', CAST(N'2023-03-31T11:07:36.383' AS DateTime), N'', CAST(N'2023-04-04T14:39:48.730' AS DateTime), NULL, N'f845e1b8-51dc-437b-a5b8-06311bc62ed3.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'a6004819-f20e-46f0-829c-75706dc6caf4', N'kay12@gmail.com', N'KAY12@GMAIL.COM', N'kay12@gmail.com', N'Kay', N'Khine', N'KAY12@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOcL6HkX0GtJJ3jPGQcZa1u3dy4+VViRe/CLlwTvgmxK2SCbx+62ZcL7U3mLcVqs+A==', N'JSUOE5V2NUHD4UGFDFOBUUWXXOHU3OLX', N'cc50a29f-4c5d-4ff7-b11b-adbb16cd7c3e', N'', 0, 0, NULL, 1, 0, N'', NULL, 2, 1, 1, NULL, CAST(N'2023-03-31T09:21:52.587' AS DateTime), N'a6004819-f20e-46f0-829c-75706dc6caf4', CAST(N'2023-03-31T10:22:48.860' AS DateTime), N'', CAST(N'2023-03-31T11:06:41.913' AS DateTime), NULL, N'1e0717bd-47b1-4b11-95f5-e12565d3ad57.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'b31fdeba-6700-4550-bf9d-61b88cb41d48', N'User01@gmail.com', N'USER01@GMAIL.COM', N'User01@gmail.com', N'User', N'01', N'USER01@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFBMeqPRWzlnoBDpEcAy1dvH6uISzPEpF4C2CickGOzDdL2CLeIGVQl0eE9WJtu3Xw==', N'4FHXQ5NJ53NEAI5ZSSOVN5K5TRYP3RR6', N'4b36a6f4-adaf-42b8-9916-fb5db4115402', N'09987655545', 0, 0, NULL, 1, 0, N'Mandalay', CAST(N'2023-03-29T00:00:00.000' AS DateTime), 1, 1, 1, NULL, CAST(N'2023-03-29T08:35:50.090' AS DateTime), N'b31fdeba-6700-4550-bf9d-61b88cb41d48', CAST(N'2023-03-30T08:46:21.473' AS DateTime), N'', CAST(N'2023-04-04T14:40:25.780' AS DateTime), NULL, N'ceae7205-257d-4e4f-9a7c-8948e04b7a34.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'b3a0a3d8-225a-422a-b680-b47088168bbf', N'User07@gmail.com', N'USER07@GMAIL.COM', N'User07@gmail.com', N'User', N'07', N'USER07@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEENm3LC2CRjujD1pWvILszV5hXyGyM/lmMOTd4irA/sbIe1qkqbBfrfBkSNr6BmRBg==', N'TL5IQYZNTIOEK2LULTPLMWIRGUPETOSH', N'a06fa3e8-ed67-4087-a07d-6fcd8ed71188', N'', 0, 0, NULL, 1, 0, N'', NULL, 2, 1, 1, NULL, CAST(N'2023-03-31T11:10:20.803' AS DateTime), N'b3a0a3d8-225a-422a-b680-b47088168bbf', CAST(N'2023-03-31T11:10:55.417' AS DateTime), N'', CAST(N'2023-04-04T14:39:40.653' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'bb31fab6-bfd6-4138-86f5-62b7e958e5af', N'smile1@gmail.com', N'SMILE1@GMAIL.COM', N'smile1@gmail.com', N'smile', N'01', N'SMILE1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEI1tZ0HmmHyoiW5/iLu5qtVIRY8j3UI5ldSPfNkdx1kzE9NLKjHRjmyE6RjFE7twvQ==', N'WSQFDLGXYXRYLVWHYHPQTJS7DRZN3AGQ', N'f512802b-ed9c-4e07-a71f-0dd13528181d', NULL, 0, 0, NULL, 1, 0, N'', NULL, 1, 1, 1, NULL, CAST(N'2023-03-30T16:06:13.493' AS DateTime), N'bb31fab6-bfd6-4138-86f5-62b7e958e5af', NULL, NULL, CAST(N'2023-03-31T11:06:53.093' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'd74fa270-8036-4007-8efc-5d2d5972e2a4', N'user11@gmail.com', N'USER11@GMAIL.COM', N'user11@gmail.com', N'User', N'07', N'USER11@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENYRgKHZ84N1EGxB/fchG+SfVA7MegR2+Y0L2T+qErQA0LwtC4e2VPNB5uQp3m6a+A==', N'F4Z3ZY4UIQEQY6SK62SSAINCPDZITE7L', N'2f2cd861-2f11-4cca-b5d7-de2f6129f80f', N'09987655545', 0, 0, NULL, 1, 0, N'Mandalay', CAST(N'2023-03-30T00:00:00.000' AS DateTime), 1, 1, 1, NULL, CAST(N'2023-03-30T09:27:09.463' AS DateTime), N'd74fa270-8036-4007-8efc-5d2d5972e2a4', CAST(N'2023-03-30T09:27:33.633' AS DateTime), N'', CAST(N'2023-03-30T09:27:54.090' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'eddb1dd7-4d9c-428a-9e11-d2e278a9d3a3', N'ko@gmail.com', N'KO@GMAIL.COM', N'ko@gmail.com', N'Ko', N'Ko', N'KO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGTapQh7MCPmKvA9CaSK28jB6271qzjgg6sD5FnyFwfKQllBdmljWci1slb7Y/5h8A==', N'ZIIECVUGHHVPZQIZRN6QTV7QUZMQ3XB4', N'a910e76d-d337-406c-bd73-1e9214d89e4d', N'09987655545', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-29T00:00:00.000' AS DateTime), 1, 1, 1, NULL, CAST(N'2023-03-29T08:39:02.523' AS DateTime), N'eddb1dd7-4d9c-428a-9e11-d2e278a9d3a3', CAST(N'2023-03-30T08:38:00.047' AS DateTime), N'', CAST(N'2023-04-04T14:39:52.183' AS DateTime), NULL, N'096dcdd4-b72b-45ef-95a3-a52c2b290afc.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'f495d60f-c4a8-4380-b1e1-aa6f415799de', N'pp1@gmail.com', N'PP1@GMAIL.COM', N'pp1@gmail.com', N'ddf', N'fdf', N'PP1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEED7mzL0FjYPVi7V8FePGgauIH79E44miehkenF6w1q8w1aOW8cWl/WuGmx8DNpw4A==', N'66A5A7V2TE3FO7JY67USVKW7FXLXPJWA', N'e8582b10-55e8-4b50-912c-7616a7c62fc5', N'09987655545', 0, 0, NULL, 1, 0, N'', NULL, 1, 1, 1, NULL, CAST(N'2023-03-30T09:18:32.347' AS DateTime), N'f495d60f-c4a8-4380-b1e1-aa6f415799de', CAST(N'2023-03-30T09:18:53.047' AS DateTime), N'', CAST(N'2023-03-30T09:19:09.843' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'f6c313fe-6603-4008-aa30-32cf71eeeaeb', N'kay1@gmail.com', N'KAY1@GMAIL.COM', N'kay1@gmail.com', N'kay', N'kay', N'KAY1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKEi4pn11XhfZwbFDGvMWtHN1mPPo19W2udm1dK/YTFgICH9v8xV6gEHAEK+Mryo5Q==', N'L4U5ZV2X2WWHYUGNN5SHMFF3OA7O6OW3', N'3e6c3fcc-ee0e-4011-a73b-a22bcdfcd7b8', N'', 0, 0, NULL, 1, 0, N'', NULL, 2, 1, 1, NULL, CAST(N'2023-03-31T08:15:18.283' AS DateTime), N'f6c313fe-6603-4008-aa30-32cf71eeeaeb', CAST(N'2023-03-31T08:38:56.003' AS DateTime), N'', CAST(N'2023-03-31T11:06:44.867' AS DateTime), NULL, N'3b9dd5cf-35ec-4282-a5bb-2cbc6002a1b3.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'febde762-fca5-430a-ac1c-0c2528342477', N'test11@gmail.com', N'TEST11@GMAIL.COM', N'test11@gmail.com', N'testing', N'', N'TEST11@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAELkPPrqh1af0nEU29dltdRT+77kR70bR+oHx0isdRTS2smY9K//7VMyGhssOEWh0Qg==', N'N5T3RIC5SQFPHGYWX3QJWI4ZWZKO3NSX', N'2d70a410-75e4-49cd-a349-7498dd15c7ce', N'', 0, 0, NULL, 1, 0, N'', NULL, 2, 1, 1, NULL, CAST(N'2023-03-31T10:19:42.263' AS DateTime), N'febde762-fca5-430a-ac1c-0c2528342477', CAST(N'2023-03-31T10:23:45.447' AS DateTime), N'', CAST(N'2023-03-31T11:06:36.367' AS DateTime), NULL, N'1ce9fb5f-0842-4022-86fa-74b67ba0f50f.jpg', NULL)
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Role_RoleId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_User_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_User_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Role_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_User_UserId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_User_UserId]
GO
