From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 7/7] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Tue, 21 Feb 2017 15:56:43 +0100
Message-ID: <0aed5655-11db-e632-0213-95779b780cb2@redhat.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <20170209154417.19040-8-hdegoede@redhat.com> <20170221141108.GG9795@pali>
 <d1639790-24a3-8c81-651b-c8c8940ceeb5@redhat.com>
 <20170221145043.GK9795@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170221145043.GK9795@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 21-02-17 15:50, Pali Rohár wrote:
> On Tuesday 21 February 2017 15:40:16 Hans de Goede wrote:
>> Hi,
>>
>> On 21-02-17 15:11, Pali Rohár wrote:
>>> On Thursday 09 February 2017 16:44:17 Hans de Goede wrote:
>>>> Make dell-wmi notify on hotkey kbd brightness changes, listen for this
>>>> in dell-laptop and call led_classdev_notify_brightness_hw_changed.
>>>>
>>>> This will allow userspace to monitor (poll) for brightness changes on
>>>> these LEDs caused by the hotkey.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> Changes in v2:
>>>> -Use the new dell_smbios*notify functionality
>>>> Changes in v3:
>>>> -Simplify the if condition for calling led_notify_brightness_change
>>>> Changes in v4:
>>>> -Adjust for dell_smbios_*_notifier to dell_laptop_*_notifier rename
>>>> Changes in v5:
>>>> -Switch to new led-trigger based API for notifying userspace about
>>>> keyboard backlight brightness changes.
>>>> Changes in v6:
>>>> -Switch to new brightness_hw_changed LED class API
>>>> Changes in v8:
>>>> -Cache last set brightness value and only call
>>>> led_classdev_notify_brightness_hw_changed if the brightness has changed,
>>>> this is necessary because the WMI events get triggered when we set the
>>>> brightness ourselves too
>>>
>>> NAK. This does not work. Brightness can and already is handled also by
>>> userspace application from Dell libsmbios package. Not every brightness
>>> change is going via kernel driver and so new variable kbd_led_brightness
>>> contains just random value.
>>
>> This shows why it is a bad idea to have userspace code directly poking the
>> hardware. There is a reason why we've been moving away from the xserver
>> directly poking gpu-s to doing everything in the kernel.
>
> I agree.
>
>> To me libsmbios is a relic, something of ages long gone by and a normal
>> user should never use it.
>
> Do not remember that libsmbios was there first and kernel code is
> reimplementation from that userspace. Without libsmbios no kernel
> support would be there.
>
> And we can expect in future if Dell again decide to release some SMBIOS
> code it will be in libsmbios...
>
>> You're right that it can be used to change things underneath the kernel,
>> but as said normally a user should never do that.
>
> I used it and often, because kernel does not have support for keyboard
> backlight. And other people probably too.
>
> So if we agree or not, we need to deal with fact that userspace can and
> it is already calling smbios API. And started it doing earlier as kernel.
>
>> What will happen if a user does that regardless is that an acpi event
>> will trigger and the following code will execute:
>>
>> +		mutex_lock(&kbd_led_mutex);
>> +
>> +		brightness = kbd_led_level_get(&kbd_led);
>> +		if (kbd_led_brightness != brightness) {
>> +			kbd_led_brightness = brightness;
>> +			led_classdev_notify_brightness_hw_changed(&kbd_led,
>> +								  brightness);
>> +		}
>> +
>> +		mutex_unlock(&kbd_led_mutex);
>>
>> After which the kbd_led_brightness will be in sync again, so basically
>> the only side effect of the user changing the keyboard brightness
>> through libsmbios will be led_classdev_notify_brightness_hw_changed()
>> getting called, which is not unsurprising if you change something outside
>> of the kernel, so I really see no problem here.
>>
>> Currently the only listener for led_classdev_notify_brightness_hw_changed()
>> is the gnome3 desktop stack, and having the keyboard brightness
>> slider in the control panel update when setting the brightness outside
>> of the normal ways actually is a good thing.
>
> So do we really need this code which prevents update?

Yes, because the ABI specification for the new brightness_hw_changed says
that poll() listeners will only be woken up if the brightness is changed
outside of the kernel and not when the kernel changes it itself.

Regards,

Hans



>
>> Regards,
>>
>> Hans
>>
>>>> ---
>>>> drivers/platform/x86/dell-laptop.c | 47 +++++++++++++++++++++++++++++++++++++-
>>>> drivers/platform/x86/dell-wmi.c    | 14 ++++++++----
>>>> 2 files changed, 55 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
>>>> index 70951f3..f30938b 100644
>>>> --- a/drivers/platform/x86/dell-laptop.c
>>>> +++ b/drivers/platform/x86/dell-laptop.c
>>>> @@ -1133,6 +1133,7 @@ static u8 kbd_previous_level;
>>>> static u8 kbd_previous_mode_bit;
>>>>
>>>> static bool kbd_led_present;
>>>> +static enum led_brightness kbd_led_brightness;
>>>> static DEFINE_MUTEX(kbd_led_mutex);
>>>>
>>>> /*
>>>> @@ -1943,6 +1944,7 @@ static enum led_brightness kbd_led_level_get(struct led_classdev *led_cdev)
>>>> static int kbd_led_level_set(struct led_classdev *led_cdev,
>>>> 			     enum led_brightness value)
>>>> {
>>>> +	enum led_brightness new_brightness = value;
>>>> 	struct kbd_state state;
>>>> 	struct kbd_state new_state;
>>>> 	u16 num;
>>>> @@ -1971,6 +1973,8 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
>>>> 		ret = -ENXIO;
>>>> 	}
>>>>
>>>> +	if (ret == 0)
>>>> +		kbd_led_brightness = new_brightness;
>>>> out:
>>>> 	mutex_unlock(&kbd_led_mutex);
>>>> 	return ret;
>>>> @@ -1978,6 +1982,7 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
>>>>
>>>> static struct led_classdev kbd_led = {
>>>> 	.name           = "dell::kbd_backlight",
>>>> +	.flags		= LED_BRIGHT_HW_CHANGED,
>>>> 	.brightness_set_blocking = kbd_led_level_set,
>>>> 	.brightness_get = kbd_led_level_get,
>>>> 	.groups         = kbd_led_groups,
>>>> @@ -1985,6 +1990,8 @@ static struct led_classdev kbd_led = {
>>>>
>>>> static int __init kbd_led_init(struct device *dev)
>>>> {
>>>> +	int ret;
>>>> +
>>>> 	kbd_init();
>>>> 	if (!kbd_led_present)
>>>> 		return -ENODEV;
>>>> @@ -1996,7 +2003,12 @@ static int __init kbd_led_init(struct device *dev)
>>>> 		if (kbd_led.max_brightness)
>>>> 			kbd_led.max_brightness--;
>>>> 	}
>>>> -	return led_classdev_register(dev, &kbd_led);
>>>> +	kbd_led_brightness = kbd_led_level_get(&kbd_led);
>>>> +	ret = led_classdev_register(dev, &kbd_led);
>>>> +	if (ret)
>>>> +		kbd_led_present = false;
>>>> +
>>>> +	return ret;
>>>> }
>>>>
>>>> static void brightness_set_exit(struct led_classdev *led_cdev,
>>>> @@ -2013,6 +2025,36 @@ static void kbd_led_exit(void)
>>>> 	led_classdev_unregister(&kbd_led);
>>>> }
>>>>
>>>> +static int dell_laptop_notifier_call(struct notifier_block *nb,
>>>> +				     unsigned long action, void *data)
>>>> +{
>>>> +	enum led_brightness brightness;
>>>> +
>>>> +	switch (action) {
>>>> +	case DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED:
>>>> +		if (!kbd_led_present)
>>>> +			break;
>>>> +
>>>> +		mutex_lock(&kbd_led_mutex);
>>>> +
>>>> +		brightness = kbd_led_level_get(&kbd_led);
>>>> +		if (kbd_led_brightness != brightness) {
>>>> +			kbd_led_brightness = brightness;
>>>> +			led_classdev_notify_brightness_hw_changed(&kbd_led,
>>>> +								  brightness);
>>>> +		}
>>>> +
>>>> +		mutex_unlock(&kbd_led_mutex);
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	return NOTIFY_OK;
>>>> +}
>>>> +
>>>> +static struct notifier_block dell_laptop_notifier = {
>>>> +	.notifier_call = dell_laptop_notifier_call,
>>>> +};
>>>> +
>>>> static int __init dell_init(void)
>>>> {
>>>> 	struct calling_interface_buffer *buffer;
>>>> @@ -2056,6 +2098,8 @@ static int __init dell_init(void)
>>>> 		debugfs_create_file("rfkill", 0444, dell_laptop_dir, NULL,
>>>> 				    &dell_debugfs_fops);
>>>>
>>>> +	dell_laptop_register_notifier(&dell_laptop_notifier);
>>>> +
>>>> 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
>>>> 		return 0;
>>>>
>>>> @@ -2107,6 +2151,7 @@ static int __init dell_init(void)
>>>>
>>>> static void __exit dell_exit(void)
>>>> {
>>>> +	dell_laptop_unregister_notifier(&dell_laptop_notifier);
>>>> 	debugfs_remove_recursive(dell_laptop_dir);
>>>> 	if (quirks && quirks->touchpad_led)
>>>> 		touchpad_led_exit();
>>>> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
>>>> index 75e6370..15740b5 100644
>>>> --- a/drivers/platform/x86/dell-wmi.c
>>>> +++ b/drivers/platform/x86/dell-wmi.c
>>>> @@ -297,11 +297,11 @@ static const struct key_entry dell_wmi_keymap_type_0011[] __initconst = {
>>>> 	{ KE_IGNORE, 0xfff1, { KEY_RESERVED } },
>>>>
>>>> 	/* Keyboard backlight level changed */
>>>> -	{ KE_IGNORE, 0x01e1, { KEY_RESERVED } },
>>>> -	{ KE_IGNORE, 0x02ea, { KEY_RESERVED } },
>>>> -	{ KE_IGNORE, 0x02eb, { KEY_RESERVED } },
>>>> -	{ KE_IGNORE, 0x02ec, { KEY_RESERVED } },
>>>> -	{ KE_IGNORE, 0x02f6, { KEY_RESERVED } },
>>>> +	{ KE_IGNORE, 0x01e1, { KEY_KBDILLUMTOGGLE } },
>>>> +	{ KE_IGNORE, 0x02ea, { KEY_KBDILLUMTOGGLE } },
>>>> +	{ KE_IGNORE, 0x02eb, { KEY_KBDILLUMTOGGLE } },
>>>> +	{ KE_IGNORE, 0x02ec, { KEY_KBDILLUMTOGGLE } },
>>>> +	{ KE_IGNORE, 0x02f6, { KEY_KBDILLUMTOGGLE } },
>>>> };
>>>>
>>>> static struct input_dev *dell_wmi_input_dev;
>>>> @@ -329,6 +329,10 @@ static void dell_wmi_process_key(int type, int code)
>>>> 	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
>>>> 		return;
>>>>
>>>> +	if (key->keycode == KEY_KBDILLUMTOGGLE)
>>>> +		dell_laptop_call_notifier(
>>>> +			DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED, NULL);
>>>> +
>>>> 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
>>>> }
>>>>
>>>
>
