From: Alexander Kurz <akurz@blala.de>
Subject: Re: [PATCH] leds: leds-mc13783: Fix MC13892 keypad led access
Date: Mon, 10 Oct 2016 15:24:33 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1610101516430.24427@blala.de>
References: <CGME20161009134104eucas1p17d4028424741a2b6c758b268e50e6e12@eucas1p1.samsung.com> <1476020267-17178-1-git-send-email-akurz@blala.de> <fdbc8f96-3a9b-b87e-467d-5279353811d9@samsung.com> <alpine.DEB.2.00.1610101443040.24427@blala.de>
 <1d761a99-75d4-0092-3aa4-e878d5103908@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vs81.iboxed.net ([185.82.85.146]:44874 "EHLO vs81.iboxed.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752464AbcJJNaj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 Oct 2016 09:30:39 -0400
In-Reply-To: <1d761a99-75d4-0092-3aa4-e878d5103908@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Alexander Shiyan <shc_work@mail.ru>, Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org



On Mon, 10 Oct 2016, Jacek Anaszewski wrote:

> Hi Alexander,
> > > It should write value << 3 to the register 52.
> > > 
> > > According to the documentation [0] LEDKP0, LEDKP1 and LEDKP2
> > > are driven by bits 9,10 and 11 respectively. The calculations
> > > don't seem to be in line with that. Could you point what I
> > > am missing?
LEDKP0, LEDKP1 and LEDKP2 controlles the led current setting, but ...

> > > 
> > > [0] http://www.nxp.com/files/analog/doc/data_sheet/MC13892.pdf
> > 
> > The numbering mentioned in the DT documentation is used as offset
> > for the device specific struct mc13xxx_led_devtype.led_min
> > >                if (of_property_read_u32(child, "reg", &tmp))
> > >                        continue;
> > >                pdata->led[i].id = leds->devtype->led_min + tmp;
> > e.g. MC13892_LED_KP = MC13892_LED_MD + 2
> > 
> > Hope this clarifies your question,
> 
> Thanks but not entirely - what with the second part of question related
> to the register layout?
The LED brightness is controlled via the duty cycle bits allowing
64 brightness values, setting bits/registers like
LED  | reg | bits
-----+-----+------
main | 0   | 3..8
aux  | 0   | 15..20
kp   | 1   | 3..8
red  | 2   | 3..8
green| 2   | 15..20
blue | 3   | 3..8

hope to got your question right,
 cheers, Alexander
> 
> -- 
> Best regards,
> Jacek Anaszewski
> 
