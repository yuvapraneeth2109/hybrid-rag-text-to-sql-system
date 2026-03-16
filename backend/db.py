from sqlalchemy import create_engine
from sqlalchemy.engine import Engine
from backend.models import metadata  # make sure this exists

# =========================  passwork 12345678
# DATABASE CONFIG
# =========================
DB_USER = "postgres"
DB_PASSWORD = "12345678"
DB_HOST = "localhost"
DB_PORT = "5434"
DB_NAME = "postgres"

DATABASE_URL = f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

_engine: Engine = None

def get_engine() -> Engine:
    """
    Returns a singleton SQLAlchemy engine.
    """
    global _engine
    if _engine is None:
        _engine = create_engine(
            DATABASE_URL,
            future=True,
            pool_pre_ping=True,
            pool_size=10,
            max_overflow=20,
            echo=True
        )
    return _engine

engine = get_engine()  # Use the singleton

def init_db():
    metadata.create_all(engine)
    print("Tables created successfully")
