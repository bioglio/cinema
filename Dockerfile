FROM jupyter/datascience-notebook

RUN mkdir ./cinema

COPY *.ipynb ./cinema/
COPY requirements.txt ./cinema/

WORKDIR ./cinema
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN rm ./requirements.txt

