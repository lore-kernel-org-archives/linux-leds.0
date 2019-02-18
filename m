From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Mon, 18 Feb 2019 22:59:07 +0100
Message-ID: <d16af997-f872-98c1-7b3a-caf77dac4059@gmail.com>
References: <3d5407a7-9458-f071-a1d5-511b09678e20@gmail.com>
 <87a21c4e-8e5e-c180-2ff3-eb8170746e71@redhat.com>
 <80971bc3-1193-83ed-913a-12f6217016c8@gmail.com>
 <b15fd048-8206-4057-a354-07dc14ca15e3@redhat.com>
 <8a263266-a41f-c916-e990-02d04de9b5d0@gmail.com>
 <af5bec7b-0da1-ee19-cdf4-0240f56221ad@redhat.com>
 <20190216193727.GA14305@amd>
 <7be63b6b-8d8d-90b8-fb17-d219b87a101f@redhat.com>
 <20190217000851.GA29803@amd>
 <81cc42f5-1f3d-c7f2-eb13-c2f8c4f9bfb4@redhat.com>
 <20190217174549.GA13301@amd>
 <98896f2f-1752-d52a-f755-3daa3b29a83f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <98896f2f-1752-d52a-f755-3daa3b29a83f@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Hans,

On 2/18/19 12:12 PM, Hans de Goede wrote:
> Hi,
> 
> On 17-02-19 18:45, Pavel Machek wrote:
>> Hi!
>>
>>>> I see... and yes, that would be the easiest solution.
>>>>
>>>> But somehow I see "this LED is controlled by charging state" as
>>>> primary and "it shows pulses instead of staying on" as secondary
>>>> eye-candy.
>>>>
>>>> This week there was another driver for charger LED.. but that one does
>>>> not do pulses. Ideally, we'd like consistent interface to the
>>>> userland.
>>>>
>>>> (To make it complex, the other driver supports things like:
>>>>    LED solid on -- fully charged
>>>>    LED blinking slowly -- charging
>>>>    LED blinking fast -- charge error
>>>>    LED off -- not charging).
>>>
>>> Something like that could be supported with my original hw_pattern
>>> proposal where we simply encode all of this in the hw-pattern file:
>>>
>>> tupple0: charging blinking_on_time
>>> tupple1: charging blinking_off_time
>>> tupple2: charging breathing_time
>>> tupple3: manual blinking_on_time
>>> tupple4: manual blinking_off_time
>>> tupple5: manual breathing_time
>>
>> So the userland would need to know "I'm on yoga, so 3rd tupple sets up
>> breathing when charging"?
> 
> Yes this is for the hw_pattern file not the regular pattern file and if 
> I've
> understood things correctly then the hw_pattern file is often (always?)
> specific to the LED controller model. See e.g. :
> Documentation/ABI/testing/sysfs-class-led-driver-sc27xx

This is so far the only user of hw_pattern. Whereas as in case of the
mentioned driver, it allows to simplify the pattern description which
would have to be otherwise quite complex in case of breathing, still the
sequence of tuples needs to adhere to the common pattern syntax.

> Also userland is not really expected to touch this, the user himself
> could touch it if he/she wants to customize things.
> 
>>> So for this chip you mention, we do not need the breathing time (no 
>>> breathing support),
>>> so we would get the following tupples:
>>>
>>> tupple0: not charging blinking_on_time
>>> tupple1: not charging blinking_off_time
>>> tupple2: slow charging blinking_on_time
>>> tupple3: slow charging blinking_off_time
>>> tupple4: fast charging blinking_on_time
>>> tupple5: fast charging blinking_off_time
>>> tupple6: charging error blinking_on_time
>>> tupple7: charging error blinking_off_time
>>
>> Patterns and their meanings are fixed (or almost) on that driver, so
>> fortunately that will not be neccessary.
> 
> Ok, so back the Whiskey Cove PMIC LED controller, I think
> there was some agreement to add a hw_control sysfs
> attribute and simplify the hw_pattern ABI to:
> 
> tupple0: blinking_on_time
> tupple1: blinking_off_time
> tupple2: breathing_time

Pattern format is defined to:

brightness_1 duration_1 brightness_2 duration_2 brightness_3 duration_3
and so on...

 From what I understood blinking and breathing are different
patterns in case of discussed device, so they would have to be
initialized differently.

Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
shows how to approach both cases, i.e. for instant change
of brightness we need intervening tuple with duration time = 0.

Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
shows how hw breathing was approached in that case.

> You suggested adding support for a hw_control
> sysfs attribute to the core, activated by a flag.
> 
> I assume that there will then be a callback into the

Yes, e.g. hw_control_set{_get}.

> driver when that file gets written. The semantics for
> the Whiskey Cove PMIC LED controller are clear, but
> how should the patch adding support for this to the LED core
> describe the new hw_control sysfs attribute in:
> Documentation/ABI/testing/sysfs-class-led ?

Yes, since it will belong to LED core.

> Or do you just want to have the basic handling in the
> core and then describe the semantics in a per LED controller
> way like how we do for hw_pattern, so for the
> Whiskey Cove PMIC LED controller we would add a:
> Documentation/ABI/testing/sysfs-class-led-cht-wc
> file, which we need to do anyways for the hw_pattern file?

In Documentation/ABI/testing/sysfs-class-led-cht-wc we should
have a description of hw_pattern semantics for Whiskey Cove PMIC LED,
with regard to how hw_control state impacts the mode of trigger
(manual/triggered when charging).

-- 
Best regards,
Jacek Anaszewski
