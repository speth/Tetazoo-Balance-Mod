-------------------------------
----- Tetazoo Balance Mod -----
------ Version 2.8 README -----
-------------------------------

Primary goals:
- Substantial re-balancing of air game to reduce ASF spam
- Encourage construction of more factories rather than assisting
- Make T3 land a legitimate strategy
- Improve a variety of units that are rarely used
- Improve effectiveness of air & land based counters to navies
- Reduce some of the more severe racial inequities

- Costs are given as mass/energy/time
- Original values are given in parentheses after the new value

*****************
*** Changelog ***
*****************

Version 2.8:
- Fixed a bug in the CBFP that disabled most nukes when any build restrictions were enabled.

Version 2.7:
- Fixed Seraphim spare ACU to not have Enhancements available
- Mass fabs only work with the player's own mass extractors

Version 2.6:
- SCU build time reduced from 4:00 to 3:00
- improved accuracy and firing rate of T2 static artillery
- removed friendly fire from T3 mobile artillery, and decreased splash slightly
- increased build cost of T3 mobile artillery by 33%

Version 2.5:
- Tetazoo Balance Mod explicitly conflicts with the Community Balance Patch
- The last SCU built by a Quantum Gateway no longer dies when the QG is destroyed
- Mass fabs now work as advertised.

Version 2.4:
- Changed function of Mass Fabricators
  - They now supplement the mass production of mass extractors in a specific radius, with a maximum of one fab per extractor
  - T2 fab stats:
    * Radius 5 (generally only one extractor in range)
    * Generates 22% of the mass of extractors (2 mass for a surrounded T2 mex; 6 mass for a surrounded T3 mex)
    * Cost is 90 energy per mass produced
    * Build cost is 350/8000/833
  - T3 fab stats:
    * Radius 25 (enough to get the 4 core extractors in your base, and several other groups of 2--3 extractors on most maps
    * Generates 33% of the mass of extractors (4 mass for a surrounded T2 mex; 12 mass for a surrounded T3 mex)
    * cost is 2100/96000/4500
  - These costs should be set such that it is generally worthwhile to build fabs near T3 extractors, and that the T3 fab 
    is more efficient if there are at least 3 extractors in the vicinity.
- Fixed bug that allowed T2 fabs to be upgraded to T3

Version 2.3:
- Fixed capture times to match traditional values
- Replaced score with formula from Phantom [mass_killed - mass_lost + 0.02*(energy_killed - energy_lost)]
- Changed Quantum Optics behavior to rely on a locally generated & consumed resource (uses shield HP)
  - Capacity is 1500
  - Regeneration rate (when off) is 15/s.
  - Having the eye on consumes 10/s
  - Moving the eye costs 300
  - The eye only consumes energy while it is on (not while recharging). Energy cost to move is the same (10k).

Version 2.2: 
- Fixed ACU code so it now dies properly when there is no spare

Version 2.1:
- Fixed repair code to apply to Seraphim engineers as well
- Bulwark: Shield HP reduced to 6000 (8000)

Version 2.0:
- Radiation-hardened Strategic missile defense: Takes 10% damage from all nukes
- Spare ACU can be built from the Quantum Gateway
  - Cost: 18,000 mass, 900,000 energy, builds in 6:00 (-50, -2500)
  - You can only build one, and it must be of the same faction as your ACU
  - It is a basic ACU with no upgrades, and without overcharge
  - When your ACU dies, the spare becomes your real ACU, with all abilities available (you lose all upgrades and veterancy)
- Repair works in a reasonable manner for units built from factories
- T3 Mobile AA mod is merged directly, and the dps of all T3MAA units is increased to ~ 350 dps


*********************
****** ECONOMY ******
*********************
* Assisting does weird things to the game. Building multiple factories should be encouraged.
* Naval factories build boats too slowly
  - Increase build power of all factories and increase build time of all units accordingly
    - Each factory upgrade multiplies build power by 2.5
    - Build time of T2 air and land units decreased by 15%
    - Build time of T3 air and land units decreased by 30%
    - Build time of T1/T2/T3 naval units decreased by 30%/50%/65%
    - T3 Aircraft Carriers have the BP of a T3 air factory
    - Experimental factories have the BP of 3 equivalent T3 factories
  - disable Kennels and Hives. Trust me, you don't want them any more.
  - details are at the bottom...
* Low tier engineers are more mass-efficient than higher-tier ones
  - Decrease cost of T2 engineer to 130 mass (160)
  - Decrease cost of T3 engineer to 320 mass (490) and increase build power to 20 (15)

*********************
******** LAND *******
*********************

>> TIER 1 <<
* MLA is over-used in T1 (except cybran, which is very rarely used)
  - Lobo, Fervor cost increased by 33%
  - Zthuee (Fobo) cost increased by 25%
  - Medusa dps increased by 25%, reduced firing randomness to 0.75 (1.5)

>> TIER 2 <<
* Nobody uses MMLs 
  - +50% dps for MMLs
  - increased range to 65 (from 60)
  - increased splash by 1 (0.5 or 1)
* Deceiver is underutilized
  - Increase deceiver speed to 4 (same as mobile shields, can keep up with armies)
  - increase radar & sonar stealth radius from 18 to 22
* Nobody uses sparky
  - Give Sparky a full build suite
  - Improve radar range to 45 (30)
  - increase number of radar jamming blips to 8 (5)
  - reduce cost to 175 mass (225), 800 energy (1000), 800 time (1000)
* Mobile flak is badly balanced...
  - decrease splash area to 2.5 (from 4)
  - increase projectile speed to allow it to hit ASF (speed to 60 from 20)
  - increase cost by 25%
  - decreased damage by 33%
* Improve hover/submersible tanks performance vs navies
  - riptide: vision radius 25 (from 15); range 22 (from 18); max speed 4 (from 3.7)
  - wagner: vision radius 20 (from 15); water vision to 25; torp damage 60 (from 6); max speed 4 (from 3.7)
  - yenzyne: vision radius 25 (from 15); projectile damage 250  (from 175); range 22 (from 18); max speed 4 (from 3.7)
  - blaze: vision radius 25 (from 15); projectile damage 20 (from 15); max speed 4 (from 3.7)

>> TIER 3 <<
* There is no T3 land game to speak of. Experimentals eat everything for breakfast
* Mobile heavy is underused
  - increase range to 100 (from 90)
  - increase rate of fire by 50%, increase damage by 1/3 (== double DPS)
  - increase HP by 33%
* Spearhead needs corresponding buffs
  - increase range to 90 (from 80)
  - double damage per missile
  - increase HP by 20%
* Sniper bots need some lovin':
  - increase damage per shot by 25%
    (the Seraphim bot in deploy-mode now one-shots a Titan)
* Seraphim mobile shield is too expensive
  - decrease cost 450 mass, 3375 energy, 2250 time
* Brick's torpedoes are a joke
  - increase dps to 50 (10)
  
*********************
******** AIR ********
*********************

>> Tier 1 <<
* Air scouts are too expensive (compare to interceptors)
  - reduce costs to 20 mass (40), 1200 energy (1600), 300 time (400)

>> Tier 2 <<
* Torpedo bombers die too easily to the strong AA of cruisers 
  - Increase HP of T2 torpedo bombers by 50%
* T2 gunships are under-used relative to their T3 counterparts
  - 25% increase in HP

>> Tier 3 <<
* ASFs are OP 
  - Cost & build time increased by 50%
  - hit points increased by 50%
  - dps reduced by 25%
  - Max speed reduced to 22 (25)
  - SAMs and flak are buffed as well
* Need to rebalance Restorers based on ASF changes
  - Increased build time to 7000 (4800) and energy cost to 35000 (20000)
  - Reduce AA damage by 40%
* Broadswords
  - HP reduced to 5999 (from 6000)

*********************
******* NAVAL *******
*********************

* Getting back in the water after losing the naval game is too hard
  - T2 Artillery, MMLs, and mobile heavy artillery all get buffs to counter the range of T2 boats
  - Amphibious tanks have all gotten some improvements to deal better with boats

>> Tier 1 <<
  - reduce frigate range to 20--23 (from 28--31)

>> Tier 2 <<
  - Remove TMD from cruisers
  - reduce range of destroyer cannon from 80 to 70 on Aeon and Cybran destroyers (UEF and Seraphim are already range 60)
  - Increased dps of Aeon cruiser to 140 (70)
  - Decrease missile dps of Seraphim cruiser to 200 (250)
* Bulwark is OP
  - reduced shield HP to 6000

>> Tier 3 <<
* Battleships: Astoundingly ineffective
  - Aeon
    - DPS increased by 120%
    - DamageRadius increased to 4 (2)
  - Cybran
    - DPS increased by 100%
    - torpedo dps increased from 20 to 100
    - AA dps increased from 15 to 90
  - UEF
    - DPS increased by 80%
    - AA dps increased from 28 to 140
  - Seraphim
    - DPS increased by 80%
    - AA dps increased from 28 to 140 
    - AA MuzzleVelocity increased to 60
  (Aeon get proportionally more DPS increase and UEF less because 
   of range discrepancies; Seraphim get less because of Nukes)

* UEF Battlecruiser: Not quite cool enough
  - Main weapon DPS increased by 25% (564->705)
  - Torpedo DPS increased to 144 (20)

* Strategic Missile Subs have too many drawbacks
  - Decreased missile cost and build time to 120% of land-based missile costs
    (14400 mass, 1.62M energy, 6:00 build time)
  - Also applies to Seraphim Battleship

*********************
******* DEFENSE *****
*********************

>> Tier 1 <<
* I think everything is mostly okay, here

>> Tier 2 <<
* T2 static artillery is useless
  - all races: 25% decrease in cost (same build times), substantial increase in accuracy
  - Aeon: 25% increase in damage, 33% increase in ROF
  - UEF: 100% increase in ROF
  - Cybran: 66% increase in ROF, 15% increase in damage per shot
  - Seraphim: 33% increase in damage per shot, 33% increase in ROF
* Static Flak is useless
  - increase range to 50 (44)
  - increase projectile speed to 60 (20) 
  - increase dps by 50% (150->225)
* Cybran and Seraphim T2 PD are comparatively weak
  - Increase DPS of Cybran T2 PD by 50%
  - Increase DPS of Seraphim T2 PD by 25%
* T2 PD is generally too weak
  - 20% dps increase all around (in addition to the previous buffs)
  - 150% increase in HP
* Tac missiles are difficult to use against moving targets
  - Increased splash area to 4 (2)

>> Tier 3 <<
* Keep Ravager competitive with improvements in T2 PD
  - Ravager gets a 20% dps increase as well
  - 67% increase in HP
* SAMs aren't cool enough
  - Increase range to 80 (60) 
  - increase missile speed and TTL 
  - increase damage per salvo by 10%  (2 salvos kill an ASF)
  - decrease reload time by 30%       (net 57% increase in DPS: now 523 dps)
  - decrease HP to 4500 (10500)
  
>> Shields <<
* Cybran shields suck. Seraphim shields have no drawbacks. Aeon are the only ones without upgrade-in-place
  - Shields are rebalanced, with the following racial strengths/weaknesses:
                 HP  Size  Regen
         UEF     0    +     +
        Aeon     +    -     ++
      Cybran     -    +     ++
    Seraphim     ++   ++    --
  - Cybran T3 engineers can build the ED5 directly
  - Aeon T2 shield can upgrade in place
  - Shields regenerate HP faster, but come back after failing at 1/3 HP
    This makes them somewhat less robust against things like T3 artillery...
  - full details at the end

>> Other <<
* Air crash damage is cheese 
  - Reduce all Air crash damage by 90%

* There is no conceiveable way in which the Soothsayer is better than the Eye of Rhianne
  - Increase Eye cost to 4800/80000/5400 (3000/48000/1800)
  - Decrease Soothsayer cost to 2400/40000/2600 (4800/60000/800) and energy maintenance cost to 2000 (3000)

*************
*** Nukes ***
*************
* Anti-nukes are too vulnerable to sniping
  - Increase HP to 14000
* Nuke launcher builds too fast relative to SMD
  - Increase build time to 18k (9k) [built in 3:20 by T3 commander]
  - Increased launcher cost to 18k mass (15k), 250k (210k) energy
* Strategic Missile Subs are never used
  - Reduce missile build time to 6 minutes
* It is impossible to practically rebuild SMD after getting hit by a nuke
  - SMD is now radiation hardened, taking only 10% damage from nukes


*********************
****** ACU/SCU ******
*********************

>> SCU <<
* SCUs are nearly useless
  - only SCUs can build experimentals
  - decrease mass cost by 33% (to approx. 6000 from approx. 9000)
  - increase max speed and acceleration to 2.7 (2.2)
  - increase dps to 400 (100) [goes toe-to-toe with 2 bricks]
  - DPS with combat upgrades [UEF, Cybran] is now 800 (250)
  - Modifications to upgrades [Unless otherwise noted, all upgrades have build time reduced by 50%]
    - UEF:
      - Area shield: BT and energy cost reduced by 25%
      - radar jammer: BT reduced by 75%
      - engineering drone: drone has build power 25 (5); cost: 1200/24000/3600;
      - RAS: Increased to +12 mass, +1600 power, BT reduced by 25%
      - Energy Accelerator (doubles ROF): cost increased to 2000/90000/5000 (1000/45000/5000)
    - Aeon:
      - move Nano-repair to left arm (now competes with rapid fab)
      - Reacton Refractor: BT reduced by 67%
      - RAS: Increased to +12 mass, +1600 power, BT reduced by 25%
      - Rapid Fab: reduce cost to 1200/24000/3600 (2100/75000/9000) 
    - Cybran:
      - RAS: Increased to +12 mass, +1600 power, BT reduced by 25%
      - Stealth: reduce cost to 1000/37500/3000 (3000/112500/9000); reduce maintenance energy to 150 (500)
      - Cloak: reduce cost to 3000/200000/5400 (9000/1200000/18000); reduce maintenance energy to 1500 (6000)
      - SAM: Reduce build time by 67%; DPS matches regular SAM: 528 dps (167)
      - rapid fab: reduce cost to 1200/24000/3600 (2100/75000/9000)
      - Disintegrator Amplifier (doubles DPS): cost increased to 2000/90000/5000 (1000/45000/5000)
    - Seraphim:
      - overcharge: mass cost increased to 5000 (3500)
      - rapid fab: reduce cost to 1200/24000/3600 (2100/75000/9000)
  - SCUs can build T3 factories directly
* Modify Quantum Gateway (corresponding to other factory changes)
  - Build rate = 1200
  - set build time of SCU = 216000 [3:00]

>> ACU <<
* ACU engineering suite is by far the quickest route to T3
  - increase cost of T2 build suite to 900/22500/1200 from mass (720), 22500 energy (18000), and 1125 (900) time [2:00 from 1:30]
  - increase cost of T3 build suite to 3600 mass (2400), 75000 energy (50000), with same build time (6000).
  - Add T4 build suite
    - Cost: 8400/150000/27000 [5:00]
    - Increases BP to 120
    - Allows construction of experimentals
    - HP Increased by 8000; Increase regen to [base]+60
* Fix regen rates for ACU engineering upgrades:
  - T2: [base]+20
  - T3: [base]+40
  - T4: [base]+60
* Upgrades that compete with Engineering are pointless
  - move to other arm, and make the gun upgrades sequential
* ACU upgrades are really annoying when you have the T3 engineering upgrade
  - rebalance the big upgrade build times to assume the higher build rate 
  - reduce energy cost of defensive upgrades (cloak/shields)
* Optional: switch the stealh/cloak order of the Cybran ACU upgrades (like Vanilla?)
  (this would mean that you could hide in your base under a stealth field generator with only the first upgrade, but would
   still need both upgrades to hide outside your base)
  - at the very least, the first upgrade should provide some bonus HP instead of all the HP coming with the final upgrade
* Restoration field is imbalanced
  - Increased RF upgrade cost to 1200/27000/1200 (600/4500/600)
  - Increased RRF cost to 2400/81000/2400 (1500/31250/1250)

*********************
*** EXPERIMENTALS ***
*********************
* In general, experimentals are a bit too close to T3, which all but eliminates the T3 land game.
  - only SCUs can build experimentals
  - Moderate cost increases for many experimentals
    - Monkeylord, Chicken, Colossus +25%
    - Fatboy, Megalith, Ahwassa +10%
    - Soul Ripper, Atlantis: +0%
    - CZAR, Tempest: -5%
  - Double build time of all experimentals to offset the flexibility of not needing a factory and of being able to assist.
    (This lets a single SCU build a Monkeylord in 8:00)

* The Colossus is too good against T3 units, mostly because of the hugging.
  - Hugging ROF +50% (hugs less often)

* The Tempest
  - 150% increase in main gun ROF [6000 damage every 4 seconds instead of every 10 seconds; 1500 dps (from 600)]
  - 50% increase in torpedo DPS (352->528)
  - Increase HP to 55000 (35000)

* T3 static artillery is useless
  - ~15% decrease in cost for T3 static artillery
  - 30% increase in DPS of T3 static artillery
  - Reduce firing randomness by 50%
  - 1 T3 artillery should be able to take down unlayered shields (but this might already be true)
  - build time increased to approx. 75000 (30000)

* The Novax is useless
  - Crash damage reduced to 100
  - increase vision radius to 40 (10) [somewhat larger than weapon range, so it provides intel, 
    plus fewer issues with seeing when it is impacting shields]
  - increase dps to 300 (150)
  - Can target air units
  - increase max speed to 15 (10)
  - DPS is set such that the Novax can take down T2 shields, but not T3 shields (or, vs Cybran, can't take down the ED4 or ED5)

* Atlantis AA buff
  - Damage equivalent to 2 land-based SAMs: Missile damage now 520 (280)

*******************
*** GAME ENDERS ***
*******************

* The Salvation is way better than the Scathis or Mavor
  - Changes to the Salvation:
    - reclassify as an Experimental
    - cost increased to match Mavor
  - Changes to Mavor
    - decrease firing randomess to 0.16 (0.22)
    - projectile damage increased to 16000 (12000)
  - Changes to Scathis
    - projectile damage increased to 5000 (3000)

* The Paragon has *no business* being cheaper than the other game enders
  - Increase cost to 378k/11.3M/324k (250k/7.5M/125k)

*************************************
*** Ideas/Concerns for the Future ***
*************************************

* Crusiers are still too good against air?
  - reduction of AA dps from cruisers
* SCUs
  - are the OP in assault mode now? It may be necessary to increase the cost of the combat upgrades
* LMAO, nuke
  - Does the fact that the Yolona Oss has a lower mass cost than the other game enders matter? 
  - This is at least partly offset by the higher energy cost
* T3 Static artillery 
  - still not sure what constitutes a good balance here.
  - the imbalances among the races don't seem to be well distributed.
  - would continued mass+energy costs make these more balanced? Something like 1/2 of a SML? Probably reduce cost by another 10% after this.
  
********************
*** Balance Math ***
********************

+++++++++++++++++++
+++ ASF Balance +++
+++++++++++++++++++

An analogy: ASF:SAM as Titan:Ravager

ASF: 400 mass, 2450 hp, 400 dps (6.125 hp/mass)
Titan: 480 mass, 3400 hp, 166 dps (7.08 hp/mass)
Ravager: 1800 mass, range 70, 328 dps (5.48 mass/dps)
Triad: 540 mass, range 50, 123 dps    (4.39 mass/dps)
SAM: 1400 mass, range 60, 333 dps

A SAM kills an ASF in 7.35 seconds, or its cost in ASF in 25.72 seconds
An ASF kills an ASF in 6.125 seconds, or its cost in ASF in 6.125 seconds  <--- this is the problem

A Ravager kills a Titan in 10.36 seconds, or its cost in Titans in 38 seconds
A Titan kills a Titan in 20.48 seconds, or its cost in Titans in 20 seconds

TEST1: 10 ASF vs 3 SAMS should last 21 seconds. Real answer: approx. 35 seconds
TEST2: 10 ASF vs 20 swift winds (equal mass cost) -> ASF win with ~5 healthy fighters remaining
TEST3: 5 ASF vs 20 swift winds (double mass cost) -> SW win with 12 healthy fighters remaining
TEST4: 10 ASF vs 15 Janus (1.5 mass cost) -> 9 ASF remaining
TEST5: 10 ASF vs 20 Janus (2x mass cost) ->6 ASF remaining

Considerations:
* The fundamental issue is the fact that ASF are too effective, compared to *any other* AA solution
* If you double the cost of ASF, then things are more in line with the land game
* ASF should outperform SW in some way (the speed difference is a start), so maybe an increase to 800 mass, and double build time and energy cost as well
* Also increase the range of SAMs to 80, increase missile speed and TTL, and increase salvo damage to 1300 (2 salvos to kill an ASF)

+++++++++++++++++++++++++++++++
+++ Build Power & Factories +++
+++++++++++++++++++++++++++++++

Build Power issues:
* Factories should be the most efficient source of BP
* Kennels and Hives are too cool for their own good. But also really annoying to micro (e.g. their preference for helping SMD)
* SCU > T3 > T2 > T1 engineers for efficiency (SCU modulo the fact that it has other abilities)

Currently:
T1 eng:   5 bp for 52 mass  (10.4 mass/bp)
T2 eng:   10 bp for 160 mass (16)
T3 eng:   15 bp for 490 mass (32.6)
SCU:      60 bp for 9000 mass (150)
SCU++:    90 bp for 11100 mass (122)

Kennel 1: 25 bp for 550 mass (22)
Kennel 2: 50 bp for 1050 mass (21)

Hive 1: 20 bp for 450 mass (22.5)
Hive 2: 40 bp for 690 mass (17.3)
Hive 3: 60 bp for 930 mass (15.5)

T1 land:  20 bp for 240 mass (12)
T2 land:  40 bp for 1040 mass (26)
T3 land:  60 bp for 4190 mass (70)

T1 air:   20 bp for 210 mass (10.5)
T2 air:   40 bp for 840 mass (21)
T3 air:   60 bp for 3360 mass (56)

T1 naval: 20 bp for 300 mass (15)
T2 naval: 40 bp for 1470 mass (37)
T3 naval: 60 bp for 6870 mass (114)

Atlantis: 240 bp for 12000 mass (50)
CZAR: 180 bp for 45000 mass (250)
Tempest: 240 bp for 28000 mass (116)
Fatboy: 180 bp for 24600 mass (136)
Megalith: 180 bp for 33750 mass (187.5)
Aircraft Carriers:
Keefer Class: 150 bp for 4000 mass (26)
Command Class: 150 bp for 3600 mass (24)
Iavish: 150 bp for 4400 mass (29)

*** Proposed Revisions ***
T2 engineer: 10 bp for 130 mass (13)
T3 engineer: 20 bp for 320 mass (16)
SCU: 80 bp, upgrade to 120 for 1000 mass

- Each factory upgrade multiplies the build power by 2.5
- Build cost of higher tier units has been decreased by some factor
- Build cost of naval units has been decreased substantially

T1 land: Increase BP to 80;  BT of T1 x4*1.0 = 4
T2 land: Increase BP to 200; BT of T2 x5*0.85 = 4.25
T3 land: Increase BP to 500; BT of T3 x8.33*0.7 = 5.83

T1 air: Increase BP to 64;  BT of T1 x3.2*1.0 = 3.2
T2 air: Increase BP to 160; BT of T2 x4*0.85 = 3.4
T3 air: Increase BP to 400; BT of T3 x6.66*0.7 = 4.66

T1 naval: Increase BP to 144;  BT of T1 x7.2*0.7 = 5.76
T2 naval: Increase BP to 360; BT of T2 x9*0.5 = 4.5
T3 naval: Increase BP to 900; BT of T3 x15*0.35 = 5.25

Atlantis: 3*<T3air> 
CZAR: 3*<T3air>
Tempest: 3*<T3naval>
Fatboy: 3*<T3land>
Megalith: 3*<T3land>
Keefer Class (UAS0303): 1*<T3air>
Command Class (URS0303): 1*<T3air>
Iavish (XSS0303): 1*<T3air>

+++++++++++++++++++++++
+++ Static Defenses +++
+++++++++++++++++++++++

(1) Fixing T2 Static artillery

T1, T2 and T3 PD follow the following Magic Cost Formula: range^1.25 * DPS / (mass cost) = 37
We can make it true for T2 static artillery by increasing DPS by about 25% and decreasing cost by 25%

         range   dps    cost   R^1.25*D/C
AT1PD    26      167    250    39.2
AT2PD    50      150    528    37.8
Ravager  70      328    1800   36.9
AT2      128     143    2772   22.2
AT2++    128     180    2079   37.3 (splash 2)
ET2++    128     150    1890   34.2 (splash 3)
RT2++    128     125    1680   32.0 (splash 4)
ST2++    128     160    1995   34.5 (splash 3)

(2) Cybran and Seraphim T2 PD are underpowered. They are only effective against T1 units where the other T2 PD suffers from overkill problems.

(3) PD vs unit costs

- At T1, PD is very effective against tanks, but completely ineffective against MLA
- At T3, assault bots are more mass-effective than PD
- effectiveness of T1 PD at higher tiers is mostly irrelevant, since so many T2 and T3 units outrange it.
A few tests:

1 titan (mass cost: 480) kills a Triad (mass cost: 540) with 560/3400 hp remaining
1 titan (mass cost: 480) kills a Cerberus (mass cost: 540) with 1816/3400 hp remaining
1 titan (mass cost: 480) dies to 2 T1 PD (mass cost: 500) with 950/2600 hp remaining on the PD
1 brick (mass cost: 1280) kills 3 Triads (mass cost: 1620) with 810/9000 hp remaining
1 brick (mass cost: 1280) kills 5 T1 PD (mass cost: 1250) with 2750/9000 hp remaining (assuming it even bothers charging them, since it outranges the PD anyway)

+++++++++++++++++++++++++++++
+++ Assault Experimentals +++
+++++++++++++++++++++++++++++

Too many games are decided by who can get the first Experimental built. T3 land is completely overlooked in the vast majority of games. Some of the experimentals are even more efficient than T3 units, even ignoring the issues with build time and factory costs, which are severe.

for example:
T3 commander builds ML in 133 seconds.
The T2 and T3 engineering upgrades cost 720+2400 mass = 3120
Total cost: 19120 for the first monkeylord.
A T3 land factory costs 4190 mass. To build the 14 siege tanks (11760 mass) necessary to kill the monkeylord in 133 seconds, you would need 380 build power, or 320 + the T3 factory. This requires 64 T1 engineers (3328 mass), for a Total cost of 19278.
Also, this ignores roll-off time for factories, which makes things even worse.

- Increase cost of assault experimentals (Monkeylord, Chicken, Colossus) by 50%
- Probably a (smaller?) cost increase for the siege experimentals (fatboy, megalith)
- Increase build time by 100% (or more)
- Experimentals can only be built by SCU or ACU with T4 engineering upgrade
- Maybe increase costs further, but with commensurate increases to HP, to further separate T3 and T4 units

Compare with changes in Community Balance Patch: http://forums.gaspowered.com/viewtopic.php?t=29820
Blackops has the T4 engineering: http://forums.gaspowered.com/viewtopic.php?t=31172
(but I think their balance ideas are more than a bit off)

Counter-measure comparison:
  nuke launcher: 15000 mass + 12000/missile (5 minutes)
  nuke defense:  7500 mass + 3600/missile (4 minutes)

OTOH, T1 pd is quite effective against T1 land units: 1 pd (250 mass) kills 5 strikers (280 mass) with 724/1300 hp remaining

+++++++++++++++++++++++++
+++ Land Unit Balance +++
+++++++++++++++++++++++++

Tests at equal mass cost
T1 vs T3: 9 Thaam vs 1 Titan:    Titan wins with 1200/3400 hp
T1 vs T3: 9 Striker vs 1 Titan:  Titan wins with 1440/3400 hp
T1 vs T3: 9 Aurora vs 1 Titan:   Titan wins with 1300/3400 hp
T1 vs T3: 9 Mantis vs 1 Titan:   Titan wins with 1100/3400 hp

* The current T3 vs T1 balance is that T3 assault beats T1 assault by relatively small but consistent margin. I think this is fair.

+++++++++++++++
+++ Shields +++
+++++++++++++++

Standard FA values:
name        mass     hp      radius   energy    regen   recharge   rech.time (to full health)      
UEF T2:      600      9000   26       200       120     600        15
UEF T3:     3000     15000   44       400       131     652        23

Aeon T2:     480     11000   20       150       138     687        16
Aeon T3:    2400     18000   35       300       150     750        24

Cybran ED1   160      4000   18       100       45      222        18
Cybran ED2   460      7000   22       200       88      437        16
Cybran ED3  1260     10000   28       300       112     555        18
Cybran ED4  2460     13000   34       400       130     650        20
Cybran ED5  4860     14000   40       500       140     636        22

Seraphim T2  700     13000   28       250       153     764        17
Seraphim T3 3600     21000   46       500       168     840        25

Aeon mob.    144      5000   16       125       65      192        26
UEF mob.     120      4000   16       100       55      166        24
Ser Mob.     640     10000   20       300      133      222        45
UEF boat    1040      8000   120?     150       80      250        32

Cybran is too weak, Seraphim is massively OP. Did they even think about this?
Let's call UEF shields "balanced", and then each other race gets a tradeoff of some sort:

             HP      Area       Regen
   UEF       0        +           +
  Aeon       +        -           ++
 Cybran      -        +           ++
Seraphim     ++       ++          --

Other considerations:
- Regen rates on all shields increased 50%; Recharge times increased ~30%. This means that shields stay up longer against continual damage, but stay down somewhat longer once they fail.
- Everybody gets upgrade in place
- Cybran T3 engineer can build the ED5 directly for 2800 mass

Modified values:
name        mass     hp      radius   energy    regen   recharge   rech.time       
UEF T2:      600      9000   26       200       240     600        15
UEF T3:     3000     16000   44       400       400     720        22

Aeon T2:     480     11000   20       150       280     700        16
Aeon T3:    2400     19000   36       300       475     840        23

Cybran ED1   240      6000   20        75       240     461        13
Cybran ED2   500      8000   25       150       280     571        14
Cybran ED3   820     10000   30       225       320     666        15
Cybran ED4  1400     12000   36       300       400     750        16
Cybran ED5  2800     14000   42       375       475     823        17

Seraphim T2  700     13000   28       250       200     520        25
Seraphim T3 3600     21000   46       500       350     656        32

(no changes here except cost reduction of Seraphim mobile)
Aeon mob.    144      5000   16       125        65     192        26
UEF mob.     120      4000   16       100        55     166        24
Ser Mob.     450     10000   20       300       133     222        45
UEF boat    1040      8000   120?     150        80     250        32
