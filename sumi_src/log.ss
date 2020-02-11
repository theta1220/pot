
func info(text, args)
{
    #ifdef UNITY
    var mes = string.format(text, args);
    system_call("Aquarium.Log.SumiPrint", null, null, "info", text, args);
    #end

    #ifdef CONSOLE
    system_call("Sumi.Log.SumiPrint", null, null, "info", text, args);
    #end
}

func debug(text, args)
{
    #ifdef UNITY
    system_call("Aquarium.Log.SumiPrint", null, null, "debug", text, args);
    #end
    #ifdef CONSOLE
    system_call("Sumi.Log.SumiPrint", null, null, "debug", text, args);
    #end
}

func warn(text, args)
{
    #ifdef UNITY
    system_call("Aquarium.Log.SumiPrint", null, null, "warn", text, args);
    #end
    #ifdef CONSOLE
    system_call("Sumi.Log.SumiPrint", null, null, "warn", text, args);
    #end
}

func error(text, args)
{
    #ifdef UNITY
    system_call("Aquarium.Log.SumiError", null, null, text, args);
    #end
    #ifdef CONSOLE
    system_call("Sumi.Log.SumiError", null, null, text, args);
    #end
}


func no_impl()
{
    #ifdef UNITY
    system_call("Aquarium.Log.SumiError", null, null, "未実装です");
    #end
    #ifdef CONSOLE
    system_call("Sumi.Log.SumiError", null, null, "未実装です");
    #end
}

func assert(cond, text, args)
{
    if(cond)
    {
        return;
    }
    #ifdef UNITY
    system_call("Aquarium.Log.SumiError", null, null, text, args);
    #end
    #ifdef CONSOLE
    system_call("Sumi.Log.SumiError", null, null, text, args);
    #end
}