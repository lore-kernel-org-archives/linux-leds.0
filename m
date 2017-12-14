From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH/RFC] DT: leds: Fix 'label' property description and add
 'colour' property
Date: Thu, 14 Dec 2017 22:35:38 +0100
Message-ID: <82dc0ed3-f4fe-d8a2-65ea-4212770b78e7@gmail.com>
References: <1512251410-6084-1-git-send-email-jacek.anaszewski@gmail.com>
 <20171204104351.GA6611@amd>
 <CAL_JsqL=aN6YSH30HSuUKS86Bsb2KPMdT0dyheYjs9Z=w3hH0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:36841 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753543AbdLNVgg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Dec 2017 16:36:36 -0500
In-Reply-To: <CAL_JsqL=aN6YSH30HSuUKS86Bsb2KPMdT0dyheYjs9Z=w3hH0Q@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, Dan Murphy <dmurphy@ti.com>

On 12/11/2017 05:27 PM, Rob Herring wrote:
> On Mon, Dec 4, 2017 at 4:43 AM, Pavel Machek <pavel@ucw.cz> wrote:
>> Hi!
>>
>>> Label property was imposed a uniqueness requirement, which was erroneous,
>>> since ePAPR defines it to "a human readable string describing a device".
> 
> But it still needs to be unique to be useful. It's just unique from a

This patch is a follow-up of your following statement from [0]:

>>>>>>>
I really dislike how this naming convention is used for label. label is
supposed to be the phyically identifiable name. Having the devicename
defeats that. Perhaps color, too. We'd be better off with a color
property. It seems we're overloading the naming with too many things.
Now we're adding device association.
<<<<<<<


In effect, I intended to remove the uniqueness requirement for the
label since the label alone doesn't make a LED class device name
in case of many current LED class drivers.

Instead I inferred from your message that label should contain only
LED function. Therefore I'm splitting colour (maybe color would fit
better here, but adopted the spelling from
Documentation/leds/leds-class.txt, to be decided which one fits better.)

But see below.

> different perspective. Ideally, if you had a block diagram level
> drawing of a device or board showing LEDs (and displays with
> backlights), you would simply take the labels from that drawing.
> 
>>> Also the binding description misleadingly suggested direct usage of label
>>> for LED class device name, whereas it should only define a LED function.
>>>
>>> Therefore an additional 'colour' property is being introduced, which together
>>> with the parent DT node name used for devicename shall be used for naming LED
>>> class device according to the patterh
>>> <devicename>:<colour>:<function>.
>>
>>
>>> -- label : The label for this LED. If omitted, the label is taken from the node
>>> -       name (excluding the unit address). It has to uniquely identify
>>> -       a device, i.e. no other LED class device can be assigned the same
>>> -       label.
>>> +- label : The label for this LED. It should describe its function. If omitted,
>>> +          the label is taken from the node name (excluding the unit address).
>>
>> So the label contains "as1235:green:capslock"? I guess it might be
>> nice to mention that. Or just the "capslock" part?
>>
>> Also.. it would be good to start pushing for more consistency in the
>> labels: I have these on the thinkpad:
>>
>> input5::scrolllock/   tpacpi::dock_status2/ tpacpi::unknown_led/
>> mmc0::/               tpacpi:green:batt/    tpacpi::unknown_led2/
>> phy0-led/             tpacpi:orange:batt/   tpacpi::unknown_led3/
>> tpacpi::bay_active/   tpacpi::power/
>>
>> On embedded system, I'd like to see <devicename> to corespond
>> to.. device the led belongs to, as opposed to name of the chip that
>> drives the led. Maybe we should do 'main_camera:white:flash' instead of
>> 'as4132:white:flash' because userspace already has information on what
>> chip it is (sysfs paths), but can not easily figure out to which
>> device the flash belongs.
> 
> A couple of points:
> 
> I already mentioned DT node naming policies in the lm3692x thread, so
> I won't repeat here.
> 
> Using the node name is not going to guarantee uniqueness in the names.
> Even if you added the unit address it would still not. I can easily
> have 2 or more LED driver chips at the same I2C address on different
> buses. The only guaranteed unique name is the full DT path. Once
> you've added some OS specific numbering to make device names unique,
> then I'm not sure there's a lot of value in naming things after what
> drives them. You can walk the sysfs hierarchy to determine that
> anyway.
> 
> A case I care about is I have a family of boards that all have a
> common defined set of 4 LEDs. They could be driven by anything, but I
> want the same interface presented to userspace across boards.

In effect it looks like we should drop devicename section from
the LED class devicename pattern, label should describe only
LED function and additional color property could be introduced,
to be concatenated with LED function as a final LED class device
name.


[0] https://www.mail-archive.com/linux-media@vger.kernel.org/msg119473.html

-- 
Best regards,
Jacek Anaszewski
