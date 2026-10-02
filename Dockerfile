# flowQ: FastAPI backend + web pages in one container (Hugging Face Spaces, or any Docker host)
FROM python:3.12-slim

# Hugging Face Spaces run containers as user 1000
RUN useradd -m -u 1000 user
USER user
ENV PATH=/home/user/.local/bin:$PATH \
    PYTHONUNBUFFERED=1 \
    PORT=7860

WORKDIR /app
COPY --chown=user backend/requirements.txt backend/requirements.txt
RUN pip install --no-cache-dir --user -r backend/requirements.txt

COPY --chown=user backend ./backend
COPY --chown=user frontend ./frontend
COPY --chown=user supabase ./supabase

WORKDIR /app/backend
EXPOSE 7860
# DATABASE_URL, JWT_SECRET, APP_TIMEZONE ... come from the host's environment variables / secrets
CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port ${PORT} --proxy-headers --forwarded-allow-ips='*'"]
