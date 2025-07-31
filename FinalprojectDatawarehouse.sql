CREATE DATABASE FinalProjectDatawarehouse


CREATE TABLE [Dim_Course](
	[CourseKey] [int] IDENTITY(1,1) PRIMARY KEY ,
	[CourseId] [int] NOT NULL,
	[Course_Name] [nvarchar](100) NULL,
	[Course_Description] [nvarchar](200) NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)

CREATE TABLE [dbo].[deptdim](
	[DeptKey] [int] IDENTITY(1,1) PRIMARY KEY,
	[DeptId] [int] NOT NULL,
	[Dept_Name] [nvarchar](50) NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)

CREATE TABLE [dbo].[Dim_Certification](
	[Certification_id] [int] NULL,
	[CertificationName] [nvarchar](200) NULL,
	[CertificationField] [nvarchar](100) NULL,
	[Certificationlocation] [nvarchar](200) NULL,
	[Certification_SK] [int] IDENTITY(1,1) PRIMARY KEY,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)


CREATE TABLE [dbo].[Dim_company](
	[Company_SK] [int] IDENTITY(1,1) PRIMARY KEY,
	[Company_id] [int] NULL,
	[CompanyName] [nvarchar](200) NULL,
	[Sector] [nvarchar](100) NULL,
	[CompanyAddress] [nvarchar](300) NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)

CREATE TABLE [dbo].[Dim_Exam](
	[ExamKey] [int] IDENTITY(1,1) PRIMARY KEY,
	[ExamId] [int] NOT NULL,
	[exam_type] [nvarchar](50) NULL,
	[ExamState] [nvarchar](50) NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)

CREATE TABLE [dbo].[dim_instructor](
	[Instructor_SK] [int] IDENTITY(1,1) PRIMARY KEY,
	[Inst_id] [char](14) NULL,
	[full_name] [nvarchar](200) NULL,
	[city] [nvarchar](50) NULL,
	[Gender] [char](1) NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)

CREATE TABLE [dbo].[Dim_Intake](
	[IntakeKey] [int] IDENTITY(1,1) PRIMARY KEY,
	[IntakeNum] [int] NOT NULL,
	[Intake_Year] [int] NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)

CREATE TABLE [dbo].[Dim_job](
	[job_SK] [int]IDENTITY(1,1) PRIMARY KEY ,
	[Joob_id] [int] NULL,
	[platform] [nvarchar](200) NULL,
	[Field] [nvarchar](100) NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)


CREATE TABLE [dbo].[DimBranch](
	[Branch_SK] [int] IDENTITY(1,1) PRIMARY KEY,
	[BrnId_Bk] [int] NULL,
	[Brn_Name] [nvarchar](255) NULL,
	[Brn_Location] [nvarchar](255) NULL,
	[Brn_LaunchDate] [date] NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)

	
CREATE TABLE [dbo].[DimStudent](
	[Student_SK] [int] IDENTITY(1,1)PRIMARY KEY,
	StdId_BK char (14) NULL,
	[Gender] [char](1) NULL,
	[City] [nvarchar](225) NULL,
	[Std_military] [nvarchar](255) NULL,
	[Std_college] [nvarchar](255) NULL,
	[FullName] [nvarchar](100) NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)


CREATE TABLE [dbo].[DimTrainingManager](
	[TrainingManager_SK] [int] IDENTITY(1,1)PRIMARY KEY ,
	[TrainingManager_BK] [char](14) NULL,
	[Gender] [char](1) NULL,
	[City] [nvarchar](225) NULL,
	[FullName] [nvarchar](100) NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)

CREATE TABLE [dbo].[dim_date](
	[date_key] [int] IDENTITY(1,1)PRIMARY KEY ,
	[full_date] [date] NULL,
	[day] [int] NULL,
	[month] [int] NULL,
	[year] [int] NULL,
	[day_of_week] [int] NULL,
	[day_name] [varchar](20) NULL,
	[month_name] [varchar](20) NULL,
	[quarter] [int] NULL,
	[is_weekend] [bit] NULL,
	[week_of_year] [int] NULL,
	)





DECLARE @CurrentDate DATE = '2020-01-01';

WHILE @CurrentDate <= '2030-12-31'
BEGIN
 INSERT INTO dbo.dim_date
 (
 full_date,
 day,
 month,
 year,
 day_of_week,
 day_name,
 month_name,
 quarter,
 is_weekend,
 week_of_year
 )
 VALUES
 (
 @CurrentDate, -- full_date
 DATEPART(DAY, @CurrentDate), -- day
 DATEPART(MONTH, @CurrentDate), -- month
 DATEPART(YEAR, @CurrentDate), -- year
 DATEPART(WEEKDAY, @CurrentDate), -- day_of_week
 DATENAME(WEEKDAY, @CurrentDate), -- day_name
 DATENAME(MONTH, @CurrentDate), -- month_name
 DATEPART(QUARTER, @CurrentDate), -- quarter
 CASE WHEN DATEPART(WEEKDAY, @CurrentDate) IN (1,7) THEN 1 ELSE 0 END, -- is_weekend
 DATEPART(WEEK, @CurrentDate) -- week_of_year
 );

 SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END

PRINT '? Dim_Date table populated successfully for 2020–2030';




CREATE TABLE [dbo].[fact_instructor](
	FACT_SK INT IDENTITY(1,1)PRIMARY KEY,
	[Instructor_SK] [int] NOT NULL,
	[date_key] [int] NOT NULL,
	[Course_SK] [int] NOT NULL,
	[Student_SK] [int] NOT NULL,
	[Age] [int] NULL,
	[Experience] [int] NULL,
	[salary] [decimal](10, 2) NULL,
	[TrainingManager_SK] [int] NULL,



CREATE TABLE [dbo].[std_fact](
FACT_ST_SK INT IDENTITY(1,1)PRIMARY KEY,
	[student_SK] [int] NOT NULL,
	[date_key] [int] NOT NULL,
	[branch_SK] [int] NULL,
	[Job_SK] [int] NULL,
	[Dept_SK] [int] NULL,
	[Track_SK] [int] NULL,
	[CourseSK] [int] NOT NULL,
	[intakeSK] [int] NULL,
	[ExamSK] [int] NULL,
	[CertificationSK] [int] NULL,
	[CompanySK] [int] NULL,
	[result] [int] NULL,
	[grade] [int] NULL,
	[track_duration] [int] NULL,
	[tr_nooStd] [int] NULL,
	[jobcost] [decimal](10, 2) NULL,
	[age] [int] NULL,
	[GPA] [float] NULL)


CREATE TABLE [dbo].[fact_instructor](
	[Instructor_SK] [int] NOT NULL,
	[date_key] [int] NOT NULL,
	[Course_SK] [int] NOT NULL,
	[Student_SK] [int] NOT NULL,
	[Age] [int] NULL,
	[Experience] [int] NULL,
	[salary] [decimal](10, 2) NULL,
	[TrainingManager_SK] [int] NULL)


CREATE TABLE [dbo].[DimTrack](
	[Track_SK] [int] IDENTITY(1,1)PRIMARY KEY,
	[TrackId_BK] [int] NULL,
	[TrackName] [nvarchar](255) NULL,
	[start_date] [datetime] NOT NULL,
	[End_date] [datetime] NULL,
	[SSC] [tinyint] NOT NULL,
	[IS_Current] [tinyint] NOT NULL
	)


