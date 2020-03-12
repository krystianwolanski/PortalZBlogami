-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Cze 2019, 10:18
-- Wersja serwera: 10.1.28-MariaDB
-- Wersja PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `blogi`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `login`, `password`) VALUES
(1, 'kamil', '1234'),
(2, 'jacek', 'haslo123'),
(3, 'marek', 'tajnehaslo'),
(4, 'Draug', 'haslo321'),
(5, 'Tomasz Kopyra', 'kopyr'),
(6, 'Maciej Stafiej', 'herbata'),
(7, 'naEkranie', 'naekranie'),
(9, 'Marcin Wesolowski', 'marcin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wpisy`
--

CREATE TABLE `wpisy` (
  `id` int(11) NOT NULL,
  `tytul` varchar(120) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `image_path` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file_tresc_path` varchar(200) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wpisy`
--

INSERT INTO `wpisy` (`id`, `tytul`, `opis`, `tresc`, `image_path`, `id_user`, `date`, `file_tresc_path`) VALUES
(58, 'Podziemny świat Kopalni Soli', 'Kopalnia Soli ,,Wieliczka” to jeden z najbardziej popularnych obiektów turystycznych w Polsce, odwiedzany rocznie przez blisko dwa miliony osób. Nie wiem jak to możliwe, że tak dużo podróżując jeszcze nigdy tam nie byłem!', ' ', 'img/5ce3d7395f2322.06297775.jpg', 1, '2019-05-21 10:47:21', ''),
(59, 'Historia jRPG, część pierwsza czyli Dragon Quest', 'Japońskie RPG, pomimo, że lata swojej świetności mają już za sobą, kiedyś były bardzo popularne. Nie można zaprzeczyć, że odmieniły już na zawsze wizerunek gier. Jak to się wszystko zaczęło? Jak wyglądał pierwszy jRPG w historii? Kto go stworzył? Zapraszam do lektury!', ' ', 'img/5ce3d85235e5a6.85138659.jpg', 2, '2019-05-21 10:52:02', ''),
(60, '„Most”. Największa operacja służb specjalnych w historii świata', 'Przez dwa lata polskie służby specjalne prowadziły tajną operację, której skala, zasięg i stopień niebezpieczeństwa nie miały precedensu. Mimo tych trudności akcja zakończyła się pełnym sukcesem. Czego dotyczyła i jak doszło do tego, że to właśnie nam ją powierzono?', ' ', 'img/5ce6be7d1ee218.38996674.jpg', 1, '2019-05-23 15:38:37', ''),
(61, 'Bezimienny vs Geralt – konfrontacja nad kuflem piwa', 'W lewym narożniku Geralt z Rivii, wiedźmin, profesjonalny zabójca potworów. W prawym Bezimienny, wybraniec bogów, pogromca smoków i król Myrtany. Myślicie, że to ring, że arena? A nie lepsze byłyby narożniki karczmy i konfrontacja nad kuflem piwa?\r\n\r\nŹródło: https://www.gry-online.pl/S018.asp?ID=1977', ' ', 'img/5ce6bfdf7d0fd0.74689740.jpg', 4, '2019-05-23 15:44:31', ''),
(62, 'Cornus Lupus i Terra Donum z Browaru Kormoran', 'Cornus Lupus, czyli długo warzony porter bałtycki z dodatkiem owocu derenia oraz Terra Donum, czyli Braggot z kawą zbożową i owocem czarnego bzu. Czy dorównają kultowemu Imperium Prunum?', ' ', 'img/5ce6c8433e9aa0.25668477.jpg', 5, '2019-05-23 16:20:19', ''),
(64, 'Czarnobyl – recenzja miniserialu', 'HBO i Sky stworzyło serial opisujący to, co wydarzyło się 33 lata temu w Czarnobylu. Czy udało im się w należyty sposób pokazać dramat tamtych wydarzeń? Przeczytajcie naszą recenzję.', ' ', 'img/5ce6d7e42a3f55.94464086.jpg', 7, '2019-05-23 17:27:00', ''),
(66, 'Amman. Przewodnik i atrakcje stolicy Jordanii', 'Turystyczną opowieść o Jordanii można by rozpocząć w jakimkolwiek miejscu, tylko nie w jej stolicy – Ammanie. Ciągle ignorowana i niedoceniana przez podróżujących na Bliski Wschód, kusi jednak swoją pięknie brzmiącą nazwą. Przy tym zmusza do odpowiedzi na proste pytanie – czy to prawda, że tam absolutnie nic nie ma?', ' ', 'img/5ce6ddeb6375c8.11421636.jpg', 9, '2019-05-23 17:52:43', ''),
(111, 'Herbata ekspresowa a herbata liściasta – porównanie', 'Gdyby skupić się na ocenie herbaty liściastej oraz ekspresowej i porównać je jedynie na podstawie tego co widzimy – ten wpis mógłbym zakończyć po pierwszym akapicie. Nie trzeba przecież być koneserem, aby znaleźć kluczowe różnice. Wokół tematu narosło mnóstwo mitów, pytań i wątpliwości, dlatego w tym wpisie postaram się pokazać kilka podstawowych różnic pomiędzy saszetkami, a całymi liśćmi, z których robimy napar herbaciany.', '<h2>Herbata ekspresowa</h2><p>Najpopularniejsza herbata, kt&oacute;ra dostępna jest niemal w każdym sklepie spożywczym na całym świecie. Jak sama nazwa m&oacute;wi, herbata ekspresowa jest produktem, kt&oacute;ry w bardzo kr&oacute;tkim czasie jest gotowy do spożycia. Liście herbaty znajdujące się w saszetce to zazwyczaj pył, powstały przy produkcji herbaty łamanej, choć wielu producent&oacute;w, sprzedających sw&oacute;j produkt na rynek masowy, decyduje się na produkcję tylko i wyłącznie herbaty typu dust (pyłu właśnie). Taka herbata pakowana jest w torebki &ndash; saszetki ze sznurkiem, okrągłe (bez sznurka) i piramidki, wykonane z delikatnego papieru, bądź nylonu.</p><p>Jak ją parzyć? Wrzucamy saszetkę herbaty do filiżanki lub kubka, zalewamy wodą o odpowiedniej temperaturze, a po kr&oacute;tkim parzeniu &ndash; wyciągamy i wyrzucamy torebkę.</p><h2>Herbata liściasta</h2><p>Inaczej &ndash; <a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://kursnaherbate.pl/herbata-podstawowe-informacje/\">herbata</a> sypana. To zazwyczaj całe, łamane, lub zrolowane liście Camelii Sinensis, kt&oacute;re po odpowiedniej obr&oacute;bce są pakowane, a następnie wysyłane do odbiorc&oacute;w. Podobnie jak w przypadku herbaty ekspresowej, są niemalże od razu gotowe do zaparzenia. Herbata liściasta to klasyczna forma suszu. Bardzo popularna, ale przez fakt, iż jej zaparzenie nie jest aż tak banalne jak w przypadku herbaty w saszetkach &ndash; kupowana rzadziej. Na rynku znajdziemy całą gamę herbat liściastych &ndash; lepszych i gorszych. Z r&oacute;żnych rejon&oacute;w świata, w r&oacute;żnych konfiguracjach.</p><h2>Czym zatem r&oacute;żnią się te herbaty?</h2><ul><li>Wyglądem. Celowo chciałbym pominąć tutaj aspekt saszetki bądź jej braku. Gdy por&oacute;wnany ze sobą liście herbaty ekspresowej i sypanej &ndash; zobaczymy r&oacute;żnicę przede wszystkim w ich wielkości. Herbata saszetkowa to zazwyczaj drobno zmielone liście &ndash; herbata liściasta &ndash; całe spektrum, kt&oacute;re daje nam roślina (od pączka, przez drugi i trzeci, aż po czwarty czy nawet czasami piąty liść).</li><li>Jakością (choć nie zawsze). Niestety, herbaty ekspresowe to zazwyczaj mieszanki, lub zwyczajnie gorszej jakości liście. Nie wyklucza to jednak sytuacji, że spotkamy się z gorszą jakością herbat sypanych &ndash; te r&oacute;wnież bywają niesamowicie podłe w smaku. Jest jednak dużo większa szansa, że wybierając herbatę liściastą, kupimy lepszy produkt.</li><li>Profilem smakowym. Herbaty liściaste w zależności od tego jak się je zaparzy, dają nam otwarte pole do poznawania smak&oacute;w i aromat&oacute;w w nich zawartych. Często jedna herbata liściasta, zaparzona w nieco inny spos&oacute;b, może smakować inaczej. Jeśli chodzi zaś o popularne &sbquo;saszetki&rsquo; &ndash; tutaj pole manewru jest ograniczone. Herbaty tego typu są niemalże zawsze takie same, nie możemy z nich zbyt wiele &bdquo;wycisnąć&rdquo;.</li><li>Stylem parzenia. Podobnie jak w profilu smakowym &ndash; herbata liściasta daje się zaparzyć na wiele r&oacute;żnych sposob&oacute;w, a przede wszystkim w stylu Gong Fu Cha, czyli stylu wschodnim, dającym lepsze napary. W ekspres&oacute;wkach &ndash; jest to niemalże nie do zrobienia, lub pozbawione jest sensu.</li><li>Rozwijaniem się liści. Saszetka przede wszystkim blokuje możliwość rozwinięcia się liści (jeśli są większe niż tzw. &bdquo;dust&rdquo;) &ndash; same liście ograniczeń nie mają, więc przy każdym parzeniu możemy wydobywać z nich coraz więcej. Tak naprawdę ogranicza nas tylko naczynie&hellip;</li><li>Cena. To jest dość oczywiste. Jeszcze chyba nie spotkałem się z herbatą w saszetkach droższą od herbaty liściastej (por&oacute;wnując gramaturę).</li></ul><h3>Zalety herbaty ekspresowej</h3><ul><li>Jest stosunkowo tania;</li><li>Zdarza się, że jakość herbaty zawartej w torebkach jest bardzo wysoka;</li><li>Łatwa do zaparzenia;</li><li>Łatwa w sprzątaniu (po prostu wyrzucamy torebkę);</li><li>Zawsze możemy spodziewać się tego samego smaku i aromatu &ndash; jeśli nie lubimy zmian;</li><li>Ogromna dostępność. Możemy ją kupić niemalże w każdym sklepie.</li></ul><h3>Wady herbaty ekspresowej</h3><ul><li>Niestety jakość niemal za każdym razem budzi wątpliwości;</li><li>Nie daje się zaparzyć w stylu wschodnim;</li><li>Płaski smak i aromat, kt&oacute;ry nie pozwala cieszyć się w pełni herbatą;</li><li>Bardzo często zawiera niskiej jakości dodatki (w tym aromaty);</li><li>Parząc herbatę w saszetce, zaparzamy r&oacute;wnież samą saszetkę, kt&oacute;ra zawsze będzie wpływać na smak i og&oacute;lne postrzeganie naparu (nie wspominając o tym, że zaparzanie tego materiału może być szkodliwe);</li><li>Nie jesteśmy w stanie ocenić jakości liści po ich wyglądzie.</li></ul><h3>Zalety herbaty liściastej</h3><ul><li>Ogromna gama smak&oacute;w i aromat&oacute;w &ndash; w zależności od tego jak zaparzymy herbatę;</li><li>Jakość&nbsp; i możliwość oceny liści po ich wyglądzie. Nie każda herbata liściasta jest wysokiej jakości &ndash; ale prawdopodobieństwo, że kupimy beznadziejny produkt jest mniejsze niż w przypadku herbaty ekspresowej;</li><li>Dowolność w kwestii ilości liści, kt&oacute;re parzymy;</li><li>Możliwość parzenia w stylu gong fu cha.</li></ul><h3>Wady herbaty liściastej</h3><ul><li>Parzenie herbaty liściastej bywa uciążliwe (szczeg&oacute;lnie jak nie posiadamy specjalnych naczyń);</li><li>Cena &ndash; dobre herbaty bywają bardzo drogie;</li></ul><h2>Podsumowanie</h2><p>Powyższe por&oacute;wnanie, starałem się robić możliwie jak najbardziej obiektywnie, gdyż panuje og&oacute;lne przekonanie, iż herbaty ekspresowe są złe. Osobiście staram się ich unikać, ale nie oceniam, gdy ktoś preferuje tę formę. Każda z nich ma oczywiście swoje wady i zalety &ndash; jeśli stawiamy na jakość i świadomość konsumencką, powinniśmy zdawać sobie z nich sprawę. Z dwojga złego, wolę sytuację, w kt&oacute;rej konsument świadomie decyduje się na zaparzenie herbaty ekspresowej, niż bezrefleksyjnie zaparza &bdquo;saszetę&rdquo;, bo przecież nie widać r&oacute;żnicy&hellip;</p>', 'img/5cf299528b4f05.94812932.jpg', 6, '2019-06-01 15:27:14', 'wpisy/5cf299528b7567.84155707.php');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wpisy`
--
ALTER TABLE `wpisy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wpisy_ibfk_1` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `wpisy`
--
ALTER TABLE `wpisy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `wpisy`
--
ALTER TABLE `wpisy`
  ADD CONSTRAINT `wpisy_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `uzytkownicy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
