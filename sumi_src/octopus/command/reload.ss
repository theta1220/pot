
var name = "reload";

func new()
{
    return @this;
}

func execute(arg_text)
{
    system_call("Pot.Sumi.Reload", null, arg_text);
}