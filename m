From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard
 backlight name
Date: Mon, 8 Apr 2019 22:01:52 +0200
Message-ID: <0b422d9a-36d8-31c6-5d50-d1358046693a@gmail.com>
References: <20190404185919.GB27340@amd>
 <CAE_wzQ-XuK7WOyPm6yXsmjp7z0=T92mMrfn1TVaavaLejcYVGA@mail.gmail.com>
 <20190404191931.GA29984@amd>
 <CAE_wzQ8y8i7C+_tv0CdnbUw0r21g1ggv2YUuzCog1xABivEvWA@mail.gmail.com>
 <20190404200658.GD29984@amd>
 <CAE_wzQ8WcMCzYqvxA_JBZKNza7ca3QE-VShmMxv5++_4F8RR=g@mail.gmail.com>
 <20190404202042.GF29984@amd>
 <CAE_wzQ-8XwzptH7EqNrELxjBzY2+0oHJGB3Va=vZwwK3csu_aA@mail.gmail.com>
 <20190404204207.GH29984@amd>
 <CAE_wzQ8xe=x0uYcZkDRVKpUAQ_1vVdEPHU3XnEV1=_WN1-AMfw@mail.gmail.com>
 <20190404220509.GA14690@amd>
 <CABXOdTeQgjd2-T+eZCMdTDWBGLHEk6kvnYR0DjJYR7zuvVTMsQ@mail.gmail.com>
 <df9577fd-c526-77e9-c11c-5416387121db@collabora.com>
 <469dfb68-a7ab-668d-15cb-9e021c0d3f0c@gmail.com>
 <CAE_wzQ_bhRMH1yHOrFhOqAR_ch0w8Ajv31yynT7ssZ3eDM4FUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE_wzQ_bhRMH1yHOrFhOqAR_ch0w8Ajv31yynT7ssZ3eDM4FUQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@google.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@google.com>, Pavel Machek <pavel@ucw.cz>, Nick Crews <ncrews@chromium.org>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>
List-Id: linux-leds@vger.kernel.org

Hi Dmitry,

Thanks for the review.

On 4/8/19 12:01 AM, Dmitry Torokhov wrote:
> Hi Jacek,
> 
> On Fri, Apr 5, 2019 at 1:00 PM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>>
>> Hi all,
>>
>> On 4/5/19 10:42 AM, Enric Balletbo i Serra wrote:
>>> Hi,
>>>
>>> On 5/4/19 0:42, Guenter Roeck wrote:
>>>> On Thu, Apr 4, 2019 at 3:05 PM Pavel Machek <pavel@ucw.cz> wrote:
>>>>>
>>>>> On Thu 2019-04-04 14:48:35, Dmitry Torokhov wrote:
>>>>>> On Thu, Apr 4, 2019 at 1:42 PM Pavel Machek <pavel@ucw.cz> wrote:
>>>>>>>
>>>>>>> Hi!
>>>>>>>
>>>>>>>>>> And what to do if internal keyboard is not platform but USB? Like
>>>>>>>>>> Google "Whiskers"? (I am not sure why you decided to drop my mention
>>>>>>>>>> of internal USB keyboards completely off your reply).
>>>>>>>>>
>>>>>>>>> I don't have answers for everything. Even if you have USB keyboard, you'll
>>>>>>>>> likely still have backlight connected to embedded controller. If not,
>>>>>>>>> then maybe you have exception userland needs to know about.
>>>>>>>>>
>>>>>>>>> Still better than making everything an exception.
>>>>>>>>
>>>>>>>> You do not need to make everything exception. You just need to look
>>>>>>>> beyond the name, and see how the device is connected. And then apply
>>>>>>>> your exceptions for "weird" devices.
>>>>>>>
>>>>>>> "Where it is connected" is not interesting to the userland. "Is it
>>>>>>> backlight for internal keyboard" is the right question. It may be
>>>>>>> connected to embedded controller or some kind of controller over
>>>>>>> i2c... my shell scripts should not need to know about architecture of
>>>>>>> every notebook out there.
>>>>>>
>>>>>> Then your scripts will be failing for some setups.
>>>>>
>>>>> Well, yes. Do you want to guess what "lp5523:kb3" is?
>>>>>
>>>>
>>>> Oh, please. The discussion is about the driver name part, which you
>>>> want to overload with some string to mean "internal", which in turn
>>>> is, if anything, part of the functionality.
>>>>
>>>> With "platform", you'll at some point have two
>>>> "platform::kbd_backlight" entries. Remind me to send you a "told you
>>>> so" when that happens.
>>>>
>>>> Guenter
>>>>
>>>>>>> But I don't see why I should do additional work when its trivial for
>>>>>>> kernel to just name the LED in an useful way.
>>>>>>>
>>>>>>> "platform::kbd_backlight" has no disadvantages compared to
>>>>>>> "wilco::kbd_backlight" ... so lets just use it.
>>>>>>
>>>>>> It has disadvantages because it promises more than it can deliver IMO.
>>>>>> If device name != "platform::kbd_backlight" it does not mean that it
>>>>>> is not internal keyboard.
>>>>>
>>>>> My promise is if "platform::kbd_backlight" exists, it is backlight for
>>>>> internal keyboard. (And second half is "if it is easy for kernel, we
>>>>> name backlight for internal keyboard platform::kbd_backlight").
>>>>>
>>>>>> And you still have not resolved how you will
>>>>>> handle cases when there is more than one deice that can be considered
>>>>>> internal and may have a backlight.
>>>>>
>>>>> Is that realistic? How would that device look like?
>>>>>
>>>
>>> Maybe is something "weird" in the PC/laptop world but in the Embedded world is
>>> not as weird as you think. I worked on devices that has two internal backlights,
>>> one to lit the qwerty keyboard and the other one to lit the numeric pad. We used
>>> the device field to differentiate both.
>>>
>>>     keyboardist::kbd_backlight
>>>     tclnumpad::kbd_backlight
>>>
>>> Taking this to the extreme you can also think in a device where every key has
>>> its own LED backlight, this happens for example in this device [1]. The device
>>> can lit only specific keys giving to the user a word prediction experience (i.e
>>> After press a key, only the keys that match with a possible word are lit on)
>>
>> While we have your attention at the subject of LED naming I would like
>> to invite you all to reviewing my recent patch set [0], available
>> also on the led_naming_v3 branch of linux-leds.git [1].
>>
>> The patch set introduces generic, backward compatible mechanism for
>> composing LED class devices names. It also aims to deprecate current
>> LED naming convention and encourage dropping "devicename" section.
> 
>>From looking at the docs section it looks like you propose to move
> from "device:color:fucntion" to simply "color:function" naming, and
> expect to have a suffix "_<n>" to avoid problem with duplicate LED
> names. I do not think this is quite backward compatible, since
> previously userspace was supposed to split the device name on the
> colon boundaries and extract the 3rd component if it wanted to
> determine function. With the new proposed scheme it has to be modified
> to try and also fetch the 2nd component if there isn't 3rd one and
> consider it as function as well. It also need to recognize potential
> suffixes and drop them before matching on function name.

The feature adding "_n" suffixes is not being added in my patch set,
it only gets documented. It was added back in 2015 to cover the
case when a LED with the name already present in the system is being
added via DT overlay:

commit a96aa64cb5723d941de879a9cd1fea025d6acb1b
Author: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Mon Mar 30 10:45:59 2015 -0700

     leds/led-class: Handle LEDs with the same name

     The current code expected that every LED had an unique name. This is a
     legit expectation when the device tree can no be modified or extended.
     But with device tree overlays this requirement can be easily broken.

     This patch finds out if the name is already in use and adds the suffix
     _1, _2... if not.

     Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
     Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
     Signed-off-by: Bryan Wu <cooloney@gmail.com>

If LEDs will be properly assigned function names, there will be
no need for resorting to this fallback mechanism. I believe, that
at least in case of platform drivers you are not going to have two
LEDs with exactly the same function name, which is going to reflect what
would be printed on the sticker next to the LED on the device case.

One type of devices for which preserving devicename will make sense
are USB ones. In case of my wifi dongle I get LED name like
mt7601u-phy0. The name which would introduce added value would be:
"phy0::wlan".

The backward compatibility I mention in the patch refers to
keeping the support for devicename:color:function.
It means that operation of all existing drivers will not be
affected. New drivers will also be able to stick to the
old naming convention, however people will be encouraged
to drop the devicename section as it has no added value beside
more "human readable" LED names. This however is not a question
in case of devfs nodes, right?

Generally  the goal is to gradually get rid of this clumsy naming,
which includes frequently the chipset name or other arbitrary
names like vendor or platform name.

Userspace will always be able to retrieve hardware related
details, which are available in the sysfs all the time.
Please check the get_led_device_info.sh script being added
in the patch set.

> I think if you want flexibility you really need to switch from
> encoding the information in the name to add LED class attributes
> describing the LED in more detail. This might include information
> about LEd placement (internal/external) if such information is
> available, and other additional attributes, if needed. Updated
> userspace can make use of these new attributes, leaving existing
> userspace decoding legacy names.
> 
>>
>> Patch 5/25 from the discussed patch set includes
>> get_led_device_name_info.sh script proving that parent device name
>> of the LED class device is available in the sysfs and its presence
>> in the LED name is unjustified and redundant.  The argument being raised
>> here related to name clash risk when there is no unique devicename
>> section included into the LED name is unjustified since LED core has
>> a protection against that and adds "_n" numerical suffix to the
>> requested LED name when it is already taken.
> 
> This scheme breaks userspace that does not expect additional suffixes
> attached to function name.

Like I explained above the addition of suffixes is not a part of
this patch set, but a pre-existing fallback for avoiding LED name
clash.

In order to get the gist of the changes it is required to go
through the first five patches of the patch set and read commit
messages as well as the documentation of the functions being
added.

>> The patch set introduces also a set of predefined LED_FUNCTION
>> names to be used in DT bindings. This along with the removal
>> of devicename section from LED naming pattern will help to keep
>> LED sysfs interface more uniform and not varying depending on
>> underlaying hardware driving the LEDs.
>>
>> Regarding the problem discussed in this thread - I would not necessarily
>> go for "platform" in place of devicename LED name section in the
>> cros_kbd_led_backlight driver. If we change it (should we at all - it is
>> already in 5.0 AFAICS?), then I would opt for dropping the "chromeos:"
>> part. It believe it will be possible to retrieve this name with
>> get_led_device_info.sh script. It would be good exercise to check
>> it out.
>>
>> In cases like above:
>>
>>       keyboardist::kbd_backlight
>>       tclnumpad::kbd_backlight
>>
>> we could do with the following:
>>
>>       :kbd-backlight
>>       :numpad-backlight
>>
>> I used hyphens instead of underscores since we will have this convention
>> in the LED_FUNCTION names, which is more common for Device Tree, and
>> some of existing LED triggers.
> 
> I am not sure what device tree has to do with it. ACPI for example
> likes all caps and sort names with numbers, but we do not let it
> propagate into the kernel.

For DT based LED class devices the LED name comes directly from DT label
property.

> We also should not be changing existing function names as existing
> userspace relies on them.

This is obvious. I meant making it configurable via kernel config
e.g.: CONFIG_LEDS_LEGACY_NAMES.

>> W could also think of placing common LED_FUNCTION definitions in
>> include/leds/led-functions.h and include it in both include/leds/leds.h
>> and include/dt-bindings/leds/common.h, so that they would be more
>> naturally accessible for non DT based drivers.
> 
> This makes total sense.
> 
> Thanks.
> 

-- 
Best regards,
Jacek Anaszewski
