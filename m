From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Thu, 14 Feb 2019 22:46:42 +0100
Message-ID: <2b6faaa5-b21e-a512-de7d-ca21be5045fc@gmail.com>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-2-jekhor@gmail.com>
 <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com> <20190213230731.GA8557@amd>
 <42078a81-e32e-81b7-528f-d1adb60d31c3@redhat.com>
 <20190213233806.GA11867@amd>
 <562e2acd-a60a-2aea-4050-6d9414d23a4e@redhat.com> <20190214111423.GE6132@amd>
 <92cf09b8-726d-4f1b-94ba-368a66af2246@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <92cf09b8-726d-4f1b-94ba-368a66af2246@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Hans and all,

On 2/14/19 12:31 PM, Hans de Goede wrote:
> Hi,
> 
> On 14-02-19 12:14, Pavel Machek wrote:
>> Hi!
> 
> <snip>
> 
>>> That assumes that breathing is the default setting on all hardware
>>> and again I don't see why not to export this functionality to
>  >
>> Save the status on boot, then restore it on rmmod/reboot/poweroff? :-).
> 
> Which works until the system freezes one time. I believe that
> if we are going to do a LED driver for the charging LED on these
> devices, we MUST offer a way to put it back in its original
> state, even if the state is foo-barred at bootup.
> 
>>> userspace. Just because something does not fit in the existing
>>> API is IMHO not a good reason to not expose it to userspace.
>>>
>>> I suggest that we deal with this special case by adding 3 custom
>>> sysfs attributes:
>>>
>>> 1) "mode" which when read, prints, e.g. :
>>> manual [on-when-charging]
>>
>> While this allows _user on console_ to control everything using echo,
>> it is not suitable for applications trying to control LEDs.
>>
>> As there's nothing special about the case here, I believe we should
>> have generic solution here.
>>
>> My preffered solution would be "hardware" trigger that leaves the LED
>> in hardware control.
> 
> As you explained in the parts which I snipped, there are many
> devices which have a similar choice for a LED being under hw or
> user control. I can see how this looks like a trigger and how we
> could use the trigger API for this.
> 
> I believe though, that if we implement a "virtual" (for lack of
> a better word) trigger for this, that this should be done in the
> LED core. I can envision this working like this:
> 
> 1) Add a:
> 
> hw_control_set(struct led_classdev *led_cdev, bool enable_hw_control);

Please note that we have support for hw patterns in the pattern trigger.
(see how drivers/leds/leds-sc27xx-bltc.c makes use of it for its
breathing pattern).
We have also support for hw blinking in timer trigger via blink_set op.

In addition to that there is brightness_hw_changed sysfs attribute
with led_classdev_notify_brightness_hw_changed() LED API.

Couldn't they be used in concert to support the specific features
of the device in question?

> 
> Callback to struct led_classdev which when implemented by a driver
> like the current PMIC LED controller would do what it says.
> 
> 2) Have the core create and register a virtual hardware trigger the
> first time a LED cdev which has this callback gets registered.
> 
> When configured as the trigger for this LED device this trigger calls
> hw_control_set(cdev, true) and when unregistered calls
> hw_control_set(cdev, false)
> 
> Taking a quick look at the trigger code, a problem with this is
> that normally any trigger can work with any led device, so this
> "hardware" trigger will show up in the list of possible
> triggers for each device.
> 
> This problem can be solved by making the activate method for the
> hardware trigger check the classdev has a hw_control_set callback
> and if not return -EINVAL, or maybe -ENXIO but still this is somewhat
> inconsistent with other triggers, which AFAIK work with any LED.
> 
>> Alternatively I could imagine "hardware" sysfs attribute, containing
>> 0/1, with 0==software controlled, 1==hardware controlled.
> 
> Hmm, maybe call it "hardware_controlled" instead ? Otherwise this
> would work for me and I would personally prefer this solution. This
> could even be done in the LED core using the hw_control_set callback
> I proposed, to make sure it is handled consistently between devices.
> 
>> The rest of attributes would have to be Cove-specific, yes (but still
>> should fit with the rest of LED subsystem).
> 
> Right, I see that the triggers attribute already uses the fmt where
> on "cat" all options are listed and the current active one has [] around 
> it,
> so I think the pattern and frequency attributes I proposed should work
> well, although thinking more about this I believe the freq. attribute 
> should
> be called pattern_freq to make clear it applies to blinking / breathing
> set through the pattern attribute.
> 
> Regards,
> 
> Hans
> 

-- 
Best regards,
Jacek Anaszewski
