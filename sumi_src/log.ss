
func info(text, args)
{
    #ifdef UNITY
    #end

    #ifdef CONSOLE
    system_call("Sumi.Log.SumiPrint", null, "info", text, args);
    #end
}

func debug(text, args)
{
    #ifdef UNITY
    #end
    #ifdef CONSOLE
    system_call("Sumi.Log.SumiPrint", null, "debug", text, args);
    #end
}

func warn(text, args)
{
    #ifdef UNITY
    #end
    #ifdef CONSOLE
    system_call("Sumi.Log.SumiPrint", null, "warn", text, args);
    #end
}

func error(text, args)
{
    #ifdef UNITY
    #end
    #ifdef CONSOLE
    system_call("Sumi.Log.SumiError", null, text, args);
    #end
}


func no_impl()
{
    #ifdef UNITY
    #end
    #ifdef CONSOLE
    system_call("Sumi.Log.SumiError", null, "未実装です");
    #end
}

func assert(cond, text, args)
{
    if(cond)
    {
        return;
    }
    #ifdef UNITY
    #end
    #ifdef CONSOLE
    system_call("Sumi.Log.SumiError", null, text, args);
    #end
}