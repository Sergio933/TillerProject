WITH step_1 AS
(
SELECT
#####primery key####
id_order_line
####################
, id_order #join key
, date_opended #order opened
, date_created #added to order
, m_quantity
, m_unit_price
, m_unit_price_exc_vat
, m_total_price_inc_vat
, m_total_price_exc_vat
, m_tax_percent
, m_discount_amount
, dim_type
, dim_status
, TRIM(INITCAP(dim_category)) AS dim_category
, TRIM(INITCAP(dim_category_translated)) AS dim_category_translated
, TRIM(INITCAP(dim_name)) AS dim_name
, TRIM(INITCAP(dim_name_translated)) AS dim_name_translated
, INITCAP(IFNULL(dim_feature_type, '')) AS dim_feature_type
, INITCAP(IFNULL(dim_unit_measure, '')) AS dim_unit_measure
, INITCAP(IFNULL(dim_unit_measure_display, '')) AS dim_unit_measure_display
FROM `charged-thought-411310.triller.order_line` 
)
, step_2 AS
(
SELECT
*
, CASE 
   WHEN REGEXP_CONTAINS((dim_category_translated), "Anjou Chen&#39;S") THEN "Anjou Chenin"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Aperitif &Amp; Spirits") THEN "Aperitifs and Spirits"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Beer&#39;S Pression") THEN "Beer Pression"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Beers &Amp; Cider Bottles") THEN "Beers and Cider Bottles"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Breizh&#39;N&#39;Roll") THEN "Breizh'n'roll"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Children&#39;S Menu") THEN "Children's Menu"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Drinks ☕️") THEN "Drinks"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Džgustation De 3 Crus") THEN "Degustation of 3 cup"
   WHEN REGEXP_CONTAINS((dim_category_translated), "New Year&#39;S Eve") THEN "New Year Eve"
   WHEN REGEXP_CONTAINS((dim_category_translated), "New Year&#39;S Eve Menu") THEN "New Year's Eve Menu"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Private&#39;") THEN "Private"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Soup &Amp; Broth") THEN "Soup and Broth"#
   WHEN REGEXP_CONTAINS((dim_category_translated), "Today&#39;S Special") THEN "Today's Special"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Valentine&#39;S Day") THEN "Valentine's Day"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Wines &Amp; Champagnes") THEN "Wines and Champagnes"
   WHEN REGEXP_CONTAINS((dim_category_translated), "☕️") THEN "Coffee"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Cookings") THEN "Cooking"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Desserts") THEN "Dessert"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Digestives") THEN "Digestive"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Pains") THEN "Pain"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Rosé Wine| Rose Wines Aop| Rose Wines |Rosé Wines") THEN "Rose Wine"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Soft| Soft Drinks| Softs") THEN "Soft Drinks"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Sugars") THEN "Sugar"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Supplements") THEN "Supplement"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Waters") THEN "Water"
   WHEN REGEXP_CONTAINS((dim_category_translated), "White Bottle") THEN "White Wine Bottle"
   WHEN REGEXP_CONTAINS((dim_category_translated), "White Wines") THEN "White Wine"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Wines") THEN "Wine"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Cocktails") THEN "Cocktail"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Earth") THEN "Terre"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Formulas") THEN "Formula"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Menus") THEN "Menu"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Menus") THEN "Menu"
   ELSE dim_category_translated
END AS dim_category_clean
FROM step_1
)
SELECT *
FROM step_2
