# 🟥 PRODUCTION CODE
# FILE: AGENT_SYSTEM/agent_orchestrator.py

import os
from pathlib import Path

TASK_FOLDER = "AGENT_TASKS"


def list_tasks():

    tasks = []

    for file in Path(TASK_FOLDER).glob("*.md"):
        tasks.append(file)

    return tasks


def load_task(task_file):

    with open(task_file, "r") as f:
        return f.read()


def run_agent(task):

    print("Running AI agent task")
    print(task[:200])


def main():

    tasks = list_tasks()

    for task in tasks:

        task_content = load_task(task)

        run_agent(task_content)


if __name__ == "__main__":
    main()