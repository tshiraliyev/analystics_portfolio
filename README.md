# Bank Customer Churn Analysis

📌 Project Overview

This project aims to analyze customer churn in a bank using SQL and Power BI. The dataset includes customer demographics, financial status, and behavioral indicators to identify factors contributing to churn. The analysis provides insights into how age, credit score, gender, complaints, and satisfaction levels influence customer exit rates.

📂 Dataset Overview

The dataset consists of a table named customers, containing:

CustomerId: Unique identifier for each customer

Age: Age of the customer

Gender: Male or Female

CreditScore: Customer's credit score (350-850)

Complain: Whether the customer has filed a complaint (1 = Yes, 0 = No)

Satisfaction_Score: Satisfaction level (1 to 5)

Exited: Whether the customer has left the bank (1 = Yes, 0 = No)

🎯 Hypotheses Tested

Age and Churn: Older customers might have a higher exit rate.

Gender and Churn: Gender may influence customer retention.

Credit Score and Churn: Customers with lower credit scores might churn more.

Complaints and Churn: Customers who file complaints may be more likely to leave.

Satisfaction and Churn: Low satisfaction scores might correlate with higher exit rates.

📊 SQL Queries Used

1️⃣ Churn Rate by Age Group

SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'
        WHEN Age > 50 THEN 'Over 50'
    END AS "Age Group",
    COUNT(*) AS "Total Customers",
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS "Exited Customers",
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS "Exit Rate"
FROM customers
GROUP BY
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'
        WHEN Age > 50 THEN 'Over 50'
    END
ORDER BY "Exit Rate" DESC;

Explanation: This query categorizes customers into three age groups and calculates the exit rate for each.

2️⃣ Churn Rate by Gender

SELECT
    Gender,
    COUNT(*) AS "Total Customers",
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS "Exited Customers",
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS "Exit Rate"
FROM customers
GROUP BY Gender;

Explanation: This query determines if gender affects churn rates.

3️⃣ Churn Rate by Credit Score

SELECT
    CASE
        WHEN CreditScore BETWEEN 350 AND 500 THEN '350-500'
        WHEN CreditScore BETWEEN 501 AND 650 THEN '501-650'
        WHEN CreditScore BETWEEN 651 AND 850 THEN '651-850'
    END AS "Credit Score Category",
    COUNT(*) AS "Total Customers",
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS "Exited Customers",
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS "Exit Rate"
FROM customers
GROUP BY
    CASE
        WHEN CreditScore BETWEEN 350 AND 500 THEN '350-500'
        WHEN CreditScore BETWEEN 501 AND 650 THEN '501-650'
        WHEN CreditScore BETWEEN 651 AND 850 THEN '651-850'
    END
ORDER BY "Exit Rate" DESC;

Explanation: This query groups customers based on their credit score and calculates churn rates for each range.

4️⃣ Churn Rate by Complaints

SELECT
    CASE
        WHEN Complain = 1 THEN 'Filed Complaint'
        WHEN Complain = 0 THEN 'No Complaint'
    END AS "Complaint Status",
    COUNT(*) AS "Total Customers",
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS "Exited Customers",
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS "Exit Rate"
FROM customers
GROUP BY
    CASE
        WHEN Complain = 1 THEN 'Filed Complaint'
        WHEN Complain = 0 THEN 'No Complaint'
    END
ORDER BY "Exit Rate" DESC;

Explanation: This query evaluates whether customers who file complaints are more likely to churn.

5️⃣ Churn Rate by Satisfaction Score

SELECT
    CASE
        WHEN Satisfaction_Score IN (1,2) THEN 'Low Satisfaction'
        WHEN Satisfaction_Score IN (3,4) THEN 'Pretty Good'
        WHEN Satisfaction_Score = 5 THEN 'Great!'
    END AS "Satisfaction Category",
    COUNT(*) AS "Total Customers",
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS "Exited Customers",
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS "Exit Rate"
FROM customers
GROUP BY
    CASE
        WHEN Satisfaction_Score IN (1,2) THEN 'Low Satisfaction'
        WHEN Satisfaction_Score IN (3,4) THEN 'Pretty Good'
        WHEN Satisfaction_Score = 5 THEN 'Great!'
    END
ORDER BY "Exit Rate" DESC;

Explanation: This query determines whether lower satisfaction scores correlate with higher churn rates.

📈 Key Findings

Older customers (50+) have the highest churn rate.

Gender does not significantly impact churn.

Customers with lower credit scores tend to leave more often.

Customers who file complaints have a significantly higher exit rate.

Low satisfaction scores strongly correlate with churn.

🛠️ Tools Used

SQL for data analysis and querying

Power BI for visualization and reporting

🏆 Conclusion

By understanding these customer churn patterns, banks can take action to improve customer retention, such as increasing engagement with dissatisfied customers, addressing complaints proactively, and offering better services to high-risk segments.

📌 Next Steps

Implement machine learning models to predict customer churn.

Conduct deeper analysis on transaction behaviors.

Create strategies to retain at-risk customers.


