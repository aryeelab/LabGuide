<br><br>
# Getting started in the Aryee Lab

## Accounts

Some of these things requires other people to take action, but usually you need to send us appropriate username/email accounts.

1. Get access to the cluster resources (see below). 
2. Get a username on [GitHub](http://www.github.com) and make sure that you're added as a member of the aryeelab organization (this requires that you send [Martin](mailto:aryee.martin@mgh.harvard.edu) the GitHub username).
3. If you have a .edu email address, add it to your GitHub account and request an [educational start up](https://education.github.com/pack). Git provides a lot of free resources for people with edu email addresses.
4. Get added to our [Slack](https://slack.com/) channel, aryeelab. Tell [Martin](mailto:aryee.martin@mgh.harvard.edu) 1) what email address you want to be associated with your Slack account and 2) any special channels (e.g. #genome_topology) you need to be added to. 
5. Access to MGH Dropbox?
7. Access to Martin's Google Calendar?
8. Get added to the [Lab](http://aryee.mgh.harvard.edu/) webpage. Send [Martin](mailto:aryee.martin@mgh.harvard.edu) a picture/bio. 

## Signing up for an ERISone account

1. Request an account using the `pHPC Account Registration` tab on [here](http://rc.partners.org/hpc). Account setup typically takes 1-3 days.
2. On a Mac/Linux open Terminal and connect to the ERISone cluster using your Partners' username and password: `ssh USERNAME@rgs13.research.partners.org`
Note: More details are available in the [first time cluster user's guide on the Partner's Research Computing website](https://rc.partners.org/kb/article/2164).

## Request Partners VPN access

Accessing the ERISone cluster from outside the Partners network requires a VPN connection. Apply for VPN access using the link on this page: https://rc.partners.org/kb/article/2894

#### One-time setup
This step only needs to be carried out once to make tools installed by our lab available:
`echo "module use /apps/modulefiles/lab" >> $HOME/.bashrc`
Log out (and back in) after copying-and-pasting this command

