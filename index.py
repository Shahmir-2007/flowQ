# Vercel entry point: the single "web" service in vercel.json.
# It runs the flowQ FastAPI app, which serves both the API (/api/...) and the web pages in /frontend.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent / "backend"))

from app.main import app  # noqa: E402,F401
