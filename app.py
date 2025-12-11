import streamlit as st
from sqlalchemy import create_engine, text

DATABASE_URL = "mysql+pymysql://root:Papa7777@@localhost/projetbd"   # adapte les valeurs

engine = create_engine(DATABASE_URL)

