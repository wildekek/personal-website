---
date: "2026-06-26"
draft: false
title: "Why is there smoke coming from the boiler room?"
---
*A case for taking your building's data back — and an argument that what you run at home belongs at work.*

Someone walks into my office and asks a simple question: *why is there smoke coming from the boiler room?*

It's a fair question, and on this day a strange one. It's a mild, sunny spring afternoon — the kind of day the heating should barely run at all. And the greenhouse in question is our [newly renovated climate greenhouse](https://www.at5.nl/nieuws/233132/gerenoveerde-hortus-botanicus-weer-open-voor-publiek), rebuilt from the ground up to run without gas in the first place. So why is a gas boiler firing? It should have a fast answer. It doesn't.

The temperature lives in the climate computer. The heat demand lives in the building management system. The gas and electricity that demand turns into lives in a third system. Whether the heat pump is even online lives in a fourth. To answer one plain question I open five programs, each built by an engineer for an engineer, and line up timestamps by hand. By the time I have an answer, the afternoon is gone.

The answer, when I finally get it, is almost banal: the heat pump had thrown a communication error and silently dropped offline, and the gas boiler did exactly what it was built to do — quietly pick up a load no one was watching. Nothing in the boiler's own system said why it was running. Nothing in the heat pump's own system mentioned the boiler. The cause only appears when you put *boiler firing* next to *heat pump offline* — two facts sitting in two systems that never talk to each other. Once you see them side by side, it's obvious. Seeing them side by side was the one thing none of our systems would let me do.

And notice what that question actually is: not an accusation, but a catch. A boiler firing on a sunny day is exactly the thing you want to find, because the alternative is gas quietly burning for days while everyone assumes the heat pump has it covered. You can't run a greenhouse without gas unless you can see the moments it slips — a fault, a silent fallback — and close them one at a time. The monitoring doesn't undermine the gas-free promise. It's what makes the promise keepable.

Let me say where this is happening. I look after the technology at [the Hortus Botanicus in Amsterdam](https://www.dehortus.nl) — a botanical garden founded in 1638, one of the oldest in the world, packed into a little over a hectare in the middle of the city. It's beautiful, and underneath the orchids it is also a serious building. Keeping tropical, subtropical, and desert collections alive in the Dutch climate means holding each greenhouse at conditions that don't exist outside: heat pumps, gas boilers, a thermal store, climate computers, several hundred sensors, all running day and night. A garden like this is a heavy industrial control problem wearing a very pretty coat.

{{< figure src="klimatenkas.png" caption="The Climate House dashboard in Home Assistant — desert, cape, and tropical zones with a live map of sensor locations." >}}

## This is not bad luck. It's a structure.

Here's the part that should bother you: the data already exists. We generate it every second. We paid for the sensors that produce it. None of it is missing.

We just don't control it. The vendor does.

Three things conspire here, and none of them are accidents. First, the data your building generates is owned, in practice, by whoever installed the system — handed back to you through a portal, a per-seat license, sometimes a charge per data point, on a platform you can't extend. Second, the systems are siloed by design, because interoperability was never in any single vendor's commercial interest. Third, the interfaces were built for a commissioning engineer, not for the botanist, the finance controller, or the director who actually has to decide something.

And it's drifting the wrong way, not the right way. Building controls are going the way of everything else: cloud portals you log into, capabilities moved behind subscription tiers, the standing risk that a product gets sunset and takes your history with it. The consumer world has a word for this slow decay of the things you depend on: enshittification. It is arriving in your business too.

The deepest version of the problem is the one I started with. Energy data sits in one system, building settings in another, and the question you actually care about — does *this* setting cause *that* cost — lives in the gap between them. No vendor sells you a product for that gap, because the gap spans two vendors. So nobody can cross-examine the building. Including you, who owns it.

{{< figure src="energy.png" caption="Energy distribution, gas consumption, and electricity usage — all in one place for the first time." >}}

## Why this is solvable now, when it wasn't five years ago

Three things changed at roughly the same time. Take them as three legs of one stool.

**The right.** Since 12 September 2025, the EU Data Act gives any business user of a connected product the right to demand the data that system generates, in machine-readable form, and to have it shared with a third party of your choosing. From September 2026, new equipment has to be built to hand that data over by default. Be precise about what this is and isn't: it's leverage, not a magic button. Your existing legacy box won't open up tomorrow, the rules carve out trade secrets, and enforcement is still being built out across member states. But the negotiating position has flipped. Your next procurement can *require* open, machine-readable access as a condition of purchase. Your current vendor now argues from a weaker chair. For the first time, the law is on the side of the person who generated the data.

**The landing zone.** A right to your data is worthless without somewhere to put it that you actually control. That place now exists and it's mature. I use Home Assistant — an open platform owned by a non-profit foundation that, by its own legal structure, cannot be bought or sold, built on three principles that read like a reply to everything above: your data is yours, no vendor lock-in, built to last. It runs in over two million homes and grew about a quarter in the last year alone. This is not a hobby project anymore.

If you already run it at home, you know exactly where this is going. You've felt the difference between data you own and data you rent. So here's my claim, and I'll own it plainly: Home Assistant was built for the home, nobody is currently building this for businesses, and the reasons you wanted it in your house map almost perfectly onto your workplace. That leap is mine, not the foundation's. I'm making it on purpose.

And understand the economics honestly, because "do it yourself, skip the consultants" is a half-truth that will burn you if you take it literally. You don't eliminate the spend. You *move* it — from rent you pay forever, plus an invoice every time you want a dashboard changed, to a capability you build once and keep. You still need capable people, or to grow them. What you stop doing is renting access to your own building.

**The interface.** This is the part that's genuinely new. With the Model Context Protocol, you can connect an AI assistant — we use Claude, but the protocol is open and works with any model you choose — to all that unified data, and anyone can ask the building a question in plain language and get an answer grounded in your own measurements. Not a chatbot bolted on for show. A new layer over the data, where the question "why is there smoke coming from the boiler room?" finally has somewhere to be typed.

{{< figure src="energiemix.png" caption="Heat pump electricity versus gas consumption, overlaid with outside temperature and solar irradiance." >}}

## "But then you depend on one clever person, and clever people leave"

This is the strongest argument against everything I've written, so let me meet it head-on. I am, in fact, leaving. If the honest answer to *what happens to this system when Willem goes?* is "it falls over," then I've accidentally argued *for* lock-in — because at least a vendor doesn't quit.

Here's why it holds up. The same plain-language interface that answers questions is the interface that *changes the system*. Take the plant we put on public display this week: a [Welwitschia](https://www.at5.nl/artikelen/238801/woestijnplant-die-eeuwen-oud-kan-worden-te-zien-in-speciale-kas-hortus-echt-geweldig) —

{{< figure src="welwitschia.webp" caption="The Welwitschia in its climate-controlled case at the Hortus." link="https://www.at5.nl/artikelen/238801/woestijnplant-die-eeuwen-oud-kan-worden-te-zien-in-speciale-kas-hortus-echt-geweldig" target="_blank" rel="noopener noreferrer" >}}

a desert oddity from the coast of Namibia that drinks sea fog, grows just two leaves, and can live a thousand years — installed in a purpose-built case where its temperature and humidity have to be held in a narrow band. It's the one greenhouse we have with no climate computer of its own, so it's watched by a single wireless sensor on its own dashboard page. That page exists because a colleague who needed it could bring it into being through Claude, in plain words, without waiting for me to build it.

{{< figure src="welwitschia-dashboard.png" caption="The Welwitschia dashboard — temperature and humidity tracked by a single wireless sensor, created through the AI assistant." >}}

The thing that normally strands you with a self-built system — only the author can safely touch it — is exactly what drops away, at the layer where change happens most: dashboards, automations, reading the logs to find why something broke.

Scope that claim honestly, or the people who know these tools will rightly call it. The application layer — what you see and adjust day to day — opens up to non-specialists. The infrastructure underneath — the server, the network, the boring boxes — still needs an owner. Plain language will not reboot a dead machine. So you make that bottom layer boring on purpose: standard hardware, documented, no bespoke cleverness. Where I've had to use a hack to keep something alive — and I have, there's a watchdog quietly papering over a flaky network adapter as I write this — I treat it as a debt to pay down, not a trophy. The goal is always to remove the fragile part, not to admire how well I've propped it up. The best part is no part. A system the institution owns has to be a system the institution can run without the person who built it. That's the test. Build for it.

## The quiet part, which is the whole point

Strip away the protocols and the regulation and here is what actually changes: plain language removes the skill toll on your own data.

The botanist who will never read a protocol object table asks *is the Victoria pond warm enough tonight?* The controller asks *what did it cost to heat the orangery last month?* Someone using a screen reader, someone whose first language isn't the one the software shipped in, someone who was never going to juggle five Windows programs — same door, same question, same plain words. Liberated data is worth nothing if reaching it still requires a manual and an engineering degree. The reason to do any of this is so that the people who need an answer can get one without going through me. Or through anyone.

## So fight for it

The pain is universal: every organization with a building generates an exhaust of data it technically owns and practically rents. The data is yours by physics, and now, increasingly, by law. The tools to hold it are mature and structurally can't sell you out. And the door is finally plain language, open to everyone in the building, not just the engineers.

If you already run Home Assistant at home: this week, point a test instance at exactly one system at work. Just one. Then ask it the question you've never been able to answer in a single place, and notice how it feels.

If you've never heard of any of this: don't start with software. Start with an inventory. List every system that holds data about your building, who controls it, and what it costs you to look at your own numbers. Then write to that vendor and ask — citing the Data Act — for machine-readable access to the data you generate. The reply you get back will tell you everything you need to know about who currently owns your building.

The smoke from the boiler room was never really the problem. The problem was that you couldn't ask what was causing it. That part is ending.
