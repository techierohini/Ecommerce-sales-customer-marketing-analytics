import mysql.connector
connection = mysql.connector.connect(
    host ="localhost",
    user="root",
    password="@#Rohini29!",
    database="ecommerce_analytics"
    )
print("mysql connection successful")
import pandas as pd
import mysql.connector
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@#Rohini29!",
    database="ecommerce_analytics"
    )
print("mysql connection successful")
orders =pd.read_sql("SELECT * FROM orders_cleaned", connection)
print(orders.shape)
print(orders.head())
products = pd.read_sql("SELECT * FROM products_cleaned", connection)
print(products.shape)
print(products.head())
      
print("\nORDERS INFO")
print(orders.shape)
print(orders.dtypes)

print("\nPRODUCTS INFO")
print(products.shape)
print(products.dtypes)

print("\nORDERS MISSING VALUES")
print(orders.isnull().sum())

print("\nPRODUCTS MISSING VALUES")
print(products.isnull().sum())
print("\nORDERS DUPLICATES:", orders.duplicated().sum())
print("PRODUCTS DUPLICATES:", products.duplicated().sum())
product_data = orders.merge(
    products,
    on="Product_ID",
    how="left"
)

print(product_data.head())
print(product_data.shape)


print(product_data.columns.tolist())
print([col for col in
product_data.columns if "product" in col])

