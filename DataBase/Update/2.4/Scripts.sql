SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PagePath] [nvarchar](300) NULL,
	[UserId] [nvarchar](100) NULL,
	[Picture] [nvarchar](300) NULL,
	[UserName] [nvarchar](100) NULL,
	[CommentContent] [nvarchar](500) NULL,
	[Agrees] [int] NULL,
	[Disagrees] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE dbo.NavigationWidget ADD ShowBasket BIT
GO
INSERT INTO [dbo].[CMS_WidgetTemplate]
           ([Title]
           ,[GroupName]
           ,[PartialView]
           ,[AssemblyName]
           ,[ServiceTypeName]
           ,[ViewModelTypeName]
           ,[Thumbnail]
           ,[Order]
           ,[Description]
           ,[Status])
     VALUES
           (N'评论箱'
           ,N'1.通用'
           ,N'Widget.Comments'
           ,N'ZKEACMS.Message'
           ,N'ZKEACMS.Message.Service.CommentsWidgetService'
           ,N'ZKEACMS.Message.Models.CommentsWidget'
           ,N'~/Plugins/ZKEACMS.Message/Content/Image/Widget.Comments.png'
           ,13
           ,null
           ,1)
GO

INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Agrees', N'zh-CN', N'赞同数', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@CommentContent', N'zh-CN', N'评论内容', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@Disagrees', N'zh-CN', N'反对数', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@PagePath', N'zh-CN', N'页面地址', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@UserId', N'zh-CN', N'登录名', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Comments@UserName', N'zh-CN', N'用户名', N'Comments', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'NavigationWidget@ShowBasket', N'zh-CN', N'显示购物车？', N'NavigationWidget', N'EntityProperty')
GO
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module]) VALUES (N'Comments_Manage', 1, N'管理评论', NULL, N'留言评论')
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module]) VALUES (N'Comments_View', 1, N'查看评论', NULL, N'留言评论')
