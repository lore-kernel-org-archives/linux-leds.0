From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 02/24] leds: core: Add support for composing LED class
 device names
Date: Mon, 12 Nov 2018 16:59:54 +0100
Message-ID: <e1b5411c-37ea-91f0-522a-8a6e2303c70f@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-3-git-send-email-jacek.anaszewski@gmail.com>
 <20181111120234.GA28794@amd> <a640167b-3a3e-daea-b377-6e82b653c5e8@gmail.com>
 <20181111201605.GA20160@amd> <57b77d4e-39a0-aaf2-5952-c2c25dc58593@gmail.com>
 <e72ac342-5253-851a-e54f-b1bd752be628@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e72ac342-5253-851a-e54f-b1bd752be628@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

On 11/12/2018 01:01 AM, Vesa Jääskeläinen wrote:
> Hi,
> 
> On 11/11/2018 23.14, Jacek Anaszewski wrote:
>> On 11/11/2018 09:16 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>>> diff --git a/Documentation/leds/leds-class.txt
>>>>>> b/Documentation/leds/leds-class.txt
>>>>>> index 836cb16..e9009c4 100644
>>>>>> --- a/Documentation/leds/leds-class.txt
>>>>>> +++ b/Documentation/leds/leds-class.txt
>>>>>> @@ -43,7 +43,7 @@ LED Device Naming
>>>>>>     Is currently of the form:
>>>>>>   -"devicename:colour:function"
>>>>>> +"colour:function"
> 
> Couldn't we have here multiple variants that would then be chosen based
> on device tree definition?
> 
> "devicename:colour:function"
> "devicename:function"
> "devicename:label"
> "colour:function"
> "function"
> "label"

Documentation/leds/leds-class.txt in a description of
"devicename:colour:function" naming scheme states the following:

"If sections of the name don't apply, just leave that section blank"

Currently not many Device Tree nodes follow that recommendation but with
the led_compose_name() I'm going to enforce it (only for the
devicename-less naming scheme), which is needed for reliable parsing of
LED color and function, which with naming schemes you proposed it
wouldn't be possible.

But, even with led_compose_name(), it will be possible to get the
names listed by you:

If you provide the 'label' property in the DT, then with the new
led_compose_name() you will get the LED class device name in one of the
two below forms, depending on the parameters passed to the function:
- If led_hw_name argument is not NULL:
	led_hw_name:label
- If led_hw_name argument is NULL then the label is taken as-is for
  for LED class device name (it may be appended a numerical suffix if
  the name is already taken)

This flexibility is for backwards compatibility with existing drivers,
where some of them add devicename section to the parsed DT label,
and others adopts the DT label as-is for LED class device name,
relying on DT to provide the devicename.

> If "label" would be specified then just use that as a led name, giving
> name:
> - label

Please get acquainted with the entire patch set, the commit messages,
and the documentation of led_compose_name(). You'll find out that
this is exactly how led_compose_name() is designed.

> If "function" would be defined then go to special formatting with
> optional "color", giving names:
> - color:function
> - function

Color must not be omitted as explained above. Of course in case 'label'
is provided, it won't be validated in any way, thus allowing for any
combination. With the 'color' and/or 'function' DT properties you'll
get one of the following:

- color:function
- :function
- color:

Having considered all the above, I'd even propose to change the
delimiter for the new naming convention from ":" to "-", to make it
possible to distinguish between old and new naming convention.

> I suppose 'devicename' would then be automatically filled based on
> driver instance unless one defines 'no-devicename' or something like
> that for led definition.

devicename section is problematic in the LED class device name,
since it doesn't allow for having uniform userspace interface across
different platforms. Think of Android - I've seen they have their own
LED naming scheme which doesn't contain devicename section.

Also, please refer to the DT maintainer's opinion in this regard [0],
which actually drew my attention to the problem.

Please keep in mind that devicename has been so far used for
board vendor name or LED controller name.

> Personally I do not see the need for "color" in any led name. In my
> opinion the only thing needed here would be location prefix (where
> needed -- and it should be possible to disable that) and then logical
> name for the led.

You mean we don't need the color information at all?

And could you please explain what do you mean by "location prefix"?

>>>>> I don't think we want to do it in all cases.
>>>>>
>>>>> So, on my cellphone seeing lp5523:green:led is indeed not useful.
>>>>>
>>>>> But on notebook with usb keyboard attached, you need to keep the
>>>>> devicename to be able to distinguish capslock on internal keyboard and
>>>>> capslock on first USB keyboard and capslock on second USB keyboard.
>>>>>
>>>>> Taking look at the list of functions, here's stuff like "hdd" and
>>>>> "hdderr". I assume the first means hdd activity... If we can do it, it
>>>>> would be nicest to have "sda:green:activity" and maybe
>>>>> "sda:red:error". For a raid array with 8 drives...
>>>>>
>>>>> For example I have a router running linux. It has 4 lan ports, with
>>>>> correspondings LED, and an wan led.
>>>>>
>>>>> Having "green:lan1" to "green:lan4" and "green:wan" plus
>>>>> "red:wanerror" would work, but I'd really preffer
>>>>> "eth0:green:link"... "adsl0:green:link", "adsl0:red:error".
>>>>>
>>>>> There are now phones with flashes on both main and selfie
>>>>> cameras. Again, knowing which device is which is important. As is
>>>>> knowing which display is controlled by particular backlight.
>>>>
>>>> It's overcomplicating the naming again. In every case you can tweak
>>>> the function name to eth0_link, eth1_link etc.
>>>
>>> Well, but in such case it would be good to keep existing scheme.
>>>
>>> My system looks like this:
>>>
>>> input16::capslock    tpacpi::bay_active    tpacpi::standby
>>> input16::numlock     tpacpi::dock_active   tpacpi::thinklight
>>> input16::scrolllock  tpacpi::dock_batt          tpacpi::thinkvantage
>>> input5::capslock     tpacpi::dock_status1  tpacpi::unknown_led
>>> input5::numlock      tpacpi::dock_status2  tpacpi::unknown_led2
>>> input5::scrolllock   tpacpi:green:batt          tpacpi::unknown_led3
>>>
>>> I agree that we should get rid of "tpacpi:" part in some cases. But
>>> it does not make sense to get rid of "input16:" part -- it tells you
>>> if the LED is on USB or on built-in keyboard.
>>>
>>> Ideally, tpacpi::thinklight would be input5::frontlight (as it is
>>> frontlight for the keyboard).
>>>
>>> Yes we should simplify, but it still needs to work in all cases.
>>
>> Well, label is not being removed. You still can use it an the old
>> fashion, even when using new led_compose_name().
>>
>> Maybe removing the description of the old LED naming from
>> Documentation/leds/leds-class.txt was too drastic move.
>> I'll keep it next to the new one, and only add a note that
>> it is kept only for backwards compatibility.
> 
> With above proposal for naming it should match more or less everyone's
> needs?
> 
> Simple naming for embedded device makers and more advanced for server
> system makers.
> 
> No need to say that something is legacy or backwards compatibility feature.


[0]
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1559757.html

-- 
Best regards,
Jacek Anaszewski
