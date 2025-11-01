# This is a template file for personal system settings.

# I recommend removing this file from version control with :
# git update-index --assume-unchanged **/*/private.nix (or ./private-switch.sh to toggle)
# So your personal information does not end up on github.

# for password hashing, you can use `mkpasswd -m sha-512`
{
  config = {
    systemSettings = {
      #users-mapping = [ 
      #  {
      #    name = "nchpg";
      #    hashedPassword = "your hashed password here";
      #  }
      #  {
      #    name = "guest";
      #    hashedPassword = "your hashed password here";
      #  }
      #];
    };
  };
}