From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2] leds: leds-gpio: Fix multiple instances registration
 when 'label' property is absent
Date: Wed, 3 Dec 2014 17:00:42 -0800
Message-ID: <CAK5ve-LZ7TGAHYPSBkdfngkqjo5gxc2QEcfqkv4-Lw47m7P4gw@mail.gmail.com>
References: <1417629453-25719-1-git-send-email-festevam@gmail.com>
 <CACxGe6srjVUAxXEahDMPGNYKn7O-TqoExwGrGkDE9bb1tiA-jA@mail.gmail.com>
 <CAOMZO5AEk=oAF4vxNFgd01hZqE7JH30H71OAUeBdSPavELD4aw@mail.gmail.com>
 <CAK5ve-+_q+DZzgkJNAiFK88+5jg6+Trh9ih7z5pEfdormjx_mQ@mail.gmail.com>
 <CAOMZO5ARRGzMUuOUPp8VJHuZP5Lh1Cf=xFZqih86RqUjPLQxFA@mail.gmail.com>
 <CAK5ve-LQs9jZCXS1fLWv0yg9oeax8RoMGW0nAJnRyxUdWCKi1A@mail.gmail.com> <CAOMZO5AbRfA6hAkS5Vx-u1iwqggWhUAr1fy-fX1QNhW3yzkMqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:44080 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752880AbaLDBBD (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 20:01:03 -0500
Received: by mail-ie0-f178.google.com with SMTP id tp5so14940531ieb.37
        for <linux-leds@vger.kernel.org>; Wed, 03 Dec 2014 17:01:03 -0800 (PST)
In-Reply-To: <CAOMZO5AbRfA6hAkS5Vx-u1iwqggWhUAr1fy-fX1QNhW3yzkMqw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Grant Likely <grant.likely@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Dec 3, 2014 at 4:50 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Wed, Dec 3, 2014 at 10:48 PM, Bryan Wu <cooloney@gmail.com> wrote:
>
>> I got it. Actually we are talking about the same patch in the email [PATCH v2].
>> So I agree to merge this fix firstly and then introduce a new fwnode_get_name().
>>
>> If it's OK, I will merge this patch with Grant's Ack.
>
> Excellent, thanks!

Oh, I just found PATCH "leds: leds-gpio: Make use of device property
API" is not in my tree. So probably Rafael should take it with my Ack
as well:

Acked-by: Bryan Wu <cooloney@gmail.com>

-Bryan
