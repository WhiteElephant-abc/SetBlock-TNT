#检测datapackets-functions-LIB数据包是否加载

#如果未加载：
function dfl:dfl_enable
execute unless score @r dfl_enable matches 1 as @a unless score @s dfl_need matches 1 run tellraw @s [{"type":"translatable","translate":"need.dfl.white.elephant.no","fallback":"缺少前置","color":"red","bold":true},{"text":" !","color":"red","bold":true}]
execute unless score @r dfl_enable matches 1 as @a unless score @s dfl_need matches 1 run tellraw @s [{"type":"translatable","translate":"need.dfl.white.elephant.please.install","fallback":"请安装数据包: ","color":"gray"},{"text":"datapackets functions LIB","color":"blue","underlined":true,"italic":true,"click_event":{"action":"open_url","url":"https://modrinth.com/datapack/datapackets-functions-lib"},"clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/datapackets-functions-lib"}}]
execute unless score @r dfl_enable matches 1 as @a unless score @s dfl_need matches 1 at @s run playsound entity.item.break player @s
execute unless score @r dfl_enable matches 1 as @a unless score @s dfl_need matches 1 at @s run playsound entity.villager.no player @s
execute unless score @r dfl_enable matches 1 as @a unless score @s dfl_need matches 1 run scoreboard players set @s dfl_need 1
execute unless score @r dfl_enable matches 1 run return fail


execute at @a[gamemode=!spectator,gamemode=!creative,scores={health=5..}] run setblock ~ ~-1 ~ tnt
execute at @a[gamemode=!spectator,gamemode=!creative,scores={health=1..4}] run setblock ~ ~-1 ~ redstone_block
execute at @a[gamemode=!spectator,gamemode=!creative,scores={health=1..4}] run setblock ~ ~-2 ~ tnt

execute as @a run function dfl:tick/things_to_xp {name:"tnt",xp:"1"}
function dfl:tick/kill_tnt {num:"50"}
execute at @a run function dfl:tick/change_block {new:"air",old:"fire",num:"30"}
function dfl:lib/entity
function dfl:tick/show_entity
function dfl:tick/relax
execute as @e[type=tnt] at @s unless entity @a[distance=..20] run kill