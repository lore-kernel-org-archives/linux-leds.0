From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 0/6] Move dell-led to drivers/platform/x86
Date: Thu, 16 Feb 2017 13:01:08 +0100
Message-ID: <20170216120108.GE1350@ozzy.nask.waw.pl>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170213112640.GA1188@ozzy.nask.waw.pl>
 <CAJ=jqua0W3fmoJFqqVgG2Eq=9E-4toXC0UyQH3TyxZiTtNsODw@mail.gmail.com>
 <20170215135455.GA2014@ozzy.nask.waw.pl>
 <CAJ=jquaJazMKRsKdq=tpPNq=CBtFPcau6SW3nr738v-zTXfC4g@mail.gmail.com>
 <20170216092747.GA1350@ozzy.nask.waw.pl>
 <CAJ=jqub6AwXBeAahmMguq_h4jTkDbxxEL9=T1aLPOOENMdeLcw@mail.gmail.com>
 <20170216113258.GD1350@ozzy.nask.waw.pl>
 <CAHp75Vd=kCrmhpOyUYOzuTiy89tqeTisWj7BQw8r2vvBmFebDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35657 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753530AbdBPMBN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Feb 2017 07:01:13 -0500
Received: by mail-lf0-f68.google.com with SMTP id v186so1287372lfa.2
        for <linux-leds@vger.kernel.org>; Thu, 16 Feb 2017 04:01:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAHp75Vd=kCrmhpOyUYOzuTiy89tqeTisWj7BQw8r2vvBmFebDw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Anthony Wong <anthony.wong@canonical.com>, Richard Purdie <rpurdie@rpsys.net>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> On Thu, Feb 16, 2017 at 1:32 PM, Michał Kępień <kernel@kempniu.pl> wrote:
> 
> > For maintainers' convenience, I am planning to submit a v3 with all the
> > tags supplied by everyone who reviewed this series and also some minor
> > coding style tweaks suggested along the way.
> 
> Thanks!
> I'm a bit busy right now, but I definitely will apply the series this week.

Not sure if I understand correctly, but this series was supposed to go
through the LED subsystem.  The cover letter said:

> As all patches except patch 3 in this series affect the LED subsystem,
> the series is based on linux-leds/for-4.11.

See also:

    https://www.spinics.net/lists/platform-driver-x86/msg10235.html
    https://www.spinics.net/lists/platform-driver-x86/msg10237.html
    https://www.spinics.net/lists/platform-driver-x86/msg10250.html
    https://www.spinics.net/lists/platform-driver-x86/msg10253.html

-- 
Best regards,
Michał Kępień
