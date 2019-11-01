# Gauntlets of Dragon Slaying
# Belt of Dwarf Slaying

sub EVENT_SAY {
  if ($faction <= 3) { # Require kindly or better faction
    if ($text=~/hail/i) {
      quest::say("Greetings, $race. You know who I am, but I only vaguely know of you. My purpose is simple, I will rule these lands like my father, and my grandfather before him. All tasks but two are inconsequential to me.");
    }
    elsif ($text=~/tasks/i) {
      quest::say("The tasks are simple, $race. I wish the death of the other 'powers' of this frozen waste land. If you are able to destroy either of my mortal foes, bring me proof of your exploits and you will be known as the hero of Kael Drakkel.");
    }
    elsif ($text=~/powers/i) {
      quest::emote("laughs deeply. 'I speak of the foolish old dragon Yelinak and that pitiful Dain Frostreaver.'");
    }
  }
  else {
    quest::say("Why do I even suffer such lesser beings in my presence? Remove yourself, $race, else I'll have my guards relieve you of your head.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) { # Require kindly or better faction
    if (plugin::check_handin(\%itemcount, 30501 => 1)) { ## Dain head
      quest::summonitem(25858); # Item: Belt of Dwarf Slaying
      quest::faction(436,-250); # -Yelinak
      quest::faction(405,-250); # -dain
      quest::faction(448,+500); # +zek
      quest::faction(429,+500); # +tormax
      quest::exp(200000);
    }
    elsif (plugin::check_handin(\%itemcount, 24984 => 1)) { ## Yelinak head
      quest::summonitem(25857); # Item: Gauntlets of Dragon Slaying
      quest::faction(436,-250); # -Yelinak
      quest::faction(405,-250); # -dain
      quest::faction(448,+500); # +zek
      quest::faction(429,+500); # +tormax
      quest::exp(200000); 
    }
    else {
      plugin::return_items(\%itemcount);
      return 1;
    }
    quest::emote("laughs deeply as he takes the bloody head then gives you your reward.");


  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: kael ID: 113215 NPC: King_Tormax

