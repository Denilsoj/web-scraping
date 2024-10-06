FROM python:3.11-alpine

ENV PYTHONDONTWRITEBYTECODE 1


ENV PYTHONUNBUFFERED 1

COPY webScapingApp /webScapingApp
COPY scripts /scripts

WORKDIR /webScapingApp

EXPOSE 8000

RUN python -m venv /venv && \ 
/venv/bin/pip install --upgrade pip && \
/venv/bin/pip install -r requirements.txt && \
chmod -R +x /scripts

ENV PATH="/scripts:/venv/bin:$PATH"


CMD [ "scripts.sh" ]

