From: Alexander Kurz <akurz@blala.de>
Subject: Re: [PATCH] leds: leds-mc13783: Fix MC13892 keypad led access
Date: Sun, 9 Oct 2016 21:15:49 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1610092107280.19108@blala.de>
References: <1476020267-17178-1-git-send-email-akurz@blala.de> <1476034906.546043706@f136.i.mail.ru>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-598520180-644786759-1476040550=:19108"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vs81.iboxed.net ([185.82.85.146]:44766 "EHLO vs81.iboxed.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752148AbcJITUT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 9 Oct 2016 15:20:19 -0400
In-Reply-To: <1476034906.546043706@f136.i.mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---598520180-644786759-1476040550=:19108
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 9 Oct 2016, Alexander Shiyan wrote:

> >Воскресенье,  9 октября 2016, 16:37 +03:00 от Alexander Kurz <akurz@blala.de>:
> >
> >Fix the register access shift argument calculation introduced with
> >commit a59ce6584d56 ("leds: leds-mc13783: Add MC34708 LED support")
> >and re-enable access to the "keypad" led for MC13892 MFC devices.
> >
> >Signed-off-by: Alexander Kurz < akurz@blala.de >
> >---
> > drivers/leds/leds-mc13783.c | 5 +++--
> > 1 file changed, 3 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
> >index a2e4c17..2421cf10 100644
> >--- a/drivers/leds/leds-mc13783.c
> >+++ b/drivers/leds/leds-mc13783.c
> >@@ -84,8 +84,9 @@ static int mc13xxx_led_set(struct led_classdev *led_cdev,
> > case MC13892_LED_MD:
> > case MC13892_LED_AD:
> > case MC13892_LED_KP:
> >-reg = (led->id - MC13892_LED_MD) / 2;
> >-shift = 3 + (led->id - MC13892_LED_MD) * 12;
> >+off = led->id - MC13892_LED_MD;
> >+reg = off / 2;
> >+shift = 3 + (off - reg * 2) * 12;
> > break;
> > case MC13892_LED_R:
> > case MC13892_LED_G:
> 
> I am suspect the next caclulation is more readable:
> 
> reg = (led->id - MC13892_LED_MD) / 2;
> off = ((led->id - MC13892_LED_MD) % 2) * 12;
> shift = 3 +  off;
Probably yes, but it introduces different styles of calculating
basically the same data in this function (see some lines above and
below the patched lines / not visible in the patch context)
I just kept it to a uniform style.

---598520180-644786759-1476040550=:19108--
