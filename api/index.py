# Vercel entry point: exposes the flowQ FastAPI app as a serverless function.
# The web pages in /frontend are served by Vercel as static files (see vercel.json).
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "backend"))

from app.main import app  # noqa: E402,F401
