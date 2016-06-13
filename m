From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Moving drivers/leds/dell-led.c to drivers/platform/x86
Date: Mon, 13 Jun 2016 15:49:42 +0200
Message-ID: <20160613134942.GA2824@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Bob Rodgers <Robert_Rodgers@dell.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi everyone,

Back in January [1], while working on the dell-smbios module, I
suggested that the code present in drivers/leds/dell-led.c could be
moved to drivers/platform/x86 for coherency.  I decided to revisit that
idea.

dell-led consists of two major parts:

  - the part handling an "Activity LED" present in Dell Latitude 2100
    netbooks, introduced in 72dcd8d; it registers a LED device and uses
    a special WMI interface to control its state,

  - the part exposing a "microphone mute LED interface", introduced in
    db6d8cc; this interface is used by sound/pci/hda/dell_wmi_helper.c;
    while the original implementation also used a WMI interface, it was
    changed to use dell-smbios in cf0d7ea and 0c41a08.

I believe both parts could (and should) be moved to drivers/platform/x8=
6
as drivers/platform/x86/dell-laptop.c already handles a bunch of LEDs
and drivers/leds/dell-led.c is the only dell-smbios user outside of
drivers/platform/x86.

My question to you, the maintainers of the relevant drivers and
subsystems, is whether you would like to see such a move happen.  I hav=
e
prepared a draft patch series which:

  - moves the "microphone mute LED interface" to dell-laptop.c,
    effectively causing sound/pci/hda/dell_wmi_helper.c to depend on
    CONFIG_DELL_LAPTOP instead of CONFIG_LEDS_DELL_NETBOOKS,

  - moves the "Activity LED" part to a new file, tentatively called
    drivers/platform/x86/dell-wmi-led.c.

Merging the "Activity LED" part with drivers/platform/x86/dell-wmi.c is
not really clean because dell-wmi handles a different GUID, which AFAIK
is not related in any way to the GUID used by dell-led.

So, before I spam *three* subsystem mailing lists with a bunch of
patches, I would love to hear from the maintainers of both drivers/leds
and drivers/platform/x86 whether there are any arguments against such a
move.  Meanwhile, I will keep polishing the patch series and if there i=
s
no strong disagreement from any party involved, I will post the series
next week or so, so that we can discuss code and not just ideas.

As a side note, if anyone reading this has access to a Dell device whic=
h
has an "Activity LED" and/or a "microphone mute LED" currently supporte=
d
by dell-led, I would love to hear from you as I do not have the hardwar=
e
needed to practically test the patch series I am working on.

Looking forward to hearing from you,

[1] https://www.spinics.net/lists/platform-driver-x86/msg08143.html

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
