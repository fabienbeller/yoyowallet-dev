FROM python:3.6

WORKDIR /app

COPY ./auth-api/requirements.txt .

RUN pip install -r requirements.txt

ENV HTTP_PORT=5000
ENV JWT_SECRET=supersecret

COPY ./auth-api/run.py ./auth-api/users.json app/

EXPOSE 5000

CMD [ "python", "app/run.py" ]
