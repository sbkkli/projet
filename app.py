import streamlit as st
from sqlalchemy import create_engine, text

DATABASE_URL = "mysql+pymysql://root:Papa7777%40@localhost/projetbd"   # adapte les valeurs
engine = create_engine(DATABASE_URL)
with engine.connect() as conn:
    result = conn.execute(text("SHOW TABLES;"))
    print(result.fetchall())




