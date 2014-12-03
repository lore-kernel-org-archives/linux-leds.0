From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] leds: leds-gpio: Fix multiple instances registration
 when 'label' property is absent
Date: Wed, 3 Dec 2014 21:28:16 -0200
Message-ID: <CAOMZO5AEk=oAF4vxNFgd01hZqE7JH30H71OAUeBdSPavELD4aw@mail.gmail.com>
References: <1417629453-25719-1-git-send-email-festevam@gmail.com>
	<CACxGe6srjVUAxXEahDMPGNYKn7O-TqoExwGrGkDE9bb1tiA-jA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:59314 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751391AbaLCX2S (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 3 Dec 2014 18:28:18 -0500
Received: by mail-la0-f44.google.com with SMTP id ge10so13552674lab.3
        for <linux-leds@vger.kernel.org>; Wed, 03 Dec 2014 15:28:17 -0800 (PST)
In-Reply-To: <CACxGe6srjVUAxXEahDMPGNYKn7O-TqoExwGrGkDE9bb1tiA-jA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Dec 3, 2014 at 9:17 PM, Grant Likely <grant.likely@linaro.org> wrote:
> On Wed, Dec 3, 2014 at 5:57 PM, Fabio Estevam <festevam@gmail.com> wrote:
>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>
>> Since commit a43f2cbbb009f96 ("leds: leds-gpio: Make use of device property
>> API") it is no longer possible to register multiple gpio leds without passing
>> the 'label' property.
>>
>> According to Documentation/devicetree/bindings/leds/common.txt:
>>
>> "Optional properties for child nodes:
>> - label : The label for this LED.  If omitted, the label is
>>   taken from the node name (excluding the unit address)."
>>
>> So retrieve the node name when the 'label' property is absent to keep the old
>> behaviour and fix this regression.
>>
>> Reported-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>
> Acked-by: Grant Likely <grant.likely@linaro.org>
>
> (Assuming that creating a fwnode_get_name() function turns out to be a
> non-starter.)

Thanks, Grant.

Maybe we should go with this v2 patch initially to fix the regression
and then we could consider introducing fwnode_get_name() in a future
patch.
