From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Fri, 15 Feb 2019 22:42:36 +0100
Message-ID: <3d5407a7-9458-f071-a1d5-511b09678e20@gmail.com>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-2-jekhor@gmail.com>
 <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com> <20190213230731.GA8557@amd>
 <42078a81-e32e-81b7-528f-d1adb60d31c3@redhat.com>
 <20190213233806.GA11867@amd>
 <562e2acd-a60a-2aea-4050-6d9414d23a4e@redhat.com> <20190214111423.GE6132@amd>
 <92cf09b8-726d-4f1b-94ba-368a66af2246@redhat.com>
 <2b6faaa5-b21e-a512-de7d-ca21be5045fc@gmail.com> <20190214230307.GA17358@amd>
 <2a5e2002-e5f1-6da3-8a43-317801b69657@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2a5e2002-e5f1-6da3-8a43-317801b69657@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi all,

On 2/15/19 12:27 PM, Hans de Goede wrote:
> Hi,
> 
> On 15-02-19 00:03, Pavel Machek wrote:
>> Hi!
>>
>>>>>> I suggest that we deal with this special case by adding 3 custom
>>>>>> sysfs attributes:
>>>>>>
>>>>>> 1) "mode" which when read, prints, e.g. :
>>>>>> manual [on-when-charging]
>>>>>
>>>>> While this allows _user on console_ to control everything using echo,
>>>>> it is not suitable for applications trying to control LEDs.
>>>>>
>>>>> As there's nothing special about the case here, I believe we should
>>>>> have generic solution here.
>>>>>
>>>>> My preffered solution would be "hardware" trigger that leaves the LED
>>>>> in hardware control.
>>>>
>>>> As you explained in the parts which I snipped, there are many
>>>> devices which have a similar choice for a LED being under hw or
>>>> user control. I can see how this looks like a trigger and how we
>>>> could use the trigger API for this.
>>>>
>>>> I believe though, that if we implement a "virtual" (for lack of
>>>> a better word) trigger for this, that this should be done in the
>>>> LED core. I can envision this working like this:
>>>>
>>>> 1) Add a:
>>>>
>>>> hw_control_set(struct led_classdev *led_cdev, bool enable_hw_control);
>>>
>>> Please note that we have support for hw patterns in the pattern trigger.
>>> (see how drivers/leds/leds-sc27xx-bltc.c makes use of it for its
>>> breathing pattern).
>>> We have also support for hw blinking in timer trigger via blink_set op.
>>>
>>> In addition to that there is brightness_hw_changed sysfs attribute
>>> with led_classdev_notify_brightness_hw_changed() LED API.
>>>
>>> Couldn't they be used in concert to support the specific features
>>> of the device in question?
>>
>> I believe main issue here is this:
>>
>> Hardware can automatically control the LED according to the charging
>> status, or it can be used as normal software-controlled LED.
>>
>> I believe we should use trigger to select if hardware controls it or
>> not (and then add driver-specific files to describe the
>> details). Other proposal is in the mail thread, too.
> 
> Right, so there are really 2 orthogonal issues here:
> 
> 1) With this hardware the LED is either turned on/off automatically
> by the PMIC based on charging state; or it is under user control.
> 
> This is different from the led_classdev_notify_brightness_hw_changed
> case, where the hardware may update the state underneath the driver,
> but the driver can still always update the state itself. In this case
> if the LED is in hw-control mode then the driver cannot turn it on/off.
> 
> Pavel suggested modeling this with a new "hardware' trigger, where
> setting the trigger to this trigger will enable the hw-controlled
> mode and setting any other trigger will switch thing to the user-controlled
> mode.

We already do have hw_pattern file exposed by pattern trigger.
It can be used to set hw breathing mode using some device specific
syntax semantics, documented in dedicated ABI documentation.
It was introduced for similar case, see
Documentation/ABI/testing/sysfs-class-led-driver-sc27xx.

> 2) This hardware can do blinking / breathing. There are various issues with
> this:
> 
> 2.1) Blinking is more or less covered by the timer trigger. But 
> breathing is
> not the pattern trigger is a poor match since there is only 1 fixed pattern
> 
> 2.2) The supported blinking frequencies are very limited, so it might be 
> better
> to keep the standard software blinking mode and have a special sysfs 
> attribute
> to select the hardware blink support

hw_pattern can handle that. Actually pattern trigger is a superset of
timer trigger. So hw blinking could be supported by both timer and
pattern triggers (needs presence of blink_set and pattern_set ops in the
driver), and hw breathing mode should be supported only by pattern
trigger.

> 2.3) The user can also select between continuous on / blinking / breathing
> when the LED is under hardware control (it will then be on / blinking / 
> breathing)
> when charging.
> 
> My suggestion for dealing with this is 2 new device specific sysfs 
> attributes.
> 
> a) "pattern" which when read outputs e.g.:
> on blinking [breathing]
> And
> 
> b) "pattern_delay_on_off" which sets the on and off times for the hardware
> patterns on milliseconds, mirroring the delay_on / delay_off attributes
> from the timer trigger.

We have everything reedy for use.

Please also get acquainted with
Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt -
it describes the gradual dimming feature of software pattern fallback.

> Note we could alternatively use: "hw_pattern" and "hw_pattern_delay_on_off"
> to make it clear that this is done in hardware.
> 
> To deal with interactions with the standard API I suggest we reset pattern
> to "on" when brightness gets set to 0, similar to how we stop the timer
> trigger then, etc.
> 
> Regards,
> 
> Hans
> 
> 

-- 
Best regards,
Jacek Anaszewski
