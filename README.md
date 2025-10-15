# Agent-Based Model of Group Performance: Specialists vs. Generalists

This repository contains the complete R project for my Master's thesis, which investigates how team composition affects collective performance in a self-organized work environment. This project showcases my skills in computational modeling, large-scale simulation, data analysis, and visualization.

The model was used to run **100 replicates** for each of **3,990 unique experimental conditions**, resulting in nearly 400,000 simulations for each of the two main scenarios tested.

---
## About the Project

In both human groups and social insect colonies, work is often divided between "specialists" who focus on one task and "generalists" who perform many. While the benefits of each are known—specialists are efficient, generalists are flexible—less is known about how the ratio between them affects a team's overall performance in a complex, self-organized system.

This project uses an agent-based model to explore this trade-off. The model simulates team performance by varying three key factors:
1.  The number of tasks to be completed.
2.  The number of workers on the team.
3.  The ratio of generalists to specialists in the group.

---
## Model & Simulation Design

The simulation was built from scratch in R and consists of two primary components: **workers** (agents) and **tasks**.

### The Agents: Specialists vs. Generalists
* **Specialists** are highly efficient at their single, specific task type (adding 100% completion value) but contribute nothing to other tasks (0% completion value).
* **Generalists** are moderately efficient at all task types (adding 25% completion value). This value was chosen to be lower than a specialist's primary skill but higher than their secondary skill, accounting for lower expertise and task-switching costs.

### The Environment: Tasks and Selection
The simulation ends when all tasks are 100% complete. In each "turn", every worker randomly selects a task to work on. Two distinct task-selection environments were modeled to test the effect of predictability:

1.  **Predictable Environment ("To-do list" selection):** Workers can only select from a list of uncompleted tasks. This is an efficient and predictable process.
2.  **Unpredictable Environment ("Blind" selection):** Workers select from all initial tasks and only then check if the task is already complete. If it is, their turn is wasted, modeling inefficiency.

---
## Key Findings

The simulations revealed that the optimal team structure is highly dependent on the predictability of the work environment.

### 1. Predictable Environments ("To-do list")
In a predictable setting, the most efficient teams were the extremes: **100% specialists or 100% generalists** performed equally well. Mixed teams were consistently less efficient, with the worst performance occurring at a ratio of approximately **40% generalists to 60% specialists**.

### 2. Unpredictable Environments ("Blind")
In an unpredictable setting, **generalist-dominated teams were significantly more efficient and robust**. The more generalists on the team, the faster the work was completed. This supports the hypothesis that generalists are more advantageous in less predictable environments.

### 3. Performance Predictability (Variability)
Across both scenarios, teams with more generalists showed **less variability in their performance** (i.e., their results were more predictable). This suggests that generalists provide a more stable and robust workforce, especially as the number of tasks increases.

---
## Project Workflow & Repository Structure

The R code is organized to reflect the research pipeline, from setup to final visualization.

```
├── .gitignore
├── LICENSE
├── README.md
│
└── R/
    ├── 01_setup_conditions.R        # Defines the 3,990 experimental conditions
    ├── 02a_init_task.R              # Function to create tasks
    ├── 02b_init_worker.R            # Function to create agents (specialists/generalists)
    ├── 03_run_simulation.R          # The main simulation engine that runs all scenarios
    ├── 04_aggregate_results.R       # Script to process thousands of raw .csv outputs
    └── 05_create_visualizations.R   # Script to generate final plots with ggplot2
```

---
## Technologies Used
* **Language:** R
* **Key Packages:** `dplyr` for data manipulation and `ggplot2` for data visualization.
