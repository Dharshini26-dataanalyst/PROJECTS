create database  digitalmarketing;
use digitalmarketing;
CREATE TABLE tiktok_data (
    Sno INTEGER,
    Hashtag VARCHAR(38),
    Content VARCHAR(40),
    Purpose VARCHAR(40),
    ContentType VARCHAR(40),
    UserDemographic VARCHAR(28),
    Likes INTEGER,
    Shares INTEGER,
    Comments INTEGER,
    Views INTEGER,
    Location VARCHAR(39),
    AgeGroup VARCHAR(10),
    Gender VARCHAR(19),
    PreferredMajor VARCHAR(20),
    InterestInScholarships INTEGER,
    TimeSpentOnContent INTEGER,
    PRIMARY KEY(Sno)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tiktok_data.csv'
INTO TABLE digitalmarketing.tiktok_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select * from tiktok_data;

-- POTENTIAL INSIGHTS
-- 1.content Performance

-- *This QUERY retrieves the most engaging ContentType & Hashtag in tiktok
select Hashtag,ContentType,
	Avg (Likes) AS AverageLikes,
    Avg(Shares) AS AverageShares,
    Avg(Comments) AS AverageComments,
    Avg(Views) AS AverageViews
from tiktok_data 
GROUP BY Hashtag,ContentType
ORDER BY AverageViews DESC;

-- *Average Time_spent on Content

select ContentType,Avg(TimeSpentOnContent) AS Avg_Timespent from tiktok_data group by ContentType;
select ContentType,max(TimeSpentOnContent) AS Max_Timespent from tiktok_data group by ContentType LIMIT 1;
-- *MOST PREFFERED CONTENT
select Content,AVG(Views) from tiktok_data Group by Content ORDER BY AVG(Views) DESC;

-- 2. AUDIENCE SEGMENTATION
select AgeGroup,Gender,
	Avg(Views) AS AVGViews,
    Avg(Likes) AS AVGLikes
from tiktok_data 
GROUP BY AgeGroup,Gender ORDER BY(AgeGroup);

select AgeGroup,PreferredMajor,
	count(*) AS Content_count
    from tiktok_data
    Group By AgeGroup,PreferredMajor
	Order By Content_count DESC;
    
select Location,UserDemographic,
	Sum(Likes) AS Tot_LIKES,
    Sum(Views) AS Tot_VIEWS,
    Sum(Shares) AS Tot_SHARES
    from tiktok_data
    GROUP BY Location,UserDemographic
    ORDER BY Tot_VIEWS;
    
    select Location,
	Sum(Likes) AS Tot_LIKES,
    Sum(Views) AS Tot_VIEWS,
    Sum(Shares) AS Tot_SHARES
    from tiktok_data
    GROUP BY Location
    ORDER BY Tot_VIEWS DESC;

select Gender,ContentType,
	avg(Views) AS AVG_VIEWS,
    avg(TimeSpentOnContent) AS AVG_time_spent
    from tiktok_data
    GROUP BY Gender,ContentType
    ORDER BY AVG_VIEWS DESC;
    
select Gender,Content,
	avg(Views) AS AVG_VIEWS,
    avg(TimeSpentOnContent) AS AVG_time_spent
    from tiktok_data
    GROUP BY Gender,Content
    ORDER BY Gender,AVG_time_spent DESC;
    
    SELECT 
    Gender,
    ContentType,
    AVG(Likes) AS AvgLikes,
    AVG(Shares) AS AvgShares,
    AVG(Comments) AS AvgComments,
    AVG(Views) AS AvgViews,
    AVG(TimeSpentOnContent) AS AvgTimeSpent
FROM 
    tiktok_data
GROUP BY 
    Gender, ContentType
ORDER BY 
    Gender, AvgViews DESC;

SELECT ContentType, 
	AVG(TimeSpentOnContent) AS AvgTimeSpent, 
	AVG(Likes) AS AvgLikes
FROM tiktok_data
GROUP BY ContentType
ORDER BY AvgTimeSpent DESC;

select ContentType,
	AVG(TimeSpentOnContent) AS AVG_Timespent
FROM tiktok_data
group by ContentType
order by AVG_Timespent DESC;

select Hashtag,Location,
	count(*) AS Engagement_count
    from tiktok_data
    group by Hashtag,Location
    order by Engagement_count DESC;
    
