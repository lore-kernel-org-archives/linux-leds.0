From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 04/24] dt-bindings: leds: Add function and color
 properties
Date: Sat, 1 Dec 2018 22:17:41 +0100
Message-ID: <fa5add90-e1b7-d527-374f-175abdf88455@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
 <5bea0eb8.1c69fb81.6b921.80e6@mx.google.com>
 <dfb5bd23-bcb9-7501-a608-969cb0464168@gmail.com>
 <0a0b176c-4eb4-4b0e-6c3c-b3c6c8f5fff5@gmail.com>
 <CAL_JsqKEpbJjExkQKSXwYma9wPPO+8E0QMTyWTPs1nkGSd49_g@mail.gmail.com>
 <20181130210814.GA5756@amd>
 <CAL_JsqK4oaUTBemXiTZzLeOKOndQ_GZp2F7mJ0VzGEKVGHY20Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK4oaUTBemXiTZzLeOKOndQ_GZp2F7mJ0VzGEKVGHY20Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

On 11/30/2018 11:19 PM, Rob Herring wrote:
> On Fri, Nov 30, 2018 at 3:08 PM Pavel Machek <pavel@ucw.cz> wrote:
>>
>> Hi!
>>
>>>> Pavel gave following examples:
>>>>
>>>> eth0:green:link
>>>> adsl0:green:link
>>>> adsl0:red:error
>>>>
>>>> So we would have e.g.:
>>>>
>>>> associated-vl42-device = <&camera1>;
>>>> associated-network-device = <&phy1>;
>>>> associated-block-device = <&phy1>;
>>>
>>> Variable property names are kind of a pain to parse.
>>
>> Ok, would it be enough to have associated-device = <&whatever>?
> 
> Yeah, but I though you needed the device type name in there.
> 
>>> Perhaps when LEDs are associated with a device, we shouldn't care
>>> within the context of the LED subsystem what the name is. The
>>> association is more important and if you have that exposed, then you
>>> don't really need to care what the name is. You still have to deal
>>> with a device with more than 1 LED, but that becomes a problem local
>>> to that device.
>>>
>>> What I'm getting at is following a more standard binding pattern of
>>> providers and consumers like we have for gpios, clocks, etc. So we'd
>>> have something like this:
>>>
>>> ethernet {
>>>   ...
>>>   leds = <&green_led>, <&red_led>;
>>>   led-names = "link", "err";
>>> };
>>
>> Basically every single device could have a LED associated with it
>> ("activity"). Would doing it like this mean we'd have to modify every
>> single driver to parse leds / led-names properties?
> 
> Normally, that's how properties like this would work. A driver is also
> what knows how the leds should function. 

This is not true in case of associations where LED controller is
an independent device, as in Pavel's example [0].

> A driver can retrieve the led
> and associate it with the 'foo-bar' function. The 'foo-bar' function
> then doesn't have to be defined in DT nor exposed to userspace. It
> wouldn't even have to be driver specific. The driver's subsystem could
> handle it all if the led functions are standardized. Though then you'd
> be back to needing standard names for 'led-names', but that's no worse
> that trigger names. This model would also allow getting rid of
> 'linux,default-trigger' properties in a lot of cases which wouldn't be
> a bad thing.
> 
> However, having drivers handle this is not required. You can iterate
> thru the tree for nodes with 'leds' and find the node which has a
> phandle to the led node you care about. 

This way of discovering associations between devices and LEDs
would be more reliable than by devicename part of LED class device
as discussed previously.

However, I've just tried to verify how it works, but
I can't find the way to get the of_node phandle from sysfs.

The "of_node" link in per-device dirs in /sys/devices point
to the directories containing DT properties of the node, but
I see no way to obtain the node phandle.

> Sure, it's not that efficient,
> but it does work and it's only done once. Basically, as long as the
> linkage is there, we can make it work. I think using
> 'associated-device' might work better for the current implementation
> of Linux LED support, but leds/led-names would be more inline with
> other DT bindings. The current Linux implementation shouldn't dictate
> the binding design.

[0] https://lkml.org/lkml/2018/11/13/103

-- 
Best regards,
Jacek Anaszewski
