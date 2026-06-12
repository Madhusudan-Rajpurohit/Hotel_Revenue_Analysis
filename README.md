# 🏨 Hotel Revenue Performance & Predictive Analytics Dashboard

## 📌 Project Overview
This project delivers a data-driven revenue and cancellation risk analysis of a property portfolio across a multi-year period (2015–2017). By tracking critical operational and financial benchmarks across different customer profiles and property types, this analysis isolates severe operational revenue leakage points, structural seasonal demand curves, and booking segment behaviors. 

The core objective of this project is to provide actionable, executive-level insights to optimize room yield management, mitigate high cancellation defaults, and maximize overall property profitability.

---

## 📊 Core Analytical Insights (Verified Data)

### 1. Macro Revenue Benchmarks & Structural Seasonality
* **The August Demand Peak:** **August** stands out as the single highest-earning month across the entire dataset, generating **€7,240,652.99** in total revenue. **July** follows as the second-highest-performing month, bringing in **€5,856,143.76**. This August spike is a recurring, structural demand pattern visible across every single year of data rather than a temporary anomaly.
* **Fiscal Year Performance Trends:** **2016** represents the strongest complete fiscal year in the dataset, capturing **€15,291,176.01** in total revenue across all 12 months. *(Note: 2015 and 2017 reflect partial-year data baselines consisting of July–December at €4.88M and January–August at €14.28M respectively).*

### 2. Property Portfolio Cancellation Risk Assessment
* **Baseline Cancellation Volatility:** The property portfolio experiences a severe baseline cancellation rate of **27.84%** across all historical bookings.
* **Property Type Disparity:** **City Hotels** carry a significantly higher operational risk profile, exhibiting a **30.45%** cancellation rate. This is **28% higher** than the **23.75%** cancellation rate observed at **Resort Hotels**, proving that market environment heavily impacts booking commitment.

### 3. Customer Segment Default Rates & Inventory Leakage
* **The Transient Profile Risk:** **Transient customers** represent the absolute highest cancellation and inventory default threat to the property, holding an overall cancellation rate of **30.49%**. This risk peaks acutely within **City Hotels**, where a staggering **32.84%** of all Transient bookings default.
* **Contract Segment Behavioral Variance:** Contract bookings display highly localized behavior depending on the property type. **City Hotel Contract bookings** experience a high cancellation rate of **25.15%**, whereas **Resort Hotel Contract bookings** drop sharply to just **8.70%**—marking a massive **16.45 percentage point performance gap** between identical booking types in different settings.
* **The Most Stable Segment:** **Group bookings** demonstrate the highest inventory security and lowest default risk across the dataset, registering an incredibly low cancellation rate of just **7.24%**.

---

## 💡 Commercial Strategies for Revenue Optimization

An effective Revenue Analyst turns raw data into strategic operations. Based on the exact findings above, the repository proposes the following strategic frameworks:

1. **Maximize Yield During Proven Structural Peaks:** Because August is a verified structural peak producing **€7.24M**, dynamic pricing thresholds and minimum-length-of-stay (LOS) restrictions must be applied early in the booking window to capture premium consumer surplus.
2. **Implement Overbooking Ratios & Rigid Deposit Gates for Transient Bookings:** Since nearly **33% of transient guests** cancel in City Hotels, the revenue strategy must introduce strict non-refundable payment rules for transient profiles or apply algorithmic overbooking ratios to protect room vacancy.
3. **Shift Contract & Sales Focus Based on Property Alignment:** Knowing that Contract cancellations plummet to **8.70%** at Resort properties but rise to **25.15%** at City properties, corporate sales teams should aggressively push long-term contract allocations toward Resort spaces while prioritizing stable **Group business (7.24% cancellation rate)** to anchor baseline occupancy in City environments.

---

## 🛠️ Technical Competencies Demonstrated
* **Advanced Data Modeling & Schema Design:** Constructed relational linkages between core transaction data and secondary sort mapping tables (`Month_Sort_Map`) to optimize chronological sorting layouts.
* **Custom Field Engineering & Expressions:** Formatted, cleaned, and processed raw data fields into reliable time-series timelines.
* **Logical Sorting Resolution:** Successfully troubleshot and corrected text-string sorting anomalies within Business Intelligence reporting engines, mapping textual data fields directly against custom numeric parameters (`Month_Order`) to deliver chronological, error-free visuals.
* **Strategic Reporting:** Translated complex metrics into executive summaries tailored for Hospitality Directors and Revenue Managers.
