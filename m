From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: Re: [PATCH v2 5/5] leds: leds-mc13783: Add devicetree support
Date: Mon, 23 Dec 2013 10:10:08 +0100
Message-ID: <52B7FDF0.9000404@epfl.ch>
References: <1387600347-22673-1-git-send-email-shc_work@mail.ru> <1387786706.300080155@f79.i.mail.ru> <52B7F4F8.3050907@epfl.ch> <1387788147.985598723@f413.i.mail.ru>
Reply-To: florian.vaussard@epfl.ch
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp5.epfl.ch ([128.178.224.8]:55342 "EHLO smtp5.epfl.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752982Ab3LWJKN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 23 Dec 2013 04:10:13 -0500
In-Reply-To: <1387788147.985598723@f413.i.mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org, =?ISO-8859-1?Q?Philippe_R=E9tornaz?= <philippe.retornaz@epfl.ch>



On 12/23/2013 09:42 AM, Alexander Shiyan wrote:
>>>> On 12/21/2013 05:32 AM, Alexander Shiyan wrote:
>>>>> This patch adds devicetree support for the MC13XXX LED driver.
> ...
>>>>> +	ret = of_property_read_u32_array(parent, "led-control", ctrls,
>>>>> +					 leds->devtype->num_regs);
>>>>> +	if (ret)
>>>>> +		goto out_node_put;
>>>>> +
>>>>> +	for (i = 0; i < leds->devtype->num_regs; i++) {
>>>>> +		ret = mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base + i,
>>>>> +					ctrls[i]);
>>>>
>>>> Code duplicated from the regular probe.
>>>
>>> Yes. This was done based on the comments to the previous version:
>>> http://www.spinics.net/lists/devicetree/msg14933.html
>>>
>>
>> From what I understand, Tomasz is suggesting exactly the same as
>> what I am saying:
>>
>> "what about making
>> mc13xxx_led_setup_of() allocate a platform data structure and fill it
>> in with data parsed from DT, so the driver would then proceed normally as
>> if the platform data were available? IMHO this should make the code much
>> simpler and more readable."
>>
>> This is not what you have done IMHO, you are cloning the probe
>> into a separate DT-only function.
> 
> I do not fully understand what you mean. When we had an universal procedure,
> I was told to divide them into DT and non-DT. I separated it - now we have duplicate code.
> Merge back?
> 

No, do in-between. Look at leds-lp5521.c for example. What you have to
do is roughly:

mc13xxx_led_probe
{
	struct mc13xxx_leds_platform_data *pdata = NULL;

	if (devicetree)
		mc13xxx_of_populate_pdata(pdev->dev.of_node, &pdata);
	else
		pdata = dev_get_platdata(&pdev->dev);

	if (!pdata)
		oops...

	-> regular probe here <-
}

Your function mc13xxx_of_populate_pdata() will look for DT properties,
and only fill the platform data. All the rest is done as usual by your probe
function. No code is duplicated, but the DT logic is encapsulated inside its
own function.

Look at other drivers if you are not familiar with such an approach, it
is pretty common.

Regards,

Florian
