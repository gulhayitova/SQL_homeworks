import pyodbc

con_path = 'DRIVER={SQL SERVER};SERVER=ASPIRE\SQLEXPRESS;DATABASE=lesson2;Trusted_Connection=yes'
con = pyodbc.connect(con_path)
cursor = con.cursor()
cursor.execute("SELECT * FROM worker")
row = cursor.fetchone()[0]
with open('csv_file.csv', 'wb') as file:
    file.write(row)