import sys

from github import Github
from constants import GITHUB_API_TOKEN, GITHUB_URL, ORG_NAME


def create_repo(netid, assignment):
    """Create a private repository in the organization for a single group.

    Args:
        netid (string): The NetID for this group.
            If there are two, `netid` would have a hypen (-) to separate NetIDs.
        assignment (string): The assignment number (e.g "a1", "a2").
    """
    assert (
        assignment == "a1"
        or assignment == "a2"
        or assignment == "a3"
        or assignment == "a4"
    ), "`assignment` must be 'a1', 'a2, 'a3', or 'a4'"

    # Parse NetID
    pos = netid.find("-")
    if pos == -1:
        netid_1 = netid
        netid_2 = None
    else:
        netid_1 = netid[:pos]
        netid_2 = netid[pos + 1 :]

    # Authenticate GitHub Token
    g = Github(base_url=GITHUB_URL, login_or_token=GITHUB_API_TOKEN)

    # Create repository in organization and add collaborators
    organization = g.get_organization(ORG_NAME)
    team = organization.get_team_by_slug("tas")
    try:
        if netid_2 is None:
            repo_name = f"{netid_1}-{assignment}"
            organization.create_repo(repo_name, private=True)
            repo = organization.get_repo(repo_name)
            repo.add_to_collaborators(netid_1, permission="push")
            team.add_to_repos(repo)
        else:
            repo_name = f"{netid_1}-{netid_2}-{assignment}"
            organization.create_repo(repo_name, private=True)
            repo = organization.get_repo(repo_name)
            repo.add_to_collaborators(netid_1, permission="push")
            repo.add_to_collaborators(netid_2, permission="push")
            team.add_to_repos(repo)
    except:
        print(f"Error creating repository for {netid}")


if __name__ == "__main__":
    create_repo(str(sys.argv[1]), str(sys.argv[2]))
