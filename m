From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] leds: leds-gpio: Fix multiple instances registration
 when 'label' property is absent
Date: Wed, 3 Dec 2014 22:12:27 -0200
Message-ID: <CAOMZO5ARRGzMUuOUPp8VJHuZP5Lh1Cf=xFZqih86RqUjPLQxFA@mail.gmail.com>
References: <1417629453-25719-1-git-send-email-festevam@gmail.com>
	<CACxGe6srjVUAxXEahDMPGNYKn7O-TqoExwGrGkDE9bb1tiA-jA@mail.gmail.com>
	<CAOMZO5AEk=oAF4vxNFgd01hZqE7JH30H71OAUeBdSPavELD4aw@mail.gmail.com>
	<CAK5ve-+_q+DZzgkJNAiFK88+5jg6+Trh9ih7z5pEfdormjx_mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:63042 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbaLDAM2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 19:12:28 -0500
Received: by mail-lb0-f169.google.com with SMTP id p9so13256326lbv.0
        for <linux-leds@vger.kernel.org>; Wed, 03 Dec 2014 16:12:27 -0800 (PST)
In-Reply-To: <CAK5ve-+_q+DZzgkJNAiFK88+5jg6+Trh9ih7z5pEfdormjx_mQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

Hi Bryan,

On Wed, Dec 3, 2014 at 9:59 PM, Bryan Wu <cooloney@gmail.com> wrote:

>> Maybe we should go with this v2 patch initially to fix the regression
>> and then we could consider introducing fwnode_get_name() in a future
>> patch.
>
> I think V1 just touches leds-gpio.c and might be easier to merge as a
> good fix. And then you can provide a patch to introduce
> fwnode_get_name().

Yes, I agree.

Just to make sure we are on the same page: there were two formal
patches that I submitted:

- v1: which did not take ACPI into account as pointed out by Grant
- v2: The original one of this thread that does take ACPI into account

Both of them only touch leds-gpio.c.

The one that touches drivers/base/property.c was just a suggestion
that I sent as a reply to v2. It was not a formal submission. I also
don't know if such suggestion would work for ACPI, as ACPI is
something I am not familiar with.

It seems to me that you are calling my [PATCH v2] as v1 and the
suggested approach that touches drivers/base/property.c as v2, so
that's the confusion ;-). Sorry about that.

Please let me know.
