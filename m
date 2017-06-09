From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] leds: pca955x: add GPIO support
Date: Fri, 9 Jun 2017 22:56:14 +0200
Message-ID: <0c738e3d-4c13-9ba2-d1ef-50e471019756@gmail.com>
References: <1494311772-21872-1-git-send-email-clg@kaod.org>
 <20b94199-a154-53cd-96d1-910ae3de1085@gmail.com>
 <7d30134c-c8c6-3475-1a7a-534199167b5c@kaod.org>
 <e03da89b-b5b3-0a32-bca8-621bfa0bc305@gmail.com>
 <24ff150b-0c12-3b5c-fbcd-5b8bedce3139@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <24ff150b-0c12-3b5c-fbcd-5b8bedce3139-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Rob,

On 06/09/2017 01:13 PM, Cédric Le Goater wrote:
> Hello,
> 
>>>> Thanks for the patch.
>>>>
>>>> Generally I'd split it into two patches:
>>>> 1/2: addition of  LED class specific DT support
>>>> 2/2: addition of GPIO support (for this one please cc also
>>>>      GPIO subsystem maintainer)
>>>
>>> OK. I will in next version.
>>>  
>>>> Please also see my comments below.
>>>>
>>>> On 05/09/2017 08:36 AM, Cédric Le Goater wrote:
>>>>> The PCA955x family of chips are I2C LED blinkers whose pins not used
>>>>> to control LEDs can be used as general purpose I/Os (GPIOs).
>>>>>
>>>>> The following adds support for device tree and Open Firmware to be
>>>>> able do define different operation modes for each pin. See bindings
>>>>> documentation for more details. The pca955x driver is then extended
>>>>> with a gpio_chip when pins are operating in GPIO mode.
>>>>>
>>>>> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
>>>>> ---
>>>>>  .../devicetree/bindings/leds/leds-pca955x.txt      | 103 ++++++++
>>>>>  drivers/leds/Kconfig                               |  11 +
>>>>>  drivers/leds/leds-pca955x.c                        | 290 ++++++++++++++++++---
>>>>>  3 files changed, 374 insertions(+), 30 deletions(-)
>>>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
>>>>> new file mode 100644
>>>>> index 000000000000..98d1053dd1b0
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
>>>>> @@ -0,0 +1,103 @@
>>>>> +LEDs connected to pca9550, pca9551, pca9552, pca9553,
>>>>> +
>>>>> +Required properties:
>>>>> +- compatible : should be one of :
>>>>> +	"nxp,pca9550"
>>>>> +	"nxp,pca9551"
>>>>> +	"nxp,pca9552"
>>>>> +	"nxp,pca9553"
>>>>> +- #address-cells: must be 1
>>>>> +- #size-cells: must be 0
>>>>> +- reg: I2C slave address. depends on the model.
>>>>> +
>>>>> +Optional properties:
>>>>> +- gpio-controller: allows pins to be used as GPIOs.
>>>>> +- #gpio-cells: if present, must not be 0.
>>>>> +- gpio-base : base number of the pins used as GPIOs. If there are more
>>>>> +              than one, they should be contiguous. See 'type' property
>>>>> +              below.
>>>>> +
>>>>> +LED sub-node properties:
>>>>> +- reg   : number of LED line.
>>>>> +		from 0 to  1 in pca9550
>>>>> +		from 0 to  7 in pca9551
>>>>> +		from 0 to 15 in pca9552
>>>>> +		from 0 to  3 in pca9553
>>>>> +- compatible: either "none", "led" (default) or "gpio".
>>>>> +- label : (optional)
>>>>> +          see Documentation/devicetree/bindings/leds/common.txt
>>>>> +- linux,default-trigger : (optional)
>>>>> +          see Documentation/devicetree/bindings/leds/common.txt
>>>>> +
>>>>> +Examples:
>>>>> +
>>>>> +pca9552: pca9552@60 {
>>>>> +	compatible = "nxp,pca9552";
>>>>> +	#address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +	reg = <0x60>;
>>>>> +
>>>>> +	gpio-controller;
>>>>> +	#gpio-cells = <2>;
>>>>> +	gpio-base = <12>;
>>>>> +
>>>>> +	gpio@12 {
>>>>> +		label = "GPIO12";
>>>>> +		reg = <12>;
>>>>> +		compatible = "gpio";
>>>>> +	};
>>>>> +	gpio@13 {
>>>>> +		label = "GPIO13";
>>>>> +		reg = <13>;
>>>>> +		compatible = "gpio";
>>>>> +	};
>>>>> +	gpio@14 {
>>>>> +		label = "GPIO14";
>>>>> +		reg = <14>;
>>>>> +		compatible = "gpio";
>>>>> +	};
>>>>> +	gpio@15 {
>>>>> +		label = "GPIO15";
>>>>> +		reg = <15>;
>>>>> +		compatible = "gpio";
>>>>> +	};
>>>>
>>>> I think that for GPIO pins we should have GPIO specific bindings,
>>>> but DT maintainer would have to give his opinion here.
>>>
>>> I have got my inspiration from the tca6507 bindings.
>>
>> Right, but AFAIK there was no DT maintainer position at that time
>> and those bindings don't have relevant ack. I'd rather wait for
>> DT maintainer opinion so as to avoid spawning wrong practices.
>>
>>>> Also I'm not sure if using compatible property this way is correct.
>>>
>>> yes.
> 
> So, is the usage of the 'compatible' property correct ? 
> 
> If not, we could use a 'type' property with an include file defining 
> the possible values. This is a common pattern.

Could you please confirm if using compatible property this way
is acceptable?

It follows Documentation/devicetree/bindings/leds/tca6507.txt.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
