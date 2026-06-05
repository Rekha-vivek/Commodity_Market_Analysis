import streamlit as st
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import openpyxl
import plotly.express as px

#Title
st.title('📊Commodity Market Analysis Dashboard')

#Load Data
df=pd.read_excel('Data set (2).xlsx')

#Date Conversion
df['Date']=pd.to_datetime(df['Date'])

#Num columns
num_df=df.select_dtypes(include='number')

#Sidebar
st.sidebar.markdown("<h2 style='font-size:30px;'>Dashboard Controls</h2>",unsafe_allow_html=True)

selected_col=st.sidebar.selectbox('Select a Column',num_df.columns)

#Statistics
st.markdown(f'Statistical Summary:{selected_col}')

st.write('Mean:',round(df[selected_col].mean(),2))
st.write('Median:',round(df[selected_col].median(),2))
st.write('Mode:',df[selected_col].mode()[0])
st.write('Variance:',round(df[selected_col].var(),2))
st.write('Std Dev:',round(df[selected_col].std(),2))
st.write('Skewness:',round(df[selected_col].skew(),2))
st.write('Kurtosis:',round(df[selected_col].kurt(),2))

#Visualization

#Histogram
st.subheader('Distribution Plot')

fig,ax=plt.subplots(figsize=(8,5))
sns.histplot(num_df[selected_col], kde=True, bins=30,color='red',ax=ax)
plt.title(f'Distribution of {selected_col}')
plt.tight_layout()
st.pyplot(fig)

#Box plot
st.subheader('Box Plot')

fig=plt.figure(figsize=(27,7))
sns.boxplot(data=num_df,color='purple')
plt.title(f"Boxplot of {selected_col}")
st.pyplot(fig)

#Line plot
st.subheader('Line Plot')

fig, ax = plt.subplots(figsize=(19,10))
for col in df.select_dtypes(include='number').columns:
    plt.plot(df.index, df[col], label=col)
plt.title("Line Plot of Numerical Columns")
plt.xlabel("Index")
plt.ylabel("Values")
plt.legend(bbox_to_anchor=(1.05,1), loc='upper left')
st.pyplot(fig)

#Heat map
st.subheader('Heat Map')

fig=plt.figure(figsize=(12,8))
sns.heatmap(num_df.corr(), annot=True)
plt.title("Correlation Heatmap")
st.pyplot(fig)




