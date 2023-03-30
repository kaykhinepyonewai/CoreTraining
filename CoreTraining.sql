USE [CoreTraining]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/30/2023 9:24:42 AM ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 3/30/2023 9:24:42 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 3/30/2023 9:24:42 AM ******/
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
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 3/30/2023 9:24:42 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 3/30/2023 9:24:42 AM ******/
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
/****** Object:  Table [dbo].[UserClaims]    Script Date: 3/30/2023 9:24:42 AM ******/
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
/****** Object:  Table [dbo].[UserLogins]    Script Date: 3/30/2023 9:24:42 AM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 3/30/2023 9:24:42 AM ******/
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
/****** Object:  Table [dbo].[UserTokens]    Script Date: 3/30/2023 9:24:42 AM ******/
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
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'0e6e1c03-9346-461f-a348-ac2383efb2a9', N'ddd', N'ddd', 0, 1, CAST(N'2023-03-29T14:23:03.187' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', CAST(N'2023-03-29T14:33:10.683' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'18cc0efc-80cf-4bd1-a8d4-6157d99594ec', N'fddfdf', N'fdfdfdffd', 1, 1, CAST(N'2023-03-30T08:55:37.477' AS DateTime), N'3ff910a1-3dca-43d8-a289-c7b8f80dbbdf', NULL, N'', CAST(N'2023-03-30T08:55:55.483' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'23b5ace0-0519-4ab1-b7e6-d079acff2fa1', N'Business New', N'New', 1, 0, CAST(N'2023-03-29T11:11:31.247' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-29T14:33:52.297' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'2b34e278-fd8c-42e1-83f4-d394295e61ee', N'Musicsssssssssss Pop', N'Shareing', 1, 1, CAST(N'2023-03-29T11:11:58.060' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-29T11:13:51.570' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-29T14:33:14.660' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'305cf411-64cd-41d8-acac-ede657bfb4b4', N'New', N'New', 1, 0, CAST(N'2023-03-30T08:49:04.290' AS DateTime), N'2b6216ee-a267-4751-85c6-398028866034', CAST(N'2023-03-30T08:49:57.653' AS DateTime), N'2b6216ee-a267-4751-85c6-398028866034', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'41572783-726a-44a3-8c94-3b3e80cf2a7d', N'Testing 12345', N'123', 0, 1, CAST(N'2023-03-29T14:25:55.067' AS DateTime), N'eddb1dd7-4d9c-428a-9e11-d2e278a9d3a3', CAST(N'2023-03-29T14:26:07.753' AS DateTime), N'eddb1dd7-4d9c-428a-9e11-d2e278a9d3a3', CAST(N'2023-03-29T14:31:10.603' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'45a84a9f-0880-42bd-ac50-3ed0f8e89d36', N'fd', N'dfs', 0, 1, CAST(N'2023-03-30T09:19:38.953' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', CAST(N'2023-03-30T09:20:21.097' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'692d11db-253a-4fa5-a4a2-929d444d3fe0', N'dfdsdfdfd4555', N'dfsdfsdfdf', 0, 1, CAST(N'2023-03-29T14:25:04.503' AS DateTime), N'eddb1dd7-4d9c-428a-9e11-d2e278a9d3a3', NULL, N'', CAST(N'2023-03-29T14:31:27.957' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'6a65805a-600d-4815-8bd4-8e597917dcd0', N'Health News', N'News', 1, 0, CAST(N'2023-03-29T11:09:19.610' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'6bcb1207-2e69-441e-909c-aa52b241ff55', N'fdddddaaa111', N'dfsssss', 1, 1, CAST(N'2023-03-29T14:23:42.457' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-29T14:24:15.300' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-29T14:33:06.843' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'793dcb5c-6f15-40cb-9a52-236901b0c7ed', N'Education News', N'News', 0, 0, CAST(N'2023-03-29T11:08:19.750' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', NULL, N'', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'86ee1611-e07a-44e1-ae4e-f5e6c9cf035d', N'Newss', N'Newsss', 1, 1, CAST(N'2023-03-30T08:50:58.113' AS DateTime), N'2b6216ee-a267-4751-85c6-398028866034', CAST(N'2023-03-30T08:54:09.840' AS DateTime), N'2b6216ee-a267-4751-85c6-398028866034', CAST(N'2023-03-30T08:54:16.520' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'91fa80f7-c881-4185-bff8-b3fdb70d2055', N'fd', N'dfs', 0, 1, CAST(N'2023-03-30T09:20:38.833' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-30T09:20:47.430' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-30T09:20:50.630' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'c20a2be0-7566-48d3-9536-030831515c10', N'Business New 11', N'New 111', 1, 1, CAST(N'2023-03-29T14:50:50.490' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', NULL, N'', CAST(N'2023-03-29T14:51:28.563' AS DateTime), NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'e89d69f5-e11b-41ea-a9a9-bb8ac1ebb1fc', N'Celebrity New', N'Newsss', 1, 0, CAST(N'2023-03-29T11:07:55.040' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', NULL, N'', NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [IsPublished], [IsDeleted], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId]) VALUES (N'e8b61d23-4940-40b6-9f1f-4902c81831ac', N'Sport News', N'News', 1, 0, CAST(N'2023-03-29T11:08:52.150' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', NULL, N'', NULL, NULL)
GO
INSERT [dbo].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'ADMIN', N'ADMIN', N'14e04685-6c09-48a0-a338-d3b14d2955c0')
INSERT [dbo].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'USER', N'USER', N'cb4136cd-c1cd-4458-a6a5-3fff65bfd2f4')
GO
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', N'ma@gmail.com', N'MA@GMAIL.COM', N'ma@gmail.com', N'Ma', N'Ma', N'MA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOBjd7tMVzX7tqAoJhE/1BbctuQu273Ly9N5LTypT8jlH/dmystVRVJkBmfLSuYwDw==', N'PDHXZ4L2RYE3KMHX577U4LGPVSFMSKVQ', N'ff542a39-51b2-4aea-b303-c4960286325f', N'09876549933', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-03T00:00:00.000' AS DateTime), 1, 1, 0, NULL, CAST(N'2023-03-29T08:44:17.667' AS DateTime), N'02cdffcd-5fe1-4d22-b9a4-9d2bac9a353a', CAST(N'2023-03-30T08:36:13.717' AS DateTime), N'', CAST(N'2023-03-29T09:57:09.937' AS DateTime), NULL, N'7bf08953-f12c-481d-bc05-deeec0bf6823.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'11de0730-106a-4685-abe1-6b3e0f5ce396', N'user04@gmail.com', N'USER04@GMAIL.COM', N'user04@gmail.com', N'User', N'04', N'USER04@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEA6PHiMEL+BCw17j8rd/44MJZj7tW1SISLAVc5X3bguoIuM22eQ26hsDNX7EBEQTmw==', N'OMFNVKEW6QQH6G63VPAMAP3ZJQR63TZY', N'c358ed6f-025a-4405-ab3d-bf69e6bfede2', N'0998877777', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-14T00:00:00.000' AS DateTime), 1, 1, 1, NULL, CAST(N'2023-03-29T09:02:15.897' AS DateTime), N'11de0730-106a-4685-abe1-6b3e0f5ce396', CAST(N'2023-03-29T09:41:44.763' AS DateTime), N'', CAST(N'2023-03-29T10:32:35.313' AS DateTime), NULL, N'44e86377-6154-4c5d-996a-385003e46e2d.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'2b6216ee-a267-4751-85c6-398028866034', N'user02@gmail.com', N'USER02@GMAIL.COM', N'user02@gmail.com', N'User', N'02', N'USER02@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPeY06k4GtbIzhc0w98oMynK2rN7skYnh9uRAK14DHyINMMXB4zwvHIhDvIVpz36KA==', N'RRUUF3R6P3LLNP52BZVWPNWDPRSV622Z', N'4cc28274-d922-4fe6-9ea0-302f3528961c', N'09987655545', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-29T00:00:00.000' AS DateTime), 1, 1, 0, NULL, CAST(N'2023-03-29T08:38:07.970' AS DateTime), N'2b6216ee-a267-4751-85c6-398028866034', CAST(N'2023-03-30T08:51:19.750' AS DateTime), N'', NULL, NULL, N'2cf97f35-cffe-422e-86a4-715fe0e1c941.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'3ff910a1-3dca-43d8-a289-c7b8f80dbbdf', N'user05@gmail.com', N'USER05@GMAIL.COM', N'user05@gmail.com', N'User', N'05', N'USER05@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHK3kKOTsmvBs/SOjQf102d4yC2IjzN61G8PdyIwVWAp7PpFJl51mD03RYTakZGTRA==', N'SPGA32NVKMXIROFFXNML46WEAVSBG2YY', N'd098f313-8f03-480a-94d0-455b70dae09c', N'09993388383', 0, 0, NULL, 1, 0, N'Mandalay', CAST(N'2023-03-07T00:00:00.000' AS DateTime), 2, 1, 0, NULL, CAST(N'2023-03-29T10:51:03.353' AS DateTime), N'3ff910a1-3dca-43d8-a289-c7b8f80dbbdf', CAST(N'2023-03-30T09:18:01.890' AS DateTime), N'', NULL, NULL, N'a7292ab8-4e05-46be-9746-37070cac4b06.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'53a5395d-5ea4-4009-ae1c-e052f0461279', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'Admin', N'', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECV7cvI9+euckN3O9wfrXhlu9MmT+ty4DlZtGhewtyEy6INOxiF54bQX8XrvQvBvzQ==', N'ROVFH4OEAEWTP2CUUHBCPT4JX2PS4WGI', N'ed30f29f-7789-4363-a1d9-757c49fc45c7', N'09987655545', 0, 0, NULL, 1, 0, N'Mandalay', CAST(N'2023-03-29T00:00:00.000' AS DateTime), 1, 1, 0, NULL, CAST(N'2023-03-29T08:20:41.833' AS DateTime), N'53a5395d-5ea4-4009-ae1c-e052f0461279', CAST(N'2023-03-30T09:19:16.507' AS DateTime), N'', NULL, NULL, N'd503a59c-63e6-4e2f-b639-e6900da7fe1f.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'57fd7b02-c9c3-48b4-b1b1-6d9cab8580ef', N'User06@gmail.com', N'USER06@GMAIL.COM', N'User06@gmail.com', N'User', N'06', N'USER06@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIWqTqpHy/+rryGZAjLFKiIczPqqoZOX1kzhXwn1NH2BnCV7+n7M14ZwoqTURuUnYw==', N'N2CYVJKAEKAUUIZPMTJ2HVEQJO5J3ZY4', N'00825d99-e9e4-48b4-b2ee-28026ff97d1a', N'09987655545', 0, 0, NULL, 1, 0, N'Mandalay', CAST(N'2023-03-30T00:00:00.000' AS DateTime), 2, 1, 1, NULL, CAST(N'2023-03-30T08:53:16.527' AS DateTime), N'57fd7b02-c9c3-48b4-b1b1-6d9cab8580ef', NULL, NULL, CAST(N'2023-03-30T08:53:32.360' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'6bcf7ab3-0710-4061-864e-6b1fd26094c3', N'kay@gmail.com', N'KAY@GMAIL.COM', N'kay@gmail.com', N'fddffd', N'fdsfdsfdsf', N'KAY@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENwf91HSGDsatBiEoJ7JPI3tlbKBWHcG5ax+9h3nQzSuHldSvkOoneMiGVALWyxReQ==', N'CRBK3CMC7ZXKGGPNRIWR4XBGEF37GGBA', N'02c8e8ce-70a9-4233-8f76-7d534856c6fc', N'0998877777', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-29T00:00:00.000' AS DateTime), 1, 1, 1, NULL, CAST(N'2023-03-29T09:47:23.307' AS DateTime), N'6bcf7ab3-0710-4061-864e-6b1fd26094c3', NULL, NULL, CAST(N'2023-03-29T09:48:45.340' AS DateTime), NULL, N'defaultImg.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'8dbba413-e724-4382-a153-b593256b92da', N'user03@gmail.com', N'USER03@GMAIL.COM', N'user03@gmail.com', N'User', N'03', N'USER03@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAED7cCvZwPmTmmWtdNQlJcgEvf3uQK0Z/aIgQRzW00owT8xQ67C9Ptm3K+fIJ+j5u0w==', N'OYNYUO7CYXDRMP6QUVLQAO2PPOOMHBSW', N'40eb87c9-ba9d-400c-b4e2-7ebc241351b1', N'0998828282', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-01T00:00:00.000' AS DateTime), 1, 1, 0, NULL, CAST(N'2023-03-29T08:41:50.530' AS DateTime), N'8dbba413-e724-4382-a153-b593256b92da', CAST(N'2023-03-30T08:39:22.223' AS DateTime), N'', NULL, NULL, N'f845e1b8-51dc-437b-a5b8-06311bc62ed3.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'b31fdeba-6700-4550-bf9d-61b88cb41d48', N'User01@gmail.com', N'USER01@GMAIL.COM', N'User01@gmail.com', N'User', N'01', N'USER01@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFBMeqPRWzlnoBDpEcAy1dvH6uISzPEpF4C2CickGOzDdL2CLeIGVQl0eE9WJtu3Xw==', N'4FHXQ5NJ53NEAI5ZSSOVN5K5TRYP3RR6', N'4b36a6f4-adaf-42b8-9916-fb5db4115402', N'09987655545', 0, 0, NULL, 1, 0, N'Mandalay', CAST(N'2023-03-29T00:00:00.000' AS DateTime), 1, 1, 0, NULL, CAST(N'2023-03-29T08:35:50.090' AS DateTime), N'b31fdeba-6700-4550-bf9d-61b88cb41d48', CAST(N'2023-03-30T08:46:21.473' AS DateTime), N'', NULL, NULL, N'ceae7205-257d-4e4f-9a7c-8948e04b7a34.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'eddb1dd7-4d9c-428a-9e11-d2e278a9d3a3', N'ko@gmail.com', N'KO@GMAIL.COM', N'ko@gmail.com', N'Ko', N'Ko', N'KO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGTapQh7MCPmKvA9CaSK28jB6271qzjgg6sD5FnyFwfKQllBdmljWci1slb7Y/5h8A==', N'ZIIECVUGHHVPZQIZRN6QTV7QUZMQ3XB4', N'a910e76d-d337-406c-bd73-1e9214d89e4d', N'09987655545', 0, 0, NULL, 1, 0, N'Yangon', CAST(N'2023-03-29T00:00:00.000' AS DateTime), 1, 1, 0, NULL, CAST(N'2023-03-29T08:39:02.523' AS DateTime), N'eddb1dd7-4d9c-428a-9e11-d2e278a9d3a3', CAST(N'2023-03-30T08:38:00.047' AS DateTime), N'', NULL, NULL, N'096dcdd4-b72b-45ef-95a3-a52c2b290afc.jpg', NULL)
INSERT [dbo].[User] ([Id], [UserName], [NormalizedUserName], [Email], [FirstName], [LastName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [DOB], [Role], [IsActive], [IsDeleted], [Profile], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [DeletedDate], [DeletedUserId], [ProfileName], [TokenDate]) VALUES (N'f495d60f-c4a8-4380-b1e1-aa6f415799de', N'pp1@gmail.com', N'PP1@GMAIL.COM', N'pp1@gmail.com', N'ddf', N'fdf', N'PP1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEED7mzL0FjYPVi7V8FePGgauIH79E44miehkenF6w1q8w1aOW8cWl/WuGmx8DNpw4A==', N'66A5A7V2TE3FO7JY67USVKW7FXLXPJWA', N'e8582b10-55e8-4b50-912c-7616a7c62fc5', N'09987655545', 0, 0, NULL, 1, 0, N'', NULL, 1, 1, 1, NULL, CAST(N'2023-03-30T09:18:32.347' AS DateTime), N'f495d60f-c4a8-4380-b1e1-aa6f415799de', CAST(N'2023-03-30T09:18:53.047' AS DateTime), N'', CAST(N'2023-03-30T09:19:09.843' AS DateTime), NULL, N'defaultImg.jpg', NULL)
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
