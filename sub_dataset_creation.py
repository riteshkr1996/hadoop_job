#!/bin/Python

import pandas as pd

df = pd.read_csv('/home/ritesh/Desktop/HRDataset_v14.csv')

df_subset = df.loc[:,['Employee_Name', 'EmpID', 'MarriedID', 'DeptID', 'Salary', 'PositionID', 'Position', 'State', 'Zip', 'DOB', 'Sex', 'MaritalDesc', 'CitizenDesc', 'DateofHire', 'Department', 'ManagerName', 'ManagerID', 'PerformanceScore']]

df_subset.to_csv('/home/ritesh/Desktop/HRdata_temp.csv', index =  None)

df = pd.read_csv('/home/ritesh/Desktop/HRdata_temp.csv')