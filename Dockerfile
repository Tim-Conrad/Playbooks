FROM python:3
LABEL name="Playbook"

# Setup application
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#Copy over all data from repo
COPY . .

# Expose the server port
EXPOSE 8000/tcp

RUN python ./App/manage.py migrate

# Make all changes persistent
VOLUME [ "/usr/src/app/App" ]

CMD ["python3", "./App/manage.py", "runserver", "0.0.0.0:8000"]