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
        WHEN Age < 30 THEN 'Under 30' <br>
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'<br>
        WHEN Age > 50 THEN 'Over 50'<br>
    END AS "Age Group",<br>
    COUNT(*) AS "Total Customers",<br>
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS "Exited Customers",<br>
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS "Exit Rate"<br>
FROM customers<br>
GROUP BY<br>
    CASE<br>
        WHEN Age < 30 THEN 'Under 30'<br>
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'<br>
        WHEN Age > 50 THEN 'Over 50'<br>
    END<br>
ORDER BY "Exit Rate" DESC;

![image](https://github.com/user-attachments/assets/457ebbcd-366a-4e2e-9407-8667ea91e15b)


Explanation: This query categorizes customers into three age groups and calculates the exit rate for each.

2️⃣ Churn Rate by Gender

SELECT <br>
    Gender, <br>
    COUNT(*) AS "Total Customers", <br>
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS "Exited Customers", <br>
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS "Exit Rate" <br>
FROM customers <br>
GROUP BY Gender; <br>

![image](https://github.com/user-attachments/assets/d31e1556-ce63-4a04-a849-9eb7c39f4332)

Explanation: This query determines if gender affects churn rates.

3️⃣ Churn Rate by Credit Score

SELECT <br>
    CASE <br>
        WHEN CreditScore BETWEEN 350 AND 500 THEN '350-500' <br>
        WHEN CreditScore BETWEEN 501 AND 650 THEN '501-650' <br>
        WHEN CreditScore BETWEEN 651 AND 850 THEN '651-850' <br>
    END AS "Credit Score Category", <br>
    COUNT(*) AS "Total Customers", <br>
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS "Exited Customers", <br>
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS "Exit Rate" <br>
FROM customers <br>
GROUP BY <br>
    CASE <br>
        WHEN CreditScore BETWEEN 350 AND 500 THEN '350-500' <br>
        WHEN CreditScore BETWEEN 501 AND 650 THEN '501-650' <br>
        WHEN CreditScore BETWEEN 651 AND 850 THEN '651-850' <br>
    END <br>
ORDER BY "Exit Rate" DESC; <br>

![image](https://github.com/user-attachments/assets/4fb7bfd3-84ee-4535-b2e4-6fada0eeb4fd)


Explanation: This query groups customers based on their credit score and calculates churn rates for each range.

4️⃣ Churn Rate by Complaints

SELECT <br>
    CASE <br>
        WHEN Complain = 1 THEN 'Filed Complaint' <br>
        WHEN Complain = 0 THEN 'No Complaint' <br>
    END AS "Complaint Status", <br>
    COUNT(*) AS "Total Customers", <br>
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS "Exited Customers", <br>
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS "Exit Rate" <br>
FROM customers <br>
GROUP BY <br>
    CASE <br>
        WHEN Complain = 1 THEN 'Filed Complaint' <br>
        WHEN Complain = 0 THEN 'No Complaint' <br>
    END <br>
ORDER BY "Exit Rate" DESC; <br>

![image](https://github.com/user-attachments/assets/22de12de-7c46-4ab8-876e-12722865c130)


Explanation: This query evaluates whether customers who file complaints are more likely to churn.

5️⃣ Churn Rate by Satisfaction Score

SELECT <br>
    CASE <br>
        WHEN Satisfaction_Score IN (1,2) THEN 'Low Satisfaction' <br>
        WHEN Satisfaction_Score IN (3,4) THEN 'Pretty Good' <br>
        WHEN Satisfaction_Score = 5 THEN 'Great!' <br>
    END AS "Satisfaction Category", <br>
    COUNT(*) AS "Total Customers", <br>
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS "Exited Customers", <br>
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS "Exit Rate" <br>
FROM customers <br>
GROUP BY <br>
    CASE <br>
        WHEN Satisfaction_Score IN (1,2) THEN 'Low Satisfaction' <br>
        WHEN Satisfaction_Score IN (3,4) THEN 'Pretty Good' <br>
        WHEN Satisfaction_Score = 5 THEN 'Great!' <br>
    END <br>
ORDER BY "Exit Rate" DESC; <br>

![image](https://github.com/user-attachments/assets/4fec8e66-85bf-4985-9c82-c5742bd9e6eb)


Explanation: This query determines whether lower satisfaction scores correlate with higher churn rates.

📊 Power BI: Visualization & Analysis <br>
In Power BI, I created an interactive dashboard to analyze bank customer churn. It includes key metrics that help identify patterns among customers who have left the bank.

![image](https://github.com/user-attachments/assets/6158e646-5515-4d61-a6d5-8f481de0e475)


🔹 Dashboard Includes:
📌 Churn Rate by Age Group – Identifies which age groups are most likely to leave. <br>
📌 Churn Rate by Satisfaction Score – Analyzes the impact of satisfaction levels on retention. <br>
📌 Donut Chart by Card Type – Distribution of customers based on card type (Gold, Silver, Platinum, Diamond). <br>
📌 Churn Rate by Geography – Examines regional differences in customer retention. <br>
📌 Total Customers Overview – A key metric showing the size of the customer base. <br>

🔹 The Power BI dashboard visually confirms the hypotheses identified through SQL analysis and presents the results in a way that is easy for business teams to interpret. 🚀

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


