# app/Dockerfile

FROM python:3.11-slim-bookworm

WORKDIR /app

RUN pip install --upgrade pip streamlit

# Create the ml_project user and group before changing the ownership
RUN groupadd -r ml_project && useradd -r -g ml_project ml_project

RUN mkdir -p /app && chown ml_project:ml_project /app
USER ml_project:ml_project
WORKDIR /app

ENV HOME=/app

COPY . .
RUN pip install -r requirements.txt

EXPOSE 8501

CMD ["streamlit", "run", "ml_project/app.py"]
