SMODS.Atlas ({
    key = "satlas",
    path = "Seels/satlas.png",
    px = 142,
    py = 150
})
SMODS.Atlas ({
    key = "alls",
    path = "Seels/allseal.png",
    px = 71,
    py = 95
})
SMODS.Seal {
    key = 'stone_seal',
     badge_colour = HEX("1d4fd7"),
    config = { extra = { chips = 50 } },
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.chips } }
    end,
    atlas = "satlas",
    pos = {x=0, y=0},
    loc_txt = {
                name = "Stone Seal",
                text = {
                    "{C:blue}+#1#{} extra chips,",
                    "Considered a {C:attention}Stone Card{}."
                },
    },
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                return {
                    chips = self.config.extra.chips
                }
            end
    end,


}
SMODS.Atlas{
    key = "statefa",
    path = "Seels/sfatlas.png",
    px = 35,
    py = 48
}
SMODS.Seal {
    key = 'stateseal',
     badge_colour = HEX("1d4fd7"),
    config = { extra = { Xmult = 1.5 } },
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.Xmult } }
    end,
    atlas = "statefa",
    pos = {x=0, y=0},
    loc_txt = {
                name = "Statefarm Seal",
                text = {
                    "{C:blue}X#1#{} Mult.",
                    "{C:inactive}pleasedontsuemepleasedontsuemePLEASE{}"
                },
    },
     calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                return {
                    x_mult = self.config.extra.Xmult
                }
            end
    end,
}
SMODS.Seal {
    key = 'operad',
     badge_colour = HEX("1d4fd7"),
    atlas = "satlas",
    pos = {x=0, y=0},
    loc_txt = {
                name = "Addition",
                text = {
                    "Adds the {C:blue}+chips{} value of the",
                    "current played hand whne scored."
                },
                label = "Addition"
    },
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                local current_hand_chips = hand_chips
                return {
                    chips = hand_chips
                }
            end
    end,


}
SMODS.Seal {
    key = 'butterlfy',
     badge_colour = HEX("1d4fd7"),
    config = { extra = { Emult = 1.23, dollars = 25} },
    loc_vars = function(self, info_queue)
        return { vars = { self.config.extra.Emult, self.config.extra.dollars } }
    end,
    atlas = "satlas",
    pos = {x=0, y=0},
    loc_txt = {
                name = "Turn A Seal",
                text = {
                    "{X:incative,C:white}^^#1#{} Mult,",
                    "{C:money}+$#2#{}"
                },
                label = "Turn A Gundam"
    },
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                return {
                    eemult = self.config.extra.Emult,
                    dollars = self.config.extra.dollars
                }
            end
    end,


}
SMODS.Seal {
    key = 'opermul',
     badge_colour = HEX("1d4fd7"),
    atlas = "satlas",
    pos = {x=0, y=0},
    config = {extra = {Xmult = 2}}

    loc_txt = {
                name = "Multiplication",
                text = {
                    "Multiplies the Mult value of the played hand ",
                    "by the {C:blue}+chips{} value of the",
                    "current played hand when scored."
                },
                label = "Multiplication"
    },
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                local current_hand_chips = hand_chips
                local current_hand_mult = hand_mult
                return {
                    xmult = hand_chips * hand_mult
                }
            end
    end,


}
SMODS.Seal {
    key = 'opersq',
     badge_colour = HEX("1d4fd7"),
    atlas = "satlas",
    pos = {x=0, y=0},
    config = {extra = {mult = 90}},
    loc_vars = function(self, info_queue, card)
        return {
            self.config.extra.mult
        }
    end,
    loc_txt = {
                name = "Square root",
                text = {
                    "This Card gives +#1# mult,",
                    "and (if possible), is considered ",
                    "it's {C:attention}square root.{}",
                    "{C:inactive}but i cant code so for now they're gonna be treated as gold{}"
                },
                label = "Sqrt (x)"
    },
    calculate = function(self, card, context)
            if context.main_scoring and context.cardarea == G.play or context.repetiton and context.cardarea == G.play then
                return {
                    mult = self.config.extra.mult
                }
            end
            if context.check_enhancement and context.other_card.base.value == "4" or
            context.check_enhancement and context.other_card.base.value == "9" or
            context.check_enhancement and context.other_card.base.value == "14" --Aces are ones!
            then
            return {
                m_gold = true,
                 }
            end
    end,


}

-- all seal is getting a recode.
-- just uhh
-- not now
-- gotta add everyman first