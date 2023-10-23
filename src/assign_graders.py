import sys

from github import Github
from constants import GITHUB_API_TOKEN, GITHUB_URL, ORG_NAME


def assign_graders(netid, assignment, grader):
    """Add a grader to the students repository for the given assignment.

    Args:
        netid (string): The NetID to add to the organization.
            If there are two, `student` would have a hypen (-) to separate NetIDs.
        assignment (string): The assignment number (e.g "a1", "a2").
        grader (string): The NetID of the grader.
    """
    assert (
        assignment == "a1"
        or assignment == "a2"
        or assignment == "a3"
        or assignment == "a4"
    ), "`assignment` must be 'a1', 'a2, 'a3', or 'a4'"

    # Authenticate GitHub Token
    g = Github(base_url=GITHUB_URL, login_or_token=GITHUB_API_TOKEN)

    # Get Repository and Add Collaborator
    try:
        organization = g.get_organization(ORG_NAME)
        repo = organization.get_repo(f"{netid}-{assignment}")
        repo.add_to_collaborators(grader, permission="push")
    except:
        print(f"Error adding {grader} to repository {netid}-{assignment}")


if __name__ == "__main__":
    assign_graders(str(sys.argv[1]), str(sys.argv[2]), str(sys.argv[3]))
