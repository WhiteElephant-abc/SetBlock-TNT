#如果未加载：
execute unless score @r dfl_enable matches 1 run \
    title @a times 0 70 20
execute unless score @r dfl_enable matches 1 run \
    title @a title {"text":"!!! 缺少前置 !!!","color":"red","bold":true}
execute unless score @r dfl_enable matches 1 run \
    title @a subtitle {"text":"请安装数据包 datapackets functions LIB","color":"gray"}
execute unless score @r dfl_enable matches 1 run \
    return fail
title @a reset


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