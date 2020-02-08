
var name = "newgame";

func new()
{
    return @this;
}

func execute(arg_text)
{
    log.info("[newgame]:新しいプレイヤーデータを作成します");
    var args = arg_text.split(" ");
    if(args.len() < 1)
    {
        log.debug("引数が足りない");
        return;
    }
    var name = args[0];
    log.info("[newgame]:プレイヤー名：{0}", name);
    var player = data.player.new();
    player.name = name;
    
    main.data_repo.player = player;
}