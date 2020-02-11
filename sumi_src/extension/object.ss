
func has_value(name) : bool
{
    var res = false;
    system_call("Sumi.Class.HasValue", null, res, this, name);
    return res;
}

func has_func(name) : bool
{
    var res = false;
    system_call("Sumi.Class.HasFunction", null, res, this, name);
    return res;
}