From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH/RFC] DT: leds: Fix 'label' property description and add
 'colour' property
Date: Mon, 11 Dec 2017 10:27:19 -0600
Message-ID: <CAL_JsqL=aN6YSH30HSuUKS86Bsb2KPMdT0dyheYjs9Z=w3hH0Q@mail.gmail.com>
References: <1512251410-6084-1-git-send-email-jacek.anaszewski@gmail.com> <20171204104351.GA6611@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171204104351.GA6611@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

On Mon, Dec 4, 2017 at 4:43 AM, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> Label property was imposed a uniqueness requirement, which was erroneous,
>> since ePAPR defines it to "a human readable string describing a device".

But it still needs to be unique to be useful. It's just unique from a
different perspective. Ideally, if you had a block diagram level
drawing of a device or board showing LEDs (and displays with
backlights), you would simply take the labels from that drawing.

>> Also the binding description misleadingly suggested direct usage of label
>> for LED class device name, whereas it should only define a LED function.
>>
>> Therefore an additional 'colour' property is being introduced, which together
>> with the parent DT node name used for devicename shall be used for naming LED
>> class device according to the patterh
>> <devicename>:<colour>:<function>.
>
>
>> -- label : The label for this LED. If omitted, the label is taken from the node
>> -       name (excluding the unit address). It has to uniquely identify
>> -       a device, i.e. no other LED class device can be assigned the same
>> -       label.
>> +- label : The label for this LED. It should describe its function. If omitted,
>> +          the label is taken from the node name (excluding the unit address).
>
> So the label contains "as1235:green:capslock"? I guess it might be
> nice to mention that. Or just the "capslock" part?
>
> Also.. it would be good to start pushing for more consistency in the
> labels: I have these on the thinkpad:
>
> input5::scrolllock/   tpacpi::dock_status2/ tpacpi::unknown_led/
> mmc0::/               tpacpi:green:batt/    tpacpi::unknown_led2/
> phy0-led/             tpacpi:orange:batt/   tpacpi::unknown_led3/
> tpacpi::bay_active/   tpacpi::power/
>
> On embedded system, I'd like to see <devicename> to corespond
> to.. device the led belongs to, as opposed to name of the chip that
> drives the led. Maybe we should do 'main_camera:white:flash' instead of
> 'as4132:white:flash' because userspace already has information on what
> chip it is (sysfs paths), but can not easily figure out to which
> device the flash belongs.

A couple of points:

I already mentioned DT node naming policies in the lm3692x thread, so
I won't repeat here.

Using the node name is not going to guarantee uniqueness in the names.
Even if you added the unit address it would still not. I can easily
have 2 or more LED driver chips at the same I2C address on different
buses. The only guaranteed unique name is the full DT path. Once
you've added some OS specific numbering to make device names unique,
then I'm not sure there's a lot of value in naming things after what
drives them. You can walk the sysfs hierarchy to determine that
anyway.

A case I care about is I have a family of boards that all have a
common defined set of 4 LEDs. They could be driven by anything, but I
want the same interface presented to userspace across boards.

Rob
