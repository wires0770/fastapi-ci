from fastapi import FastAPI

from src.core.router import router

app = FastAPI(title="FastAPI CI Lab")
app.include_router(router)
