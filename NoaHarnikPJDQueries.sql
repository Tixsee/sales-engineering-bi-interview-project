--Calculate the average "total spend" per "user"
SELECT AVG(Users.total_spend)
FROM Users;


--Calculate average by age
SELECT AVG(Users.total_spend), Age
From 
	( SELECT Users.total_spend, 
	(CONVERT(int,CONVERT(char(8),GETDATE(),112))-CONVERT(char(8),Users.dob,112))/10000 AS Age
	FROM Users)x 
GROUP BY Age
Order BY Age ASC;



--Calculate average total spend per user for 2019

SELECT 
AVG(limitedSumSpent)
FROM (
	SELECT SUM(Transactions.transaction_amount) AS limitedSumSpent,
	Users.source_id
	from Users
	Inner join Transactions on Transactions.user_id = Users.source_id
	WHERE YEAR(Transactions.transaction_time) = 2019
	Group by Users.source_id
	) x
