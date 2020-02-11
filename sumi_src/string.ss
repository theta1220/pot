
func format(text, args) : string
{
    var res = "";
    system_call("Sumi.Lib.String.Format", null, res, text, args);
    return res;
}

test format()
{
    var text = string.format("{0}.{1}", "hoge", 100);
    if(text != "hoge.100")
    {
        return false;
    }
    return true;
}