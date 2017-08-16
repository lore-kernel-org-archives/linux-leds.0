From: Paulo Costa <me@paulo.costa.nom.br>
Subject: Re: [RFC] ledtrig-dither: A Poor man's adjustable LED brightness.
Date: Wed, 16 Aug 2017 00:55:04 -0300
Message-ID: <CADbEYbk5US=SDpwPV8SLNsZMwrYgktPcXRp8RjYpm9+6iC8HAA@mail.gmail.com>
References: <20170815213541.26985-1-me@paulo.costa.nom.br> <20170815223413.GA8886@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:34143 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751068AbdHPDzG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2017 23:55:06 -0400
Received: by mail-qk0-f176.google.com with SMTP id u139so14189967qka.1
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2017 20:55:06 -0700 (PDT)
In-Reply-To: <20170815223413.GA8886@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

> Hmm. Can we simply use blinking trigger to do that?

To some extent...

If you just want to have 50% brightness, set timeon=1, timeoff=1 and
you are done.

But, accurately seting the brightness to weird numbers is harder.
E.g., To get 37% brightness your only chance is to set timeon=37,
timeoff=63 (Or multiples of it).

The larger delay causes very visible flickering, which sucks.



This trigger uses error propagation to continously adjusts the delay,
getting a higher blink frequency and accurate average brightness.

E.g., For 37% it will alternate between 33% (timeon=1,timeoff=2) and
50% (timeon=1,timeoff=1)



Unfortunately, it doesn't really help when the brightness is near 0%
or near 100%.
E.g., for 1% brightness, this trigger it is equivalent to
timeon=1,timeoff=99 -- Flickering is very visible.
