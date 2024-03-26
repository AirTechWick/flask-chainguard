FROM cgr.dev/chainguard/python:latest-dev as builder

ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/inky/venv/bin:$PATH"

WORKDIR /inky
EXPOSE 4000
RUN python -m venv /inky/venv
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
FROM cgr.dev/chainguard/python:latest

WORKDIR /inky

ENV PYTHONUNBUFFERED=1
ENV PATH="/venv/bin:$PATH"

COPY . ./
COPY --from=builder /inky/venv /venv

ENTRYPOINT [ "python", "/inky/inky.py" ]