From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard
 backlight name
Date: Sat, 6 Apr 2019 16:15:03 +0200
Message-ID: <1b45b4e8-18b6-62d5-7d42-0feed57c2c73@gmail.com>
References: <20190404200658.GD29984@amd>
 <CAE_wzQ8WcMCzYqvxA_JBZKNza7ca3QE-VShmMxv5++_4F8RR=g@mail.gmail.com>
 <20190404202042.GF29984@amd>
 <CAE_wzQ-8XwzptH7EqNrELxjBzY2+0oHJGB3Va=vZwwK3csu_aA@mail.gmail.com>
 <20190404204207.GH29984@amd>
 <CAE_wzQ8xe=x0uYcZkDRVKpUAQ_1vVdEPHU3XnEV1=_WN1-AMfw@mail.gmail.com>
 <20190404220509.GA14690@amd>
 <CABXOdTeQgjd2-T+eZCMdTDWBGLHEk6kvnYR0DjJYR7zuvVTMsQ@mail.gmail.com>
 <df9577fd-c526-77e9-c11c-5416387121db@collabora.com>
 <469dfb68-a7ab-668d-15cb-9e021c0d3f0c@gmail.com> <20190406095346.GB7546@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190406095346.GB7546@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@google.com>, Dmitry Torokhov <dtor@google.com>, Nick Crews <ncrews@chromium.org>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 4/6/19 11:53 AM, Pavel Machek wrote:
> Hi!
> 
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
> 
> I am not sure about existing driver. Important thing for me is that
> new drivers use consistent naming.
> 
>> In cases like above:
>>
>>      keyboardist::kbd_backlight
>>      tclnumpad::kbd_backlight
>>
>> we could do with the following:
>>
>>      :kbd-backlight
>>      :numpad-backlight
>>
>> I used hyphens instead of underscores since we will have this convention
>> in the LED_FUNCTION names, which is more common for Device Tree, and
>> some of existing LED triggers.
> 
> Existing userspace already searches for *:kbd_backlight", AFAICT, so
> we probably want to keep the "_".

OK, but it should be an exception but not a rule.
This "kbd-*" naming is used in input and tty subsystems which register
keyboard triggers with this style:

~/kernel$ git grep  ".*[\":]kbd-" -- "*.c"
drivers/input/input-leds.c:     [LED_NUML]      = { "numlock", 
VT_TRIGGER("kbd-numlock") },
drivers/input/input-leds.c:     [LED_CAPSL]     = { "capslock", 
VT_TRIGGER("kbd-capslock") },
drivers/input/input-leds.c:     [LED_SCROLLL]   = { "scrolllock", 
VT_TRIGGER("kbd-scrolllock") },
drivers/input/input-leds.c:     [LED_KANA]      = { "kana", 
VT_TRIGGER("kbd-kanalock") },
drivers/tty/vt/keyboard.c:      KBD_LED_TRIGGER(VC_SCROLLOCK, 
"kbd-scrolllock"),
drivers/tty/vt/keyboard.c:      KBD_LED_TRIGGER(VC_NUMLOCK, 
"kbd-numlock"),
drivers/tty/vt/keyboard.c:      KBD_LED_TRIGGER(VC_CAPSLOCK, 
"kbd-capslock"),
drivers/tty/vt/keyboard.c:      KBD_LED_TRIGGER(VC_KANALOCK, 
"kbd-kanalock"),
drivers/tty/vt/keyboard.c:      KBD_LOCKSTATE_TRIGGER(VC_SHIFTLOCK, 
"kbd-shiftlock"),
drivers/tty/vt/keyboard.c:      KBD_LOCKSTATE_TRIGGER(VC_ALTGRLOCK, 
"kbd-altgrlock"),
drivers/tty/vt/keyboard.c:      KBD_LOCKSTATE_TRIGGER(VC_CTRLLOCK, 
"kbd-ctrllock"),
drivers/tty/vt/keyboard.c:      KBD_LOCKSTATE_TRIGGER(VC_ALTLOCK, 
"kbd-altlock"),
drivers/tty/vt/keyboard.c:      KBD_LOCKSTATE_TRIGGER(VC_SHIFTLLOCK, 
"kbd-shiftllock"),
drivers/tty/vt/keyboard.c:      KBD_LOCKSTATE_TRIGGER(VC_SHIFTRLOCK, 
"kbd-shiftrlock"),
drivers/tty/vt/keyboard.c:      KBD_LOCKSTATE_TRIGGER(VC_CTRLLLOCK, 
"kbd-ctrlllock"),
drivers/tty/vt/keyboard.c:      KBD_LOCKSTATE_TRIGGER(VC_CTRLRLOCK, 
"kbd-ctrlrlock"),

"kbd_" naming is used only in case of backlight LEDs:

~/kernel$ git grep  ".*[\":]kbd_" -- "*.c"
drivers/hid/hid-asus.c: drvdata->kbd_backlight->cdev.name = 
"asus::kbd_backlight";
drivers/hid/hid-google-hammer.c:        kbd_backlight->cdev.name = 
"hammer::kbd_backlight";
drivers/hwmon/applesmc.c:       .name                   = 
"smc::kbd_backlight",
drivers/input/misc/ims-pcu.c:            "pcu%d::kbd_backlight", 
pcu->device_no);
drivers/platform/chrome/cros_kbd_led_backlight.c:       cdev->name = 
"chromeos::kbd_backlight";
drivers/platform/x86/asus-laptop.c:             cdev->name = 
"asus::kbd_backlight";
drivers/platform/x86/asus-wmi.c:                asus->kbd_led.name = 
"asus::kbd_backlight";
drivers/platform/x86/dell-laptop.c:     .name           = 
"dell::kbd_backlight",
drivers/platform/x86/samsung-laptop.c:          samsung->kbd_led.name = 
"samsung::kbd_backlight";
drivers/platform/x86/sony-laptop.c:     kbdbl_ctl->mode_attr.attr.name = 
"kbd_backlight";
drivers/platform/x86/sony-laptop.c: 
kbdbl_ctl->timeout_attr.attr.name = "kbd_backlight_timeout";
drivers/platform/x86/thinkpad_acpi.c:           .name           = 
"tpacpi::kbd_backlight",
drivers/platform/x86/toshiba_acpi.c:            dev->kbd_led.name = 
"toshiba::kbd_backlight";

With LEDs in platform drivers is that problem that we have the name
compiled into the kernel. Maybe to make it more flexible we could
use kernel config to choose between new "kbd-" and legacy "kbd_"
naming.

> I don't care much if we use "platform:" or no prefix at all for
> backlight of internal keyboard, as long as it is consistent across all
> devices.
> 
> We certainly want to use some prefix (probably inputX:) for backlight
> on USB keyboards.

For LEDs exposed through the input-LED bridge my get_led_device_info.sh
script nicely reports:

associated input node: input1

It just does:

readlink input1\:\:numlock/device

which prints: "../../input1 "

And I believe that for backlight LEDs exposed by input
subsystem it should be similarly since the input device
related to USB keyboard is a child of USB device:

/sys/class/leds# readlink input1::numlock
../../devices/pci0000:00/0000:00:14.0/usb2/2-4/2-4:1.0/0003:1C4F:0002.0002/input/input1/input1::numlock

-- 
Best regards,
Jacek Anaszewski
