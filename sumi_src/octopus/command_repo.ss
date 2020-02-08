
var commands = [];

func new()
{
    var self = @this;
    self.register(command.echo.new());
    self.register(command.reload.new());
    self.register(command.hop.new());
    self.register(command.st.new());
    self.register(command.newgame.new());
    self.register(command.vl.new());
    return self;
}

func register(command)
{
    commands.push(command);
}

func find_command(name)
{
    foreach(command : commands)
    {
        if(command.name == name)
        {
            return command;
        }
    }
    return null;
}

test find_command()
{
    var repo = command_repo.new();
    repo.register(command.echo.new());

    if(repo.find_command("hoge") != null)
    {
        return false;
    }
    if(repo.find_command("echo") == null)
    {
        return false;
    }
    return true;
}