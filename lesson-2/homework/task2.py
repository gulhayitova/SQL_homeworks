import pyodbc #sql server

connection_str = 'DRIVER={SQL SERVER};SERVER=ASPIRE\SQLEXPRESS;DATABASE=lesson2;Trusted_Connection=yes;'
con = pyodbc.connect(connection_str)
cursor = con.cursor()
cursor.execute(
    "SELECT * FROM photos"
)
row = cursor.fetchone()
img_id, img = row
with open('image.jpg', 'wb') as file:
    file.write(img)