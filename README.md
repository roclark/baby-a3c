Baby A3C: solving Mario Kart environments in 180 lines
=======
Sam Greydanus | October 2017 | MIT License

Installation
--------
This repository features a Docker container to ease the installation process. To use, first install Docker according to the [installation steps](https://docs.docker.com/install/). Next, build the gym-mupen64plus container by following the steps outlined [here](https://github.com/bzier/gym-mupen64plus/). Then, edit the first line of the `Dockerfile` in this directory with the image name and tag from the previous step.

```Dockerfile
# Example
FROM roclark/gym-mupen64plus:0.1.0
```

Lastly, build the container with the following (replace the name/tag as appropriate).

```sh
docker build -t baby-a3c:1.0.0 .
```

Usage
--------

To launch the built Docker container, run

```sh
docker run --rm -it baby-a3c:1.0.0
```

Once inside the container, change to the `baby-a3c` directory and run the code below to start.

 * To train: `python baby-a3c.py --env Mario-Kart-Discrete-Luigi-Raceway-v0`
 * To test: `python baby-a3c.py --env Mario-Kart-Discrete-Luigi-Raceway-v0 --test True`
 * To render: `python baby-a3c.py --env Mario-Kart-Discrete-Luigi-Raceway-v0 --render True`

About
--------

_Make things as simple as possible, but not simpler._

Frustrated by the number of deep RL implementations that are clunky and opaque? In this repo, I've stripped a [high-performance A3C model](https://github.com/ikostrikov/pytorch-a3c) down to its bare essentials. Everything you'll need is contained in 180 lines...
	
 * If you are trying to **learn deep RL**, the code is compact, readable, and commented
 * If you want **quick results**, I've included pretrained models
 * If **something goes wrong**, there's not a mountain of code to debug
 * If you want to **try something new**, this is a simple and strong baseline
 * Here's a [quick intro to A3C](https://goo.gl/Ub3vCY) that I wrote

\*same (default) hyperparameters across all environments

Architecture
--------

```python
self.conv1 = nn.Conv2d(channels, 32, 3, stride=2, padding=1)
self.conv2 = nn.Conv2d(32, 32, 3, stride=2, padding=1)
self.conv3 = nn.Conv2d(32, 32, 3, stride=2, padding=1)
self.conv4 = nn.Conv2d(32, 32, 3, stride=2, padding=1)
self.gru = nn.GRUCell(32 * 5 * 5, memsize) # *see below
self.critic_linear, self.actor_linear = nn.Linear(memsize, 1), nn.Linear(memsize, num_actions)
```

\*we use a GRU cell because it has fewer params, uses one memory vector instead of two, and attains the same performance as an LSTM cell.

Known issues
--------
 * I recently ported this code to Python 3.6 / PyTorch 0.4. If you want to run on Python 2.7 / PyTorch 0.2, then look at one of my earlier commits to this repo (there are different pretrained models as well)
