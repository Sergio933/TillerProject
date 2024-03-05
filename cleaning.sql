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
, INITCAP(dim_feature_type) AS dim_feature_type
, INITCAP(dim_unit_measure) AS dim_unit_measure
, INITCAP(dim_unit_measure_display) AS dim_unit_measure_display
FROM `charged-thought-411310.triller.order_line` 
)

SELECT
*
, CASE 
   WHEN REGEXP_CONTAINS((dim_category_translated), "Aperitif &Amp; Spirits") THEN "Aperitif"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Beer|Cider") THEN "Beer"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Breizh&#39;N&#39;Roll") THEN "Pastry"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Menu") THEN "Menu"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Drinks ☕️") THEN "Drinks"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Džgustation De 3 Crus") THEN "Degustation of 3 cup"
   WHEN REGEXP_CONTAINS((dim_category_translated), "New Year") THEN "New Year Menu"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Private&#39;") THEN "Private"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Soup|Broth") THEN "Soup"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Today&#39;S Special") THEN "Today's Special"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Valentine&#39;S Day") THEN "Valentine's Day"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Wine|Champagne|Bottle Pink|Bordeaux Red Pdo|Anjou Chen|Pinot|Riesling|Bourgueil|Merlot|Red|White") THEN "Wine and Champagne"
   WHEN REGEXP_CONTAINS((dim_category_translated), "☕️|Espressions|Hot Drinks|Coffee|Tea|Cafe|The|Café") THEN "Hot Drinks"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Cookings") THEN "Cooking"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Desserts|Sweet") THEN "Dessert"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Digestives") THEN "Aperitif"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Pains") THEN "Bread"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Soft|Soft Drinks|Softs|Water|Waters|Juice|Cold Drinks") THEN "Drinks"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Sugars") THEN "Sugar"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Supplements") THEN "Extras"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Cocktails|Long Drink") THEN "Cocktail"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Earth") THEN "Terre"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Formula") THEN "Formula"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Menus") THEN "Menu"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Aperitif|Appetizers|Aperitif") THEN "Aperitif"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Alcohol") THEN "Alcohol"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Vin") THEN "Wine and Champagne"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Breakfast") THEN "Breakfast"
   WHEN REGEXP_CONTAINS((dim_category_translated), "Accompaniments|Add") THEN "Extras"
   ELSE dim_category_translated
END AS dim_category_clean
FROM step_1
