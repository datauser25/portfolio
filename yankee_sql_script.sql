-- filtering data using SQL, used aggregates, aliasing, unions, temp tables 
use baseball_data;
create temporary table baby
select 
hometeamname,
awayteamname, 
count(awayteamname) as num_of_times_played,
group_concat(attendance) as attendance_per_game,
round(avg(attendance)) as avg_attendance,
round(avg(duration),2) as avg_duration,
max(attendance) as highest_attendance, 
min(attendance) as lowest_attendance
from baseball_data.baseball_data as baseball
where homeTeamName = 'Yankees'  
group by 2;


use baseball_data;
create temporary table gill
select 
hometeamname,
awayteamname,
count(hometeamname) as num_of_times_played,  
group_concat(attendance) as attendance_per_game,
round(avg(attendance)) as avg_attendance,
round(avg(duration),2) as avg_duration,
max(attendance) as highest_attendance, 
min(attendance) as lowest_attendance
from baseball_data.baseball_data as baseball
where awayteamname = 'Yankees'  
group by 1
order by attendance_per_game;


select *
from baby
union all
select *
from gill;

