From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] leds: leds-gpio: Fix multiple instances registration
 when 'label' property is absent
Date: Wed, 3 Dec 2014 22:50:22 -0200
Message-ID: <CAOMZO5AbRfA6hAkS5Vx-u1iwqggWhUAr1fy-fX1QNhW3yzkMqw@mail.gmail.com>
References: <1417629453-25719-1-git-send-email-festevam@gmail.com>
	<CACxGe6srjVUAxXEahDMPGNYKn7O-TqoExwGrGkDE9bb1tiA-jA@mail.gmail.com>
	<CAOMZO5AEk=oAF4vxNFgd01hZqE7JH30H71OAUeBdSPavELD4aw@mail.gmail.com>
	<CAK5ve-+_q+DZzgkJNAiFK88+5jg6+Trh9ih7z5pEfdormjx_mQ@mail.gmail.com>
	<CAOMZO5ARRGzMUuOUPp8VJHuZP5Lh1Cf=xFZqih86RqUjPLQxFA@mail.gmail.com>
	<CAK5ve-LQs9jZCXS1fLWv0yg9oeax8RoMGW0nAJnRyxUdWCKi1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:42283 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124AbaLDAuY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 19:50:24 -0500
Received: by mail-la0-f49.google.com with SMTP id hs14so13023592lab.8
        for <linux-leds@vger.kernel.org>; Wed, 03 Dec 2014 16:50:22 -0800 (PST)
In-Reply-To: <CAK5ve-LQs9jZCXS1fLWv0yg9oeax8RoMGW0nAJnRyxUdWCKi1A@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Dec 3, 2014 at 10:48 PM, Bryan Wu <cooloney@gmail.com> wrote:

> I got it. Actually we are talking about the same patch in the email [PATCH v2].
> So I agree to merge this fix firstly and then introduce a new fwnode_get_name().
>
> If it's OK, I will merge this patch with Grant's Ack.

Excellent, thanks!
