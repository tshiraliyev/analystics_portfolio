SELECT 
    CASE
when age<30 then 'Under 30'
when age between 30 and 50 then '30-50'
when age >50 then 'Over 50'
    END AS "Age Group",
COUNT(*) as "Total Customers",
COUNT(case when exited=1 then 1 end) as "Exited customers",
ROUND(count(CASE WHEN Exited = 1 THEN 1 END) / COUNT(*) * 100, 2) AS "Exit Rate"
FROM customers
GROUP BY
    CASE
when age<30 then 'Under 30'
when age between 30 and 50 then '30-50'
when age >50 then 'Over 50'
    END
ORDER BY "Exit Rate" desc;  --Divides the customers by age groups and define "Exit rate" for each group

SELECT
GENDER,
COUNT(*) as "Total customers",
COUNT(CASE WHEN EXITED=1 THEN 1 END) AS "Exited Customers",
ROUND(COUNT(CASE WHEN EXITED=1 THEN 1 END) / COUNT(*) * 100,2) AS "Exit Rate"
FROM customers
GROUP BY GENDER;  --Defines exit rate by gender

SELECT 
    CASE 
        WHEN CreditScore BETWEEN 350 AND 500 THEN 'Between 350 and 500'
        WHEN CreditScore BETWEEN 501 AND 650 THEN 'Between 501 and 650'
        WHEN CreditScore BETWEEN 651 AND 850 THEN 'Between 651 and 850'
    END AS Credit_Score_Category,
    COUNT(*) AS Total_Customers,
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS Exited_Customers,
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS Exit_Rate
FROM customers
GROUP BY 
    CASE 
        WHEN CreditScore BETWEEN 350 AND 500 THEN 'Between 350 and 500'
        WHEN CreditScore BETWEEN 501 AND 650 THEN 'Between 501 and 650'
        WHEN CreditScore BETWEEN 651 AND 850 THEN 'Between 651 and 850'
    END
ORDER BY Exit_Rate DESC;  --Divides the customers by 'credit score' groups and define "Exit rate" for each group

SELECT 
    CASE 
        WHEN Complain = 1 THEN 'Filed Complaint'
        WHEN Complain = 0 THEN 'No Complaint'
    END AS Complain_Status,
    COUNT(*) AS Total_Customers,
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS Exited_Customers,
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS Exit_Rate,
    ROUND(COUNT(CASE WHEN Complain = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS Complain_Rate
FROM customers
GROUP BY 
    CASE 
        WHEN Complain = 1 THEN 'Filed Complaint'
        WHEN Complain = 0 THEN 'No Complaint'
    END
ORDER BY Exit_Rate DESC; --Defines connection between complain and exit

select
    case
    when satisfaction_score IN (1,2) then 'Low satisfaction'
    when satisfaction_score IN (3,4) then 'Pretty good'
    when satisfaction_score IN (5) then 'Great!'
    END AS Satisfaction_Category,
    COUNT(*) AS Total_Customers,
    COUNT(CASE WHEN EXITED = 1 THEN 1 END) AS Exited_Customers,
    ROUND(COUNT(CASE WHEN EXITED = 1 THEN 1 END) * 100.0/COUNT(*),2) AS Exit_rate
    from customers
    GROUP BY case
    when satisfaction_score IN (1,2) then 'Low satisfaction'
    when satisfaction_score IN (3,4) then 'Pretty good'
    when satisfaction_score IN (5) then 'Great!'
    END
    ORDER BY Exit_Rate DESC; -- Here we define any connections between satisfaction rate and exit rate