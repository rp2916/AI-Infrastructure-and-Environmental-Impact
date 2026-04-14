# The Physical Cost of AI: Global Infrastructure & Environmental Risk

## 📌 Project Overview
This project explores the physical infrastructure and environmental footprint of the global Artificial Intelligence boom. While AI is often discussed as a purely digital software phenomenon, this analysis maps the massive physical reality required to train and run these models: gigawatt-scale data centers, millions of gallons of cooling water, and exploding grid demands.

**https://public.tableau.com/views/ThePhysicalCostofAI/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link**

### 🎯 Business Questions Answered
1. **Grid Strain:** Which global regions are facing severe grid stress due to data center density?
2. **Environmental Risk:** Where are tech companies building highly water-intensive facilities in drought-prone areas?
3. **Corporate Footprint:** Which hyperscale companies are dominating power consumption?
4. **Hardware Evolution:** How much has server rack power consumption increased from the web-cloud era (2018) to the AI era (2024)?
5. **Financial Viability:** Which regions represent the best balance of cheap electricity and low carbon intensity?

---

## 🛠️ Tech Stack & Methodology
- **Python (Pandas & SQLAlchemy):** Used for initial ETL (Extract, Transform, Load). Cleaned raw CSVs, engineered new features (e.g., categorizing facilities as 'Hyperscale'), and pushed the cleaned data directly to a relational database.
- **PostgreSQL & DBeaver:** Acted as the local data warehouse. Wrote complex SQL queries utilizing Joins, Case Statements, and Aggregations to uncover regional bottlenecks and financial costs.
- **Tableau Public:** Connected to the cleaned dataset to build an interactive, multi-container dashboard. Utilized custom geocoding for mapping, parameter actions, and calculated fields to highlight specific risk zones.

---

## 📊 Key Insights Discovered
1. **The Grid Crisis:** Dublin, Ireland's grid is currently facing a 186% demand load if all regional data centers run at maximum capacity, perfectly mirroring real-world permitting freezes.
2. **The Water Crisis:** Mumbai is operating highly water-intensive liquid cooling facilities despite possessing a severe 4.8/5 Water Stress Index.
3. **The Hardware Shift:** The root cause of the crisis is hardware evolution. A standard 2018 web server pulled 7.5 kW of power. A 2024 AI Rack (e.g., Nvidia B200) demands 100.0 kW—a 13x increase in power density.
4. **The Financial Drain:** Operating an AI workload in Frankfurt costs up to $5.5M per hour globally across all facilities due to highly expensive regional electricity prices, compared to regions like Oregon which provide cheap, renewable hydroelectric power.

---

## 📂 Repository Structure
- `data_cleaning.py`: The Python script used to clean the raw CSV data and load it into PostgreSQL.
- `sql_analysis.sql`: The SQL queries used to aggregate regional power constraints and hardware costs.
- `datasets/`: Contains the raw and cleaned `.csv` files used in the analysis.
- `dashboard_screenshots/`: High-resolution images of the final Tableau dashboard.

---

## 💡 How to Run This Project
1. Clone the repository.
2. Ensure you have PostgreSQL installed locally.
3. Run `data_cleaning.py` to process the data and build the database schema.
4. Execute `sql_analysis.sql` in DBeaver/pgAdmin to view the insights.
5. Open the Tableau workbook (or use the Tableau Public link) to interact with the visual dashboard.
