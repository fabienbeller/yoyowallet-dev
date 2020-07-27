FROM python:3.6

WORKDIR /app

COPY ./transaction-api/. .

RUN pip install -r requirements.txt

ENV HTTP_PORT=5000
ENV JWT_SECRET=supersecret
ENV REDIS_URL=redis://redis-queue:6379/0

EXPOSE 5000

CMD [ "python", "run.py" ]
