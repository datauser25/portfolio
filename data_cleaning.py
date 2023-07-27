import pandas as pd
import pip
pip.main(["install", "openpyxl"])
pd.set_option('display.max_columns', None)
pd.set_option('display.width', None)
pd.set_option('display.max_rows', None)
pd.set_option('max_colwidth', None)
df = pd.read_excel(r"/Users/nickhamerlynck/Downloads/Customer Call List.xlsx")
df = df.drop_duplicates()
df = df.drop(columns="Not_Useful_Column")
df["Last_Name"] = df["Last_Name"].str.strip('_')
df["Last_Name"] = df["Last_Name"].str.strip('/')
df["Last_Name"] = df["Last_Name"].str.strip('...')
df["Phone_Number"] = df["Phone_Number"].str.replace('[^a-zA-Z0-9]', '', regex=True)
df["Phone_Number"] = df["Phone_Number"].apply(lambda  x: str(x))
df["Phone_Number"] = df["Phone_Number"].apply(lambda x: x[0:3] + '-' + x[3:6] + '-' + x[6:10])
df["Phone_Number"] = df["Phone_Number"].str.replace('nan--', '')
df["Phone_Number"] = df["Phone_Number"].str.replace('Na--', '')
df[["street_Address", "state", "zip_code"]] = df["Address"].str.split(',', expand=True)
df["Paying Customer"] = df["Paying Customer"].str.replace('No', 'N')
df["Paying Customer"] = df["Paying Customer"].str.replace('Yes', 'Y')
df["Do_Not_Contact"] = df["Do_Not_Contact"].str.replace('No', 'N')
df["Do_Not_Contact"] = df["Do_Not_Contact"].str.replace('Yes', 'Y')
df2 = pd.read_excel(r"/Users/nickhamerlynck/Downloads/Customer Call List.xlsx")
df = df.replace('N/a', '')
df = df.fillna('')
for x in df.index:
    if df.loc[x, "Do_Not_Contact"] == 'Y':
        df.drop(x, inplace=True)
for x in df.index:
    if df.loc[x, "Phone_Number"] == '':
        df.drop(x, inplace=True)

df = df.reset_index(drop=True)
print(df)
print(df2)

