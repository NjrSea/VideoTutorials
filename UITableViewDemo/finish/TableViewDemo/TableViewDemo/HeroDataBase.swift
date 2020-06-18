//
//  HeroDataBase.swift
//  TableViewDemo
//
//  Created by wang ya on 2020/6/16.
//  Copyright © 2020 EYA-Studio. All rights reserved.
//

import UIKit

struct HeroSection {

    enum Category: String {
        case Strength = "力量"
        case Intelligence = "智力"
        case Agility = "敏捷"
    }

    var category: Category
    var heros: [Hero]
}

struct Hero {
    var name = ""
    var imageName = ""
}


struct HeroDataBase {

    static func sections() -> [HeroSection] {
        return [
            HeroSection(category: .Strength, heros: [
                Hero(name: "上古巨神", imageName: "Elder_Titan_icon.png"),
                Hero(name: "不朽尸王", imageName: "Undying_icon.png"),
                Hero(name: "亚巴顿", imageName: "Abaddon_icon.png"),
                Hero(name: "伐木机", imageName: "Timbersaw_icon.png"),
                Hero(name: "全能骑士", imageName: "Omniknight_icon.png"),
                Hero(name: "兽王", imageName: "Beastmaster_icon.png"),
                Hero(name: "军团指挥官", imageName: "Legion_Commander_icon.png"),
                Hero(name: "冥魂大帝", imageName: "Wraith_King_icon.png"),
                Hero(name: "凤凰", imageName: "Phoenix_icon.png"),
                Hero(name: "半人马战行者", imageName: "Centaur_Warrunner_icon.png"),
                Hero(name: "发条技师", imageName: "Clockwerk_icon.png"),
                Hero(name: "哈斯卡", imageName: "Huskar_icon.png"),
                Hero(name: "噬魂鬼", imageName: "Lifestealer_icon.png"),
                Hero(name: "大地之灵", imageName: "Earth_Spirit_icon.png"),
                Hero(name: "孽主", imageName: "Underlord_icon.png"),
                Hero(name: "小小", imageName: "Tiny_icon.png"),
                Hero(name: "巨牙海民", imageName: "Tusk_icon.png"),
                Hero(name: "帕吉", imageName: "Pudge_icon.png"),
                Hero(name: "撼地者", imageName: "Earthshaker_icon.png"),
                Hero(name: "斧王", imageName: "Axe_icon.png"),
                Hero(name: "斯拉达", imageName: "Slardar_icon.png"),
                Hero(name: "斯温", imageName: "Sven_icon.png"),
                Hero(name: "昆卡", imageName: "Kunkka_icon.png"),
                Hero(name: "暗夜魔王", imageName: "Night_Stalker_icon.png"),
                Hero(name: "末日使者", imageName: "Doom_icon.png"),
                Hero(name: "树精卫士", imageName: "Treant_Protector_icon.png"),
                Hero(name: "沙王", imageName: "Sand_King_icon.png"),
                Hero(name: "混沌骑士", imageName: "Chaos_Knight_icon.png"),
                Hero(name: "潮汐猎人", imageName: "Tidehunter_icon.png"),
                Hero(name: "上古巨神", imageName: "Elder_Titan_icon.png"),
                Hero(name: "上古巨神", imageName: "Elder_Titan_icon.png"),
                Hero(name: "炼金术士", imageName: "Alchemist_icon.png"),
                Hero(name: "狼人", imageName: "Lycan_icon.png"),
                Hero(name: "玛尔斯", imageName: "Mars_icon.png"),
                Hero(name: "电炎绝手", imageName: "Snapfire_icon.png"),
                Hero(name: "艾欧", imageName: "Io_icon.png"),
                Hero(name: "裂魂人", imageName: "Spirit_Breaker_icon.png"),
                Hero(name: "酒仙", imageName: "Brewmaster_icon.png"),
                Hero(name: "钢背兽", imageName: "Bristleback_icon.png"),
                Hero(name: "马格纳斯", imageName: "Magnus_icon.png"),
                Hero(name: "龙骑士", imageName: "Dragon_Knight_icon.png"),
            ]),
            HeroSection(category: .Agility, heros: [
                Hero(name: "主宰", imageName: "Juggernaut_icon.png"),
                Hero(name: "克林克兹", imageName: "Clinkz_icon.png"),
                Hero(name: "冥界亚龙", imageName: "Viper_icon.png"),
                Hero(name: "剃刀", imageName: "Razor_icon.png"),
                Hero(name: "剧毒术士", imageName: "Venomancer_icon.png"),
                Hero(name: "力丸", imageName: "Riki_icon.png"),
                Hero(name: "卓尔游侠", imageName: "Drow_Ranger_icon.png"),
                Hero(name: "变体精灵", imageName: "Morphling_icon.png"),
                Hero(name: "司夜刺客", imageName: "Nyx_Assassin_icon.png"),
                Hero(name: "圣堂刺客", imageName: "Templar_Assassin_icon.png"),
                Hero(name: "复仇之魂", imageName: "Vengeful_Spirit_icon.png"),
                Hero(name: "天穹守望者", imageName: "Arc_Warden_icon.png"),
                Hero(name: "娜迦海妖", imageName: "Naga_Siren_icon.png"),
                Hero(name: "巨魔战将", imageName: "Troll_Warlord_icon.png"),
                Hero(name: "幻影刺客", imageName: "Phantom_Assassin_icon.png"),
                Hero(name: "幻影长矛手", imageName: "Phantom_Lancer_icon.png"),
                Hero(name: "幽鬼", imageName: "Spectre_icon.png"),
                Hero(name: "影魔", imageName: "Shadow_Fiend_icon.png"),
                Hero(name: "德鲁伊", imageName: "Lone_Druid_icon.png"),
                Hero(name: "恐怖利刃", imageName: "Terrorblade_icon.png"),
                Hero(name: "敌法师", imageName: "Anti-Mage_icon.png"),
                Hero(name: "斯拉克", imageName: "Slark_icon.png"),
                Hero(name: "灰烬之灵", imageName: "Ember_Spirit_icon.png"),
                Hero(name: "熊战士", imageName: "Ursa_icon.png"),
                Hero(name: "狙击手", imageName: "Sniper_icon.png"),
                Hero(name: "矮人直升机", imageName: "Gyrocopter_icon.png"),
                Hero(name: "石鳞剑士", imageName: "Pangolier_icon.png"),
                Hero(name: "米拉娜", imageName: "Mirana_icon.png"),
                Hero(name: "米波", imageName: "Meepo_icon.png"),
                Hero(name: "编织者", imageName: "Weaver_icon.png"),
                Hero(name: "美杜莎", imageName: "Medusa_icon.png"),
                Hero(name: "育母蜘蛛", imageName: "Broodmother_icon.png"),
                Hero(name: "虚空假面", imageName: "Faceless_Void_icon.png"),
                Hero(name: "血魔", imageName: "Bloodseeker_icon.png"),
                Hero(name: "赏金猎人", imageName: "Bounty_Hunter_icon.png"),
                Hero(name: "露娜", imageName: "Luna_icon.png"),
                Hero(name: "齐天大圣", imageName: "Monkey_King_icon.png"),
            ]),
            HeroSection(category: .Intelligence, heros: [
                Hero(name: "修补匠", imageName: "Tinker_icon.png"),
                Hero(name: "先知", imageName: "Nature's_Prophet_icon.png"),
                Hero(name: "光之守卫", imageName: "Keeper_of_the_Light_icon.png"),
                Hero(name: "天怒法师", imageName: "Skywrath_Mage_icon.png"),
                Hero(name: "天涯墨客", imageName: "Grimstroke_icon.png"),
                Hero(name: "宙斯", imageName: "Zeus_icon.png"),
                Hero(name: "寒冬飞龙", imageName: "Winter_Wyvern_icon.png"),
                Hero(name: "工程师", imageName: "Techies_icon.png"),
                Hero(name: "巫医", imageName: "Witch_Doctor_icon.png"),
                Hero(name: "巫妖", imageName: "Lich_icon.png"),
                Hero(name: "帕克", imageName: "Puck_icon.png"),
                Hero(name: "帕格纳", imageName: "Pugna_icon.png"),
                Hero(name: "干扰者", imageName: "Disruptor_icon.png"),
                Hero(name: "戴泽", imageName: "Dazzle_icon.png"),
                Hero(name: "拉席克", imageName: "Leshrac_icon.png"),
                Hero(name: "拉比克", imageName: "Rubick_icon.png"),
                Hero(name: "暗影恶魔", imageName: "Shadow_Demon_icon.png"),
                Hero(name: "暗影萨满", imageName: "Shadow_Shaman_icon.png"),
                Hero(name: "术士", imageName: "Warlock_icon.png"),
                Hero(name: "杰奇洛", imageName: "Jakiro_icon.png"),
                Hero(name: "死亡先知", imageName: "Death_Prophet_icon.png"),
                Hero(name: "殁境神蚀者", imageName: "Outworld_Devourer_icon.png"),
                Hero(name: "水晶室女", imageName: "Crystal_Maiden_icon.png"),
                Hero(name: "沉默术士", imageName: "Silencer_icon.png"),
                Hero(name: "痛苦女王", imageName: "Queen_of_Pain_icon.png"),
                Hero(name: "瘟疫法师", imageName: "Necrophos_icon.png"),
                Hero(name: "祈求者", imageName: "Invoker_icon.png"),
                Hero(name: "神谕者", imageName: "Oracle_icon.png"),
                Hero(name: "祸乱之源", imageName: "Bane_icon.png"),
                Hero(name: "维萨吉", imageName: "Visage_icon.png"),
                Hero(name: "莉娜", imageName: "Lina_icon.png"),
                Hero(name: "莱恩", imageName: "Lion_icon.png"),
                Hero(name: "虚无之灵", imageName: "Void_Spirit_icon.png"),
                Hero(name: "蝙蝠骑士", imageName: "Batrider_icon.png"),
                Hero(name: "谜团", imageName: "Enigma_icon.png"),
                Hero(name: "远古冰魄", imageName: "Ancient_Apparition_icon.png"),
                Hero(name: "邪影芳灵", imageName: "Dark_Willow_icon.png"),
                Hero(name: "陈", imageName: "Chen_icon.png"),
                Hero(name: "风暴之灵", imageName: "Storm_Spirit_icon.png"),
                Hero(name: "风行者", imageName: "Windranger_icon.png"),
                Hero(name: "食人魔魔法师", imageName: "Ogre_Magi_icon.png"),
                Hero(name: "魅惑魔女", imageName: "Enchantress_icon.png"),
                Hero(name: "黑暗贤者", imageName: "Dark_Seer_icon.png"),
            ])
        ]
    }

}
