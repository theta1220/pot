
var name = "echo";

func new()
{
    return @this;
}

func execute(arg_text)
{
    log.info("[echo]:{0}", arg_text);
}