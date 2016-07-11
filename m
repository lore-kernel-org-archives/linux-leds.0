From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] leds: leds-gpio: Set of_node for created LED devices
Date: Mon, 11 Jul 2016 10:23:15 +0200
Message-ID: <57835773.9070907@gmail.com>
References: <1467982420-15718-1-git-send-email-zajec5@gmail.com>
 <57834C06.4020506@samsung.com> <57835036.2090902@gmail.com>
 <578356BD.8000309@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36454 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757898AbcGKIXT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 Jul 2016 04:23:19 -0400
In-Reply-To: <578356BD.8000309@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On 07/11/2016 10:20 AM, Jacek Anaszewski wrote:
> On 07/11/2016 09:52 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 07/11/2016 09:34 AM, Jacek Anaszewski wrote:
>>> On 07/08/2016 02:53 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>> When working with Device Tree we iterate over children of "gpio-le=
ds"
>>>> compatible node and create LED device for each of them. We take ca=
re of
>>>> all common DT properties (label, default trigger, state, etc.), ho=
wever
>>>> some triggers may want to support more of them.
>>>>
>>>> It could be useful for timer trigger to support setting delay on/o=
ff
>>>> values with Device Tree property. Or for transient trigger to supp=
ort
>>>> e.g. duration property.
>>>>
>>>> We obviously should handle such properties in triggers, not in gen=
eric
>>>> code. To let trigger drivers read properties from DT node we need =
to set
>>>> of_node to point the relevant node. This change allows using all k=
ind of
>>>> of helpers in e.g. "activate" callbacks.
>>>>
>>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>>>> ---
>>>>   drivers/leds/leds-gpio.c | 5 +++--
>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
>>>> index 8229f06..9b991d4 100644
>>>> --- a/drivers/leds/leds-gpio.c
>>>> +++ b/drivers/leds/leds-gpio.c
>>>> @@ -165,6 +165,7 @@ static struct gpio_leds_priv
>>>> *gpio_leds_create(struct platform_device *pdev)
>>>>           return ERR_PTR(-ENOMEM);
>>>>
>>>>       device_for_each_child_node(dev, child) {
>>>> +        struct gpio_led_data *led_dat =3D &priv->leds[priv->num_l=
eds];
>>>
>>> This seems to be an unrelated change.
>>
>> We already got
>> &priv->leds[priv->num_leds]
>> and I needed to add
>> priv->leds[priv->num_leds].cdev.dev->of_node
>>
>> I didn't want to duplicate code accessing so deep struct, so I added=
 a
>> helper.
>>
>> Is that a good explanation? Or would you like me to change this code=
?
>
> Ah, I missed that. Patch applied.

Thanks :)
