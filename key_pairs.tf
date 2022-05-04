resource "aws_key_pair" "bastion" {
  key_name = "ds_bastion_key"
  public_key = file("~/.ssh/tfhbastion.pub")
}

resource "aws_key_pair" "web" {
  key_name = "ds_web_key"
  public_key = file("~/.ssh/webtier-key.pub")
}
