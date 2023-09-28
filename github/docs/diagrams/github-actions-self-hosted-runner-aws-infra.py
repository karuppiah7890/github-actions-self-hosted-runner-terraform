from diagrams import Diagram, Cluster
from diagrams.aws.compute import EC2
from diagrams.aws.network import InternetGateway, NATGateway
from diagrams.onprem.vcs import Github

with Diagram("GitHub Actions Self Hosted Runner AWS Infrastructure", show=False):
    with Cluster("VPC"):
        with Cluster("Public Subnet"):
            ec2 = EC2("Self Hosted Runner")

        internet_gateway = InternetGateway("Internet Gateway")

    ec2 >> internet_gateway

    internet_gateway >> Github("GitHub APIs")
