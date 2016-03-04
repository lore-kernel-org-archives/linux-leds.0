From: Olof Johansson <olofj@chromium.org>
Subject: Re: [PATCH] leds: Add Chrome OS keyboard backlight LEDs driver
Date: Fri, 4 Mar 2016 11:22:48 -0800
Message-ID: <CALiw-2HRoRb+ZX3C90KCg2-ky9XcrDeuTh3dJeLvyp1ypJ8Vkw@mail.gmail.com>
References: <20160303234646.GA17641@dtor-ws>
	<56D95790.9080301@samsung.com>
	<20160304191936.GB17145@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:33677 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759954AbcCDTWt (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 4 Mar 2016 14:22:49 -0500
Received: by mail-qg0-f51.google.com with SMTP id t4so51443093qge.0
        for <linux-leds@vger.kernel.org>; Fri, 04 Mar 2016 11:22:49 -0800 (PST)
In-Reply-To: <20160304191936.GB17145@dtor-ws>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>, Simon Que <sque@chromium.org>, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org

2016-03-04 11:19 GMT-08:00 Dmitry Torokhov <dmitry.torokhov@gmail.com>:
>
> Hi Jacek,
>
> On Fri, Mar 04, 2016 at 10:38:24AM +0100, Jacek Anaszewski wrote:
> > Hi Dmitry,
> >
> > Thanks for the patch. There's already other pending version [1],
> > still to be decided where it should live.
> >
> > [1] http://comments.gmane.org/gmane.linux.leds/4523
>
> Yes, sorry, have not noticed it already being submitted while doing some
> spring cleaning.


Part of the reason for this is that discoverability of the patch was
low -- it was only ever sent on linux-leds and no other list.

Cc:ing lkml is useful since most of us are subscribed to it and a
quick search for patches will find it. In addition to the subsystem
list of course, since subsystem maintainers don't want to have to
monitor all of LKML for patches to their code.


-Olof
