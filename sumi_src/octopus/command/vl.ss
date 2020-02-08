
var name = "vl";

func new()
{
    return @this;
}

func execute(arg_text)
{
    if(arg_text == "")
    {
        return;
    }
    var name = arg_text;
    var value = system.value_look(name);
    if(value == null)
    {
        log.warn("[vl]:変数が見つかりませんでした:{0}", name);
        return;
    }
    log.info("[vl]:{0}", value);
}