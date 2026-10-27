# specifies the Parent Image from which you are building.
FROM python:3.9

# specify the working directory for the image
WORKDIR /code

# copy requirements first so the dependency layer is cached across code changes
COPY ./requirements.txt /code/requirements.txt

# install dependencies
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# copy the app code
COPY ./app /code/app

# run the server on port 80 (matches `docker run -p 80:80` in the README)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
