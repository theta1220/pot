
var state_machine = base.state_machine.new();
var command_repo = command_repo.new();
var data_repo = data_repo.new();

func new()
{
    var self = @this;
    
    // ステート
    self.state_machine.register(state.title.new(self));
    self.state_machine.register(state.field.new(self));
    self.state_machine.register(state.battle.new(self));

    return self;
}

func entry(text)
{
    var split = text.split_once(" ");
    if(split.len() == 0)
    {
        return;
    }
    var command_name = split[0];
    var command = command_repo.find_command(command_name);
    if(command == null)
    {
        log.warn("コマンドが みつかりませんでした:{0}", command_name);
        return;
    }
    var arg_text = "";
    if(split.len() > 1)
    {
        arg_text = split[1];
    }
    command.execute(arg_text);
}

test entry()
{
    var main = main.new();
    main.entry("echo hello octopus.");
    return true;
}