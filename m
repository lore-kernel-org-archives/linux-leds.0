From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: Re: [PATCH v2 5/5] leds: leds-mc13783: Add devicetree support
Date: Mon, 23 Dec 2013 09:31:52 +0100
Message-ID: <52B7F4F8.3050907@epfl.ch>
References: <1387600347-22673-1-git-send-email-shc_work@mail.ru> <52B7ED08.7080401@epfl.ch> <1387786706.300080155@f79.i.mail.ru>
Reply-To: florian.vaussard@epfl.ch
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp4.epfl.ch ([128.178.224.219]:47705 "EHLO smtp4.epfl.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750877Ab3LWIb5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 23 Dec 2013 03:31:57 -0500
In-Reply-To: <1387786706.300080155@f79.i.mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org, =?ISO-8859-1?Q?Philippe_R=E9tornaz?= <philippe.retornaz@epfl.ch>

Hello,

On 12/23/2013 09:18 AM, Alexander Shiyan wrote:
>> Hello,
>>
>> On 12/21/2013 05:32 AM, Alexander Shiyan wrote:
>>> This patch adds devicetree support for the MC13XXX LED driver.
>>>
>>> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/mc13xxx.txt |  47 ++++++++
>>>  drivers/leds/leds-mc13783.c                       | 134 +++++++++++++++++++---
>>>  2 files changed, 162 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
>>> index abd9e3c..1413f39 100644
>>> --- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
>>> +++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
>>> @@ -10,9 +10,44 @@ Optional properties:
>>>  - fsl,mc13xxx-uses-touch : Indicate the touchscreen controller is being used
>>>  
>>>  Sub-nodes:
>>> +- leds : Contain the led nodes and initial register values in property
>>> +  "led-control". Number of register depends of used IC, for MC13783 is 6,
>>> +  for MC13892 is 4, for MC34708 is 1. See datasheet for bits definitions of
>>> +  these registers.
>>> +  - #address-cells: Must be 1.
>>> +  - #size-cells: Must be 0.
>>> +  Each led node should contain "reg", which used as LED ID (described below).
>>> +  Optional properties "label" and "linux,default-trigger" is described in
>>> +  Documentation/devicetree/bindings/leds/common.txt.
>>>  - regulators : Contain the regulator nodes. The regulators are bound using
>>>    their names as listed below with their registers and bits for enabling.
>>>  
>>> +MC13783 LED IDs:
>>> +    0  : Main display
>>> +    1  : AUX display
>>> +    2  : Keypad
>>> +    3  : Red 1
>>> +    4  : Green 1
>>> +    5  : Blue 1
>>> +    6  : Red 2
>>> +    7  : Green 2
>>> +    8  : Blue 2
>>> +    9  : Red 3
>>> +    10 : Green 3
>>> +    11 : Blue 3
>>> +
>>> +MC13892 LED IDs:
>>> +    0  : Main display
>>> +    1  : AUX display
>>> +    2  : Keypad
>>> +    3  : Red
>>> +    4  : Green
>>> +    5  : Blue
>>> +
>>> +MC34708 LED IDs:
>>> +    0  : Charger Red
>>> +    1  : Charger Green
>>> +
>>>  MC13783 regulators:
>>>      sw1a      : regulator SW1A      (register 24, bit 0)
>>>      sw1b      : regulator SW1B      (register 25, bit 0)
>>> @@ -89,6 +124,18 @@ ecspi@70010000 { /* ECSPI1 */
>>>  		interrupt-parent = <&gpio0>;
>>>  		interrupts = <8>;
>>>  
>>> +		leds {
>>
>> compatible string?
> 
> Not need. This is a child for PMIC and it is probed from PMIC core.
> 

Ok, so this is probably an oddity of the PMIC that I am using.

> ...
>>> +#ifdef CONFIG_OF
>>> +static int __init mc13xxx_led_probe_dt(struct platform_device *pdev)
>>> +{
>>> +	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
>>> +	struct mc13xxx *mcdev = leds->master;
>>> +	struct device_node *parent, *child;
>>> +	struct device *dev = &pdev->dev;
>>> +	u32 *ctrls, init_led = 0;
>>> +	int i, ret;
>>> +
>>> +	ctrls = devm_kzalloc(dev, leds->devtype->num_regs * sizeof(*ctrls),
>>> +			     GFP_KERNEL);
>>> +	if (!ctrls)
>>> +		return -ENOMEM;
>>> +
>>> +	of_node_get(dev->parent->of_node);
>>> +	parent = of_find_node_by_name(dev->parent->of_node, "leds");
>>> +	if (!parent) {
>>> +		ret = -ENODATA;
>>> +		goto out_node_put;
>>> +	}
>>> +
>>> +	ret = of_property_read_u32_array(parent, "led-control", ctrls,
>>> +					 leds->devtype->num_regs);
>>> +	if (ret)
>>> +		goto out_node_put;
>>> +
>>> +	for (i = 0; i < leds->devtype->num_regs; i++) {
>>> +		ret = mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base + i,
>>> +					ctrls[i]);
>>
>> Code duplicated from the regular probe.
> 
> Yes. This was done based on the comments to the previous version:
> http://www.spinics.net/lists/devicetree/msg14933.html
> 

>From what I understand, Tomasz is suggesting exactly the same as
what I am saying:

"what about making
mc13xxx_led_setup_of() allocate a platform data structure and fill it
in with data parsed from DT, so the driver would then proceed normally as
if the platform data were available? IMHO this should make the code much
simpler and more readable."

This is not what you have done IMHO, you are cloning the probe
into a separate DT-only function.

Regards,

Florian
