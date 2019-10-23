# What Is It?

**Rue** is a board game inspired by Go. In many ways, it's a simplified version of Go, optimized for a condensed space. It is written in Lua and uses the LÖVE-2D framework for handling graphics.

![Rue, start](/screenshots/Rue-Screenshot_01-Start.png)

*Start screen*

![Rue, gameplay](/screenshots/Rue-Screenshot_02-Gameplay.png)

*Gameplay*

# Setup

* [Download LÖVE-2D](https://love2d.org/) for your operating system.
* Clone the repository with `git clone https://github.com/nasanos/rue.git`.
* Run LÖVE-2D with the file path for the cloned repository's folder as its parameter.
    * See LÖVE-2D's [Getting Started](https://love2d.org/wiki/Getting_Started) documentation for examples.

# Rules

* You have the first move -- place your red piece thoughtfully to get the game started in your favor.
* After each move you make, a responding blue piece is placed.
* To win, have more pieces on the board than your opponent.
* A piece that gets surrounded by opponent pieces is eliminated, freeing its space for the opponent.

# To Do

* Craft a game-end checker to determine when no more moves are possible.
* Develop an AI for the opponent (its moves are random at present).
* Build start and game-over menus.
