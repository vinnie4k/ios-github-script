# ios-github-script
![python-badge](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

### Importing Environment Variables

We will be using `direnv` to import the environment variables. To install `direnv` run the following command:

```bash
brew install direnv
```
1. Create a copy of `.envrc_template` and rename it to `.envrc` in the root directory.
2. Change `ORG_NAME` and `GITHUB_API_TOKEN` values in the `.envrc` file which will be placed.
  - The org name for FA23 is `cs1998-601-fa23`. You can just replace the semester and year.
  - You can find your API token by logging into the Enterprise GitHub and generating a new Personal Access Token with every privilege. See [this](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens).


### Python Packages

1. Create a virtual environment in the root directory: `python3 -m venv venv`.
2. Activate the virtual environment: `. venv/bin/activate`.
3. Install packages via pip: `pip3 install -r requirements.txt`.

### Running the Script

1. In the root directory, create a `txt` file (e.g. `netids.txt`) with a list of NetIDs separated by a new line. **YOU MUST ADD A BLANK LINE AT THE VERY END.** It should look something like this:
```bash
vdb23
rs929


```

2. Execute the script that you want:

```bash
# To add students to the organization, run...
bash add_members.sh <filename>
# Ex: bash add_members.sh netids.txt

# To generate repositories for students, run...
bash create_repo.sh <filename> <assignment>
# Ex: bash create_repo.sh netids.txt a1
# You should use either a1, a2, a3, or a4
```

**For A2, A3, and A4 (two partners), use the following format:**

```bash
vdb23-rs929
cj384-jmh585
act238
tp284


```
