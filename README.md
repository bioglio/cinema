# What are the most influential films?

The success of a film is usually measured through its box-office revenue or the opinion of professional critics. Here a different approach is proposed: the success of a movie is measured looking at how much it has influenced the ones released after it. Influence is calculated on a network of references among movies, where an oriented link between two movies indicates that the first one makes a reference to the second one, by combining several centrality indexes.

Data on references between films are fetched from a subset of [IMDb](http://www.imdb.com/) made publicly available by the website itself (more info [here](https://www.imdb.com/interfaces)).

# And what about directors?

The same algorithm is applied to directors: the network of citations between directors is obtained from the network of references among films, replacing each film with the directors that have directed it.

# One more step: analysis of careers of directors, actors and actresses.

A different way of considering the career of a person, compared to the one used before, is to evaluate the influence of movies he/she has been involved. Using the influence score for films calculated before, in each year we select the films in the top 5% ranking, assigning to each member of its crew a “gold” medal, the ones in top 5% to 10%, assigning a “silver” medal, and finally the ones in top 10% to 15%, whose crew members gain a “bronze” medal. Ranking of individuals is calculated as the [Medal Ranking System](https://en.wikipedia.org/wiki/Olympic_medal_table#Medal_count_ranking) employed for Olympic Games.


## The notebook

The notebook in this repository download data from a dump of IMDb dataset, calculates the influence score for films and directors, and finally analyze the career of directors, actors and actresses using the “medal” system. In addition, it shows some analysis on year of release, countries of production and genres of movies.

## Run the notebook

For running the notebook in a virtual environment, create it:

    virtualenv --python=python3 .venv

then activate it:

    source .venv/bin/activate

install the dependencies (pandas, matplotlib, jupyter, networkx, seaborn):

    pip3 install -r requirements.txt

inally, launch the jupyter notebook:

    jupyter notebook


## Run the notebook inside Docker container

This repository contains a Dockerfile that can be build into a docker container.

To build the container run the following command from inside of the repository directory:

    docker build -t bioglio/cinema .

Run the container:

    docker run -it -p 8888:8888 bioglio/cinema

If you want to save the results on a local directory (for example ./data), run the container with the command:

    docker run -it -p 8888:8888 -v /$(pwd)/data:/home/jovyan/cinema/data bioglio/cinema


After starting the container, you can access jupyter notebook on browser by means of 
the url furnished by the container, like:

```
http://localhost:8888/?token=37e530e6f29c7c910f8e4c115ae58de9bd8c267a1c03a781
```
