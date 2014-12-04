From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2] leds: leds-gpio: Fix multiple instances registration
 when 'label' property is absent
Date: Wed, 3 Dec 2014 16:48:02 -0800
Message-ID: <CAK5ve-LQs9jZCXS1fLWv0yg9oeax8RoMGW0nAJnRyxUdWCKi1A@mail.gmail.com>
References: <1417629453-25719-1-git-send-email-festevam@gmail.com>
 <CACxGe6srjVUAxXEahDMPGNYKn7O-TqoExwGrGkDE9bb1tiA-jA@mail.gmail.com>
 <CAOMZO5AEk=oAF4vxNFgd01hZqE7JH30H71OAUeBdSPavELD4aw@mail.gmail.com>
 <CAK5ve-+_q+DZzgkJNAiFK88+5jg6+Trh9ih7z5pEfdormjx_mQ@mail.gmail.com> <CAOMZO5ARRGzMUuOUPp8VJHuZP5Lh1Cf=xFZqih86RqUjPLQxFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:33374 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752442AbaLDAsX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 19:48:23 -0500
Received: by mail-ig0-f174.google.com with SMTP id hn15so17854417igb.13
        for <linux-leds@vger.kernel.org>; Wed, 03 Dec 2014 16:48:23 -0800 (PST)
In-Reply-To: <CAOMZO5ARRGzMUuOUPp8VJHuZP5Lh1Cf=xFZqih86RqUjPLQxFA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Dec 3, 2014 at 4:12 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Bryan,
>
> On Wed, Dec 3, 2014 at 9:59 PM, Bryan Wu <cooloney@gmail.com> wrote:
>
>>> Maybe we should go with this v2 patch initially to fix the regression
>>> and then we could consider introducing fwnode_get_name() in a future
>>> patch.
>>
>> I think V1 just touches leds-gpio.c and might be easier to merge as a
>> good fix. And then you can provide a patch to introduce
>> fwnode_get_name().
>
> Yes, I agree.
>
> Just to make sure we are on the same page: there were two formal
> patches that I submitted:
>
> - v1: which did not take ACPI into account as pointed out by Grant
> - v2: The original one of this thread that does take ACPI into account
>
> Both of them only touch leds-gpio.c.
>
> The one that touches drivers/base/property.c was just a suggestion
> that I sent as a reply to v2. It was not a formal submission. I also
> don't know if such suggestion would work for ACPI, as ACPI is
> something I am not familiar with.
>
> It seems to me that you are calling my [PATCH v2] as v1 and the
> suggested approach that touches drivers/base/property.c as v2, so
> that's the confusion ;-). Sorry about that.
>
> Please let me know.

I got it. Actually we are talking about the same patch in the email [PATCH v2].
So I agree to merge this fix firstly and then introduce a new fwnode_get_name().

If it's OK, I will merge this patch with Grant's Ack.

Thanks,
-Bryan
