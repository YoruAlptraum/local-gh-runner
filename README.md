# Local self hosted runner for Windows

Download and setup github desktop, you will also need wsl

`GITHUB_PAT` - your github private access token should only have the minimum required access (carefull with where it is saved)

`REPO_URL` - your github repo url

`RUNNER_NAME` - any name for the runner, cannot be the same as a already registered runner on the repo

If github desktop is set to auto start with windows this runner will also start with machine

## Running

After adding the `.env` credentials run `docker-compose up --build -d` to build and start the image

Set docker desktop to start with Windows to have the runner start with your machine
