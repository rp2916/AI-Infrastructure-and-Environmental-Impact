-- ====================================================================
-- AI INFRASTRUCTURE ANALYSIS - SQL QUERIES
-- ====================================================================

-- 1. The Macro Risk (Grid Strain)
-- Business Question: How much of a region's total power grid capacity is already being consumed by data centers?
SELECT 
    r."Region",
    r."Grid_Capacity_MW",
    COUNT(d."Facility_ID") AS total_data_centers,
    SUM(d."Total_Facility_Power_MW") AS total_dc_power_demand_mw,
    ROUND(((SUM(d."Total_Facility_Power_MW") / r."Grid_Capacity_MW") * 100)::numeric, 2) AS pct_of_grid_consumed
FROM regional_grids r
JOIN data_centers d ON r."Region" = d."Region"
GROUP BY r."Region", r."Grid_Capacity_MW"
ORDER BY pct_of_grid_consumed DESC;


-- 2. The AI Water Crisis
-- Business Question: Which regions are carrying heavy AI workloads in highly "water-stressed" environments?
SELECT 
    r."Region",
    r."Country",
    r."Water_Stress_Index_0_to_5",
    COUNT(d."Facility_ID") AS total_data_centers,
    ROUND(AVG(d."Estimated_AI_Workload_Pct")::numeric, 1) AS avg_ai_workload_pct,
    SUM(CASE WHEN d."Primary_Cooling" IN ('Evaporative Water', 'Direct-to-Chip Liquid') THEN 1 ELSE 0 END) AS water_heavy_facilities
FROM regional_grids r
JOIN data_centers d ON r."Region" = d."Region"
WHERE r."Water_Stress_Index_0_to_5" >= 3.5
GROUP BY r."Region", r."Country", r."Water_Stress_Index_0_to_5"
ORDER BY water_heavy_facilities DESC;


-- 3. The Corporate AI Race
-- Business Question: Which tech giant is building the most aggressive AI infrastructure globally?
SELECT 
    "Company",
    COUNT("Facility_ID") AS total_facilities,
    SUM(CASE WHEN "Facility_Tier" = 'Hyperscale' THEN 1 ELSE 0 END) AS hyperscale_facilities,
    ROUND(AVG("Estimated_AI_Workload_Pct")::numeric, 1) AS avg_ai_workload_pct,
    SUM("Total_Facility_Power_MW") AS total_global_megawatts
FROM data_centers
GROUP BY "Company"
ORDER BY total_global_megawatts DESC;


-- 4. The Carbon Footprint (The "Dirty" AI)
-- Business Question: Where is the "dirtiest" AI being run based on carbon intensity?
SELECT 
    r."Region",
    r."Country",
    r."Carbon_Intensity_gCO2_per_kWh",
    r."Renewable_Pct",
    SUM(d."Total_Facility_Power_MW") AS total_megawatts,
    ROUND((SUM(d."Total_Facility_Power_MW") * r."Carbon_Intensity_gCO2_per_kWh")::numeric, 0) AS relative_carbon_score
FROM regional_grids r
JOIN data_centers d ON r."Region" = d."Region"
GROUP BY r."Region", r."Country", r."Carbon_Intensity_gCO2_per_kWh", r."Renewable_Pct"
ORDER BY relative_carbon_score DESC;


-- 5. The Operating Cost (The Price of AI)
-- Business Question: Which region is the absolute most expensive to operate in per hour?
SELECT 
    r."Region",
    r."Country",
    r."Cost_per_kWh_USD",
    SUM(d."Total_Facility_Power_MW") AS total_megawatts,
    ROUND((SUM(d."Total_Facility_Power_MW") * 1000 * r."Cost_per_kWh_USD")::numeric, 2) AS total_hourly_cost_usd
FROM regional_grids r
JOIN data_centers d ON r."Region" = d."Region"
GROUP BY r."Region", r."Country", r."Cost_per_kWh_USD"
ORDER BY total_hourly_cost_usd DESC;


-- 6. The Hardware Evolution
-- Business Question: How has power demand per server rack evolved from 2018 to 2024?
SELECT 
    "Hardware_Model",
    "Release_Year",
    "Rack_Power_kW",
    "Cooling_Water_L_per_kWh"
FROM hardware_metrics
ORDER BY "Release_Year" ASC;
