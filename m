From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2] leds: leds-gpio: Fix multiple instances registration
 when 'label' property is absent
Date: Wed, 3 Dec 2014 15:59:52 -0800
Message-ID: <CAK5ve-+_q+DZzgkJNAiFK88+5jg6+Trh9ih7z5pEfdormjx_mQ@mail.gmail.com>
References: <1417629453-25719-1-git-send-email-festevam@gmail.com>
 <CACxGe6srjVUAxXEahDMPGNYKn7O-TqoExwGrGkDE9bb1tiA-jA@mail.gmail.com> <CAOMZO5AEk=oAF4vxNFgd01hZqE7JH30H71OAUeBdSPavELD4aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:48349 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752443AbaLDAAO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 19:00:14 -0500
Received: by mail-ig0-f173.google.com with SMTP id r2so17835251igi.0
        for <linux-leds@vger.kernel.org>; Wed, 03 Dec 2014 16:00:13 -0800 (PST)
In-Reply-To: <CAOMZO5AEk=oAF4vxNFgd01hZqE7JH30H71OAUeBdSPavELD4aw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Dec 3, 2014 at 3:28 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Wed, Dec 3, 2014 at 9:17 PM, Grant Likely <grant.likely@linaro.org> wrote:
>> On Wed, Dec 3, 2014 at 5:57 PM, Fabio Estevam <festevam@gmail.com> wrote:
>>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>>
>>> Since commit a43f2cbbb009f96 ("leds: leds-gpio: Make use of device property
>>> API") it is no longer possible to register multiple gpio leds without passing
>>> the 'label' property.
>>>
>>> According to Documentation/devicetree/bindings/leds/common.txt:
>>>
>>> "Optional properties for child nodes:
>>> - label : The label for this LED.  If omitted, the label is
>>>   taken from the node name (excluding the unit address)."
>>>
>>> So retrieve the node name when the 'label' property is absent to keep the old
>>> behaviour and fix this regression.
>>>
>>> Reported-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
>>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>>
>> Acked-by: Grant Likely <grant.likely@linaro.org>
>>
>> (Assuming that creating a fwnode_get_name() function turns out to be a
>> non-starter.)
>
> Thanks, Grant.
>
> Maybe we should go with this v2 patch initially to fix the regression
> and then we could consider introducing fwnode_get_name() in a future
> patch.

I think V1 just touches leds-gpio.c and might be easier to merge as a
good fix. And then you can provide a patch to introduce
fwnode_get_name().

Or you update your V2 patch to use fwnode_get_name() and try to merge
it as a fix.

-Bryan
