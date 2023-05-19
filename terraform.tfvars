enable_deletion_protection = false
alb_access_logs            = {}
alb_subnet_mapping         = [
  {
    subnet_id            = ""
    private_ipv4_address = "10.0.1.15"
    allocation_id        = ""
    ipv6_address         = ""
  }
]
alb_enable_waf_fail_open   = []
alb_idle_timeout           = []
lb_name                    = "application-lb"
lb_internal                = false
lb_type                    = "application"
lb_listener_rule_priority  = 100
lb_subnet_count            = 2
lb_target_group_name       = "new-lb-target-group"
lb_target_group_port       = 80
lb_target_group_protocol   = "HTTP"
lb_algorithm_type          = "round_robin"
lb_deregistration_delay    = 60
lb_target_group_stickiness = [
  {
    enabled         = false
    type            = "lb_cookie"
    cookie_duration = 60
  }
]
lb_target_group_health_check = [
  {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    matcher             = 200

  }
]

lb_listener_ssl_policy = ""
lb_listener_default_action = [
  {
    type         = "fixed-response"
    content_type = "text/plain"
    message_body = " Site Not Found"
    status_code  = "200"

  }
]

enable_vpc_module           = true
aws_vpc_cidr                = "10.0.0.0/16"
public_subnet_cidr          = ["10.0.2.0/24", "10.0.1.0/24"]
enable_dns_hostnames_subnet = true
enable_dns_support_subnet   = true
enable_internet_gateway     = true
enable_nat_gateway          = false
route_cidr                  = "0.0.0.0/0"

enable_ec2_module              = true
instanceType                   = "t2.micro"
e2_associate_public_ip_address = false
ec2_sg_ids                     = [] #["sg-11ab4100"] Security Group ID will come here if var.include_module_sg is set to false
include_module_sg              = true
ec2_key_name                   = "tf-ec2"
ec2_user_data                  = "./userdata2.sh"
ec2_tags                       = {
  "app1" = "tf-ec2"
}
tag_value = "app2_tf_sg"
sg_ports  = ["22", "443", "80", "8080", "1521"]


root_block_config = [
  {
    root_volume_type = "gp3"
    root_volume_size = "30"
    root_volume_tags = {
      FileSystem = "/root"
    }
  }
]

ec2_ebs_config = [
  {
    device_name = "/dev/xvdb"
    tags = {
      FileSystem = "/web/data"
    }
    volume_size = "10"
    volume_type = "gp3"
  }

]

most_recent_ami = true
owner_ami       = ["099720109477"]
ami_filter      = [
  {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  },
  {
    name   = "virtualization-type"
    values = ["hvm"]
}]
