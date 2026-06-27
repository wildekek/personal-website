---
date: "2026-06-26"
draft: false
title: "Waarom komt er rook uit de stookruimte?"
---
*Een pleidooi om de data van je gebouw terug te nemen — en een argument dat wat je thuis draait ook op je werk thuishoort.*

Iemand loopt mijn kantoor binnen en stelt een simpele vraag: *waarom komt er rook uit de stookruimte?*

Het is een redelijke vraag, en op deze dag een vreemde. Het is een milde, zonnige lentemiddag — het soort dag waarop de verwarming nauwelijks zou moeten draaien. En de kas in kwestie is onze [pas gerenoveerde klimatenkas](https://www.at5.nl/nieuws/233132/gerenoveerde-hortus-botanicus-weer-open-voor-publiek), van de grond af herbouwd om juist zonder gas te draaien. Dus waarom staat er een gasketel te branden? Het zou een snel antwoord moeten hebben. Dat heeft het niet.

De temperatuur zit in de klimaatcomputer. De warmtevraag zit in het gebouwbeheersysteem. Het gas en de elektriciteit waar die vraag in wordt omgezet zitten in een derde systeem. Of de warmtepomp überhaupt online is, zit in een vierde. Om één simpele vraag te beantwoorden open ik vijf programma's, elk gebouwd door een techneut voor een techneut, en leg ik handmatig tijden naast elkaar. Tegen de tijd dat ik een antwoord heb, is de middag voorbij.

Het antwoord, als ik het eindelijk heb, is bijna banaal: de warmtepomp had een communicatiefout gegeven en was stilletjes offline gegaan, en de gasketel deed precies waarvoor hij gebouwd was — zonder ophef een last overnemen waar niemand naar keek. Niets in het systeem van de ketel zelf zei waarom hij draaide. Niets in het systeem van de warmtepomp noemde de ketel. De oorzaak verschijnt pas als je *ketel brandt* naast *warmtepomp offline* legt — twee feiten in twee systemen die nooit met elkaar praten. Als je ze naast elkaar ziet, is het duidelijk. Ze naast elkaar zien was het enige wat geen van onze systemen mij liet doen.

Deze vraag is geen beschuldiging maar een inzicht. Een ketel die brandt op een zonnige dag is precies wat je wíl vinden, want het alternatief is gas dat dagenlang stilletjes verbrandt terwijl iedereen aanneemt dat de warmtepomp het overneemt. Je kunt een kas niet zonder gas draaien tenzij je de momenten kunt zien waarop het misgaat — een storing, een stille terugval — en ze één voor één oplossen. De monitoring ondermijnt de gasvrije belofte niet. Het is wat de belofte houdbaar maakt.

Laat me zeggen waar dit speelt. Ik beheer de techniek bij [de Hortus Botanicus in Amsterdam](https://www.dehortus.nl) — een botanische tuin opgericht in 1638, een van de oudste ter wereld, gepropt op iets meer dan een hectare midden in de stad. Het is prachtig, en onder de orchideeën is het ook een serieus gebouw. Tropische, subtropische en woestijncollecties in leven houden in het Nederlandse klimaat betekent elke kas op condities houden die buiten niet bestaan: warmtepompen, gasketels, een warmteopslag, klimaatcomputers, enkele honderden sensoren, dag en nacht draaiend. Zo'n tuin is een zwaar industrieel regeltechnisch probleem in een heel mooi jasje.

{{< figure src="klimatenkas.png" caption="Het Klimatenkas-dashboard in Home Assistant — woestijn-, kaap- en tropische zones met een live kaart van sensorlocaties." >}}

## Dit is geen pech. Het is een structuur.

Dit is het deel dat je zou moeten storen: de data bestaat al. We genereren die elke seconde. We hebben betaald voor de sensoren die ze produceren. Er ontbreekt niets.

We hebben er alleen geen controle over. De leverancier wel.

Drie dingen werken hier samen, en geen ervan is toeval. Ten eerste: de data die je gebouw genereert is in de praktijk eigendom van degene die het systeem installeerde — teruggegeven via een portaal, een licentie per werkplek, soms een bedrag per datapunt, op een platform dat je niet kunt uitbreiden. Ten tweede: de systemen zijn by design gesilo'd, omdat interoperabiliteit nooit in het commerciële belang van een individuele leverancier lag. Ten derde: de interfaces zijn gebouwd voor een inbedrijfstellingsingenieur, niet voor de botanicus, de controller of de directeur die daadwerkelijk iets moet besluiten.

En het drijft de verkeerde kant op, niet de goede. Gebouwbeheer gaat dezelfde weg als al het andere: cloudportalen waar je inlogt, functionaliteit achter abonnementsniveaus, het permanente risico dat een product wordt opgeheven en je geschiedenis meeneemt. De consumentenwereld heeft een woord voor dit langzame verval van de dingen waarvan je afhankelijk bent: enshittification. Het komt ook bij jouw bedrijf aan.

De diepste versie van het probleem is waar ik mee begon. Energiedata zit in het ene systeem, gebouwinstellingen in het andere, en de vraag waar je écht om geeft — veroorzaakt *deze* instelling *die* kosten — leeft in de ruimte ertussen. Geen leverancier verkoopt je een product voor die ruimte, want die overspant twee leveranciers. Dus niemand kan het gebouw kruisverhoren. Inclusief jij, die het bezit.

{{< figure src="energy.png" caption="Energiedistributie, gasverbruik en elektriciteitsverbruik — voor het eerst alles op één plek." >}}

## Waarom dit nu oplosbaar is, en vijf jaar geleden niet

Drie dingen veranderden op ongeveer hetzelfde moment. Zie ze als drie poten van één kruk.

**Het recht.** Sinds 12 september 2025 geeft de EU Data Act elke zakelijke gebruiker van een verbonden product het recht om de data op te eisen die dat systeem genereert, in machineleesbare vorm, en die te laten delen met een derde partij naar keuze. Vanaf september 2026 moet nieuwe apparatuur gebouwd zijn om die data standaard over te dragen. Wees precies over wat dit wel en niet is: het is een hefboom, geen toverstaf. Je bestaande legacy-apparaat gaat niet morgen open, de regels sluiten bedrijfsgeheimen uit, en handhaving wordt nog opgebouwd in de lidstaten. Maar de onderhandelingspositie is omgedraaid. Je volgende aanschaf kan open, machineleesbare toegang *eisen* als voorwaarde. Je huidige leverancier argumenteert nu vanuit een zwakkere stoel. Voor het eerst staat de wet aan de kant van de persoon die de data genereerde.

**De landingszone.** Een recht op je data is waardeloos zonder een plek om die neer te zetten die je daadwerkelijk beheert. Die plek bestaat nu en is volwassen. Ik gebruik Home Assistant — een open platform in eigendom van een non-profitstichting die, door haar eigen juridische structuur, niet gekocht of verkocht kan worden, gebouwd op drie principes die lezen als een antwoord op alles hierboven: je data is van jou, geen vendor lock-in, gebouwd om te blijven. Het draait in meer dan twee miljoen huishoudens en groeide het afgelopen jaar met ongeveer een kwart. Dit is geen hobbyproject meer.

Als je het thuis al draait, weet je precies waar dit heen gaat. Je hebt het verschil gevoeld tussen data die je bezit en data die je huurt. Dus hier is mijn stelling, en ik sta er vierkant achter: Home Assistant is gebouwd voor thuis, niemand bouwt dit momenteel voor bedrijven, en de redenen waarom je het thuis wilde komen bijna perfect overeen met je werkplek. Die sprong is van mij, niet van de stichting. Ik maak hem bewust.

En begrijp de economie eerlijk, want "doe het zelf, sla de consultants over" is een halve waarheid die je brandt als je hem letterlijk neemt. Je elimineert de uitgaven niet. Je *verplaatst* ze — van huur die je eeuwig betaalt, plus een factuur elke keer dat je een dashboard wilt aanpassen, naar een capaciteit die je eenmaal opbouwt en houdt. Je hebt nog steeds capabele mensen nodig, of je moet ze laten groeien. Wat je stopt met doen is huur betalen voor toegang tot je eigen gebouw.

**De interface.** Dit is het deel dat echt nieuw is. Met het Model Context Protocol kun je een AI-assistent — wij gebruiken Claude, maar het protocol is open en werkt met elk model dat je kiest — aan al die gebundelde data koppelen, en iedereen kan het gebouw een vraag stellen in gewone taal en een antwoord krijgen dat geworteld is in je eigen metingen. Geen chatbot die er voor de show bij hangt. Een nieuwe laag over de data, waar de vraag "waarom komt er rook uit de stookruimte?" eindelijk ergens ingetypt kan worden.

{{< figure src="energiemix.png" caption="Elektriciteitsverbruik warmtepomp versus gasverbruik, met buitentemperatuur en zoninstralingsgegevens." >}}

## "Maar dan ben je afhankelijk van één slim persoon, en slimme mensen vertrekken"

Dit is het sterkste argument tegen alles wat ik geschreven heb, dus laat me het recht in de ogen kijken. Ik vertrek namelijk. Als het eerlijke antwoord op *wat gebeurt er met dit systeem als Willem weggaat?* is "het valt om," dan heb ik per ongeluk *voor* lock-in gepleit — want een leverancier neemt tenminste geen ontslag.

Dit is waarom het standhoudt. Dezelfde interface in gewone taal die vragen beantwoordt is de interface die *het systeem aanpast*. Neem de plant die we deze week in de publieke opstelling hebben gezet: een [Welwitschia](https://www.at5.nl/artikelen/238801/woestijnplant-die-eeuwen-oud-kan-worden-te-zien-in-speciale-kas-hortus-echt-geweldig) —

{{< figure src="welwitschia.webp" caption="De Welwitschia in zijn klimaatgeregelde vitrine in de Hortus." link="https://www.at5.nl/artikelen/238801/woestijnplant-die-eeuwen-oud-kan-worden-te-zien-in-speciale-kas-hortus-echt-geweldig" target="_blank" rel="noopener noreferrer" >}}

een woestijnkuriositeit van de kust van Namibië die zeemist drinkt, slechts twee bladeren groeit, en duizend jaar kan worden — geïnstalleerd in een speciaal gebouwde vitrine waar de temperatuur en luchtvochtigheid in een smalle band gehouden moeten worden. Het is de enige kas die we hebben zonder eigen klimaatcomputer, dus wordt hij bewaakt door een enkele draadloze sensor op zijn eigen dashboardpagina. Die pagina bestaat omdat een collega die hem nodig had, hem tot leven kon brengen via Claude, in gewone woorden, zonder op mij te hoeven wachten.

{{< figure src="welwitschia-dashboard.png" caption="Het Welwitschia-dashboard — temperatuur en luchtvochtigheid bijgehouden door een enkele draadloze sensor, aangemaakt via de AI-assistent." >}}

Het ding dat je normaal strandt met een zelfgebouwd systeem — alleen de maker kan er veilig aan komen — is precies wat wegvalt, op de laag waar verandering het vaakst plaatsvindt: dashboards, automatiseringen, de logs lezen om te vinden waarom iets kapotging.

Begrens die claim eerlijk, of de mensen die deze tools kennen zullen het terecht aankaarten. De applicatielaag — wat je elke dag ziet en aanpast — gaat open voor niet-specialisten. De infrastructuur eronder — de server, het netwerk, de saaie kastjes — heeft nog steeds een eigenaar nodig. Gewone taal start geen dode machine opnieuw op. Dus maak je die onderste laag expres saai: standaardhardware, gedocumenteerd, geen maatwerk-slimmigheden. Waar ik een hack heb moeten gebruiken om iets draaiend te houden — en dat heb ik, er draait op dit moment een watchdog die stilletjes een haperende netwerkadapter papt — beschouw ik dat als een schuld om af te lossen, niet als een trofee. Het doel is altijd het fragiele onderdeel te verwijderen, niet te bewonderen hoe goed je het overeind hebt gehouden. Het beste onderdeel is geen onderdeel. Een systeem dat de instelling bezit moet een systeem zijn dat de instelling kan draaien zonder de persoon die het bouwde. Dat is de test. Bouw ervoor.

## Het stille deel, dat het hele punt is

Schrap de protocollen en de regelgeving en dit is wat er daadwerkelijk verandert: gewone taal haalt de vaardigheidstol weg van je eigen data.

De botanicus die nooit een protocol-objecttabel zal lezen vraagt *is de Victoriavijver warm genoeg vanavond?* De controller vraagt *wat kostte het om de oranjerie vorige maand te verwarmen?* Iemand die een schermlezer gebruikt, iemand wiens eerste taal niet de taal is waarin de software is geleverd, iemand die nooit vijf Windows-programma's ging jongleren — dezelfde deur, dezelfde vraag, dezelfde gewone woorden. Bevrijde data is niets waard als het bereiken ervan nog steeds een handleiding en een ingenieursdiploma vereist. De reden om dit allemaal te doen is dat de mensen die een antwoord nodig hebben er een kunnen krijgen zonder via mij te gaan. Of via wie dan ook.

## Dus vecht ervoor

De pijn is universeel: elke organisatie met een gebouw produceert een uitstoot van data die ze technisch bezit en praktisch huurt. De data is van jou door de natuurkunde, en nu, in toenemende mate, door de wet. De tools om het vast te houden zijn volwassen en kunnen je structureel niet uitverkopen. En de deur is eindelijk gewone taal, open voor iedereen in het gebouw, niet alleen de ingenieurs.

Als je Home Assistant al thuis draait: richt deze week een testinstantie op precies één systeem op het werk. Eentje maar. Stel dan de vraag die je nooit op één plek hebt kunnen beantwoorden, en merk op hoe het voelt.

Als je hier nog nooit van gehoord hebt: begin niet met software. Begin met een inventarisatie. Maak een lijst van elk systeem dat data over je gebouw bevat, wie het beheert, en wat het je kost om naar je eigen cijfers te kijken. Schrijf dan naar die leverancier en vraag — onder verwijzing naar de Data Act — om machineleesbare toegang tot de data die je genereert. Het antwoord dat je terugkrijgt vertelt je alles wat je moet weten over wie op dit moment je gebouw bezit.

De rook uit de stookruimte was nooit echt het probleem. Het probleem was dat je niet kon vragen wat de oorzaak was. Dat deel loopt ten einde.
