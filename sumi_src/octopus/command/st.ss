
var name = "st";

func new()
{
    return @this;
}

func execute(arg_text)
{
    var state = main.state_machine.current;
    if(state == null)
    {
        return;
    }
    var id = main.state_machine.current.id;
    while(state.has_value("state_machine"))
    {
        state = state.state_machine.current;
        if(state == null)
        {
            break;
        }
        id = string.format("{0}.{1}", id, state.id);
    }
    log.info("[st]:{0}", id);
}