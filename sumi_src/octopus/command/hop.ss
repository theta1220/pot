var name = "hop";

func new()
{
    return @this;
}

func execute(arg_text)
{
    if(arg_text == "")
    {
        log.warn("[hop]:移動先を入力してください");
        return;
    }
    var state_ids = arg_text.split(".");
    var state_machine = main.state_machine;
    foreach(id : state_ids)
    {
        if(state_machine.switch(id) == false)
        {
            log.warn("遷移に失敗しました:{0}", id);
            return;
        }
        log.info("遷移しました:{0}", id);
        if(state_machine.current.has_value("state_machine"))
        {
            state_machine = state_machine.current.state_machine;
        }
        else
        {
            break;
        }
    }
}