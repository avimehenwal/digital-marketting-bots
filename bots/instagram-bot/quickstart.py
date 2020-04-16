""" Quickstart script for InstaPy usage """
from instapy import InstaPy
from instapy import smart_run

# set headless_browser=True to run InstaPy in the background
# disable instagram site online checking
session = InstaPy(username="abcd",
                  password="1234",
                  headless_browser=False,
                  want_check_browser=False)

with smart_run(session):
    """ Activity flow """
    # general settings
    session.set_relationship_bounds(enabled=True,
                                    delimit_by_numbers=True,
                                    max_followers=4590,
                                    min_followers=45,
                                    min_following=77)

    # session.set_dont_include(["friend1", "friend2", "friend3"])
    # session.set_dont_like(["pizza", "#store"])

    # activity
    session.like_by_tags(["art"], amount=10)