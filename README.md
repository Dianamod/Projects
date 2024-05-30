# Supply Chain Analysis 
The supply chain dataset consists of 24 columns and 100 rows, containing information on various aspects of the supply chain, including product type, availability, pricing, sales, shipping and costs. The dataset is based on the supply chain of Makeup products. 
# Problem statement 
The supply chain dataset offers a detailed overview of product sales, suppliers, transportation, and logistics. In this project, I aim to extract meaningful insights and provide recommendations to optimize supply chain operations.
# Tools Used
![image](https://github.com/Dianamod/Projects/assets/171150402/084cad91-a310-4841-9de1-eccd70f7f12c)
MySql

![image](https://github.com/Dianamod/Projects/assets/171150402/98c373c3-424f-45cb-b03a-6d40f765b584)
Tableau
# MySql Analysis 
In this analysis, I used MySQL to address the following questions:

![image](https://github.com/Dianamod/Projects/assets/171150402/35455d39-f93c-40ca-86a7-4903c535c3c4)
Total Revenue by Product Type. Identify the most profitable products.

![image](https://github.com/Dianamod/Projects/assets/171150402/8459b773-43b0-49b6-88a9-1b51cba69e98)
Total Products Sold by Supplier. Determine which supplier supplies the most items.

![image](https://github.com/Dianamod/Projects/assets/171150402/3d2ab343-96d5-4bb6-a979-343e10d94fe5)
Total Products Sold by Location. Calculate the total number of items supplied to each location.

![image](https://github.com/Dianamod/Projects/assets/171150402/eb254650-8daa-48bf-b83c-0cd57c3bbb8b)
Shipping Cost by Carrier. Identify the most cost-effective carrier.

![image](https://github.com/Dianamod/Projects/assets/171150402/ae03dfbb-38ce-4900-b2ea-f5f856e99330)
Inspection Results by Supplier. Determine the number of products that failed inspection and identify suppliers with high failure rates.

![image](https://github.com/Dianamod/Projects/assets/171150402/ac330813-038a-4aaa-8f93-674e174b4031)
Lead Time by Supplier. Calculate the average lead time for each supplier to assess their reliability.

![image](https://github.com/Dianamod/Projects/assets/171150402/9446c38c-13f4-420a-961e-6c5fab0eac0f)
Top 3 Products by Shipping Cost. Identify the top 3 SKUs for each carrier that have the highest shipping costs per product shipped.

# Tableau analysis 
In tableau I used charts, tables and KPIs that provide quick insights into the data set. 
The following Key Performance Indicators (KPIs) are provided in dashboards:
1.	Failure rate 
2.	Avg defect rate
3.	Availability rate
4.	Avg lead time 
5.	Total orders
6.	Avg cost per order
7.	Avg shipping times
8.	Total revenue 
9.	Total sold products
10.	Avg price

![image](https://github.com/Dianamod/Projects/assets/171150402/1156c76d-bb8b-47bc-8c42-1e22f729149b)
Supplier performance analysis
1.	Find out any possible problems with suppliers or any shortage with an inventory 
2.	Monitor inspection results and defect rate to identify quality issue
3.	Monitor avg lead time by supplier

Insights :

● The largest supplier is Supplier 1, providing over a quarter of the product types.

● Supplier 4 has a significant quality issue, with 12 out of 18 supplied goods failing inspection, resulting in a 66.7% failure rate. 

● Overall, all suppliers exhibit a high defect rate. Notably, Supplier 2 has the highest defect rate at 51.98%, with a 24% defect rate specifically in haircare products. 

● The average lead time across all suppliers is 17 days, with Supplier 1 and Supplier 4 having the lowest average lead time of 15 days. 

● Additionally, all suppliers are experiencing stock shortages in nearly all product categories.

![image](https://github.com/Dianamod/Projects/assets/171150402/b4dbee84-da1b-478f-a3b8-f34828c2b8b6)
Shipping and logistics analysis

1.	Analyze costs and transportation modes to optimized logistics and reducing shipping costs
2.	Monitor shipping times and shipping carriers to find the most cost-effective carrier 
3.	Monitor the items which have the highest shipping costs 

Insights:

● Among the four transportation modes(air, road, rail, sea) road transportation is associated with higher shipping costs while see transportation offer a more economical solution 

● Carrier b has the highest shipping cost, second costliest carrier c and carrier a which is the most affordable choice

● Among all carriers, Carrier B has the shortest shipping time via air transportation at 4 days, but it is also the most expensive. Sea transportation averages 7 days across all carriers, while Carrier C has the shortest average shipping time by road at 4 days.

![image](https://github.com/Dianamod/Projects/assets/171150402/db79c988-9a4d-493b-b1d7-311c22824060)
Sales analysis 

1.	Analyze the number of items sold and revenue generated
2.	Identify customer demographics to determine which group are purchasing the most products
3.	Monitor the best-selling products.

Insights:

● The highest number of products sold among the three product categories is skincare, which account for 45 % of the business. Haircare follow 29 %  and cosmetics contribute 25% to revenue

●Analyzing customer demographics by product sold reveals that the female group purchases skincare and cosmetics products, while the mail group opts for products in haircare and skincare. An unknown group category purchases a higher quantity of all three products. Skincare products are the most popular among all products.

# Link 
SUPPLIER PERFORMACE ANALYSIS 

https://public.tableau.com/views/Supplychaindatasetdashboards/ShippingLogistics?:language=en-US&publish=yes&:sid=&:display_count=n&:origin=viz_share_link
