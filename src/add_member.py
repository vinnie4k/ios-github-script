import sys

from github import Github
from constants import GITHUB_API_TOKEN, GITHUB_URL, ORG_NAME


def add_member(netid):
    """Add a member to the organization.

    Args:
        netid (string): The NetID to add to the organization.
    """
    # Authenticate GitHub Token
    g = Github(base_url=GITHUB_URL, login_or_token=GITHUB_API_TOKEN)

    # Add to members
    organization = g.get_organization(ORG_NAME)
    try:
        user = g.get_user(netid)
        organization.add_to_members(user)
    except:
        print(f"Error adding {netid}")


if __name__ == "__main__":
    add_member(str(sys.argv[1]))
