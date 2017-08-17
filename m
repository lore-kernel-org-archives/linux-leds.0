From: Paulo Costa <me@paulo.costa.nom.br>
Subject: Re: [RFC] ledtrig-dither: A Poor man's adjustable LED brightness.
Date: Thu, 17 Aug 2017 01:21:37 -0300
Message-ID: <CADbEYbkGYO7dSuMcK4SjtWch+2GjPL7axPuk7UHohWLCfkj61Q@mail.gmail.com>
References: <20170815213541.26985-1-me@paulo.costa.nom.br> <20170815223413.GA8886@amd>
 <CADbEYbk5US=SDpwPV8SLNsZMwrYgktPcXRp8RjYpm9+6iC8HAA@mail.gmail.com> <20170816223022.GA13540@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qt0-f170.google.com ([209.85.216.170]:36896 "EHLO
        mail-qt0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbdHQEVj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2017 00:21:39 -0400
Received: by mail-qt0-f170.google.com with SMTP id 16so31743286qtz.4
        for <linux-leds@vger.kernel.org>; Wed, 16 Aug 2017 21:21:38 -0700 (PDT)
In-Reply-To: <20170816223022.GA13540@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

> Hmm. You could do led=on, udelay(100), led=off. Do that 100 times a
> second, and I believe you'll get quite nice low levels.

I don't want to keep the CPU busy on a delay() just for blinking led,
even if only for a few micros.

> Now... nice hack. Probably can be improved. But is it suitable for
> mainline?

Thank you =)

It's a proof of concept for now, definitely not ready for mainline.

Instead of a LED trigger + wrapper LED entry, I think this should kick in
if we set 'myled/dither=1' or something like that.

Now, do you think it would be a nice addition / Should I put more work on it?

Thanks for looking into it
