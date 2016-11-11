From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 2/4] platform: x86: thinkpad: Call
 led_notify_brightness_change on kbd brightness change
Date: Fri, 11 Nov 2016 15:33:48 +0100
Message-ID: <f90bd318-9f3f-62e4-be49-e03cae4eac14@redhat.com>
References: <20161101133748.7168-1-hdegoede@redhat.com>
 <20161101133748.7168-2-hdegoede@redhat.com> <201611111512.36115@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <201611111512.36115@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 11-11-16 15:12, Pali Rohár wrote:
> On Tuesday 01 November 2016 14:37:46 Hans de Goede wrote:
>> Make thinkpad_acpi call led_notify_brightness_change on the kbd_led
>> led_classdev registered by thinkpad_acpi when the kbd backlight
>> brightness changes.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> -This is a new patch in v3 of this patch-set
>> Changes in v4:
>> -No Changes
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c
>> b/drivers/platform/x86/thinkpad_acpi.c index b65ce75..5dcd7d8b
>> 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -162,6 +162,7 @@ enum tpacpi_hkey_event_t {
>>  	TP_HKEY_EV_HOTKEY_BASE		= 0x1001, /* first hotkey (FN+F1) */
>>  	TP_HKEY_EV_BRGHT_UP		= 0x1010, /* Brightness up */
>>  	TP_HKEY_EV_BRGHT_DOWN		= 0x1011, /* Brightness down */
>> +	TP_HKEY_EV_THINKLIGHT		= 0x1012, /* Thinklight/kbd backlight */
>
> My question remains. Is this for Thinklight or keyboard backlight?
> Because Thinklinght has led device "tpacpi_led_thinklight" and keyboard
> backlight has led device "tpacpi_led_kbdlight".

I would say both, this matches with the pre-existing
TP_ACPI_HKEY_THNKLGHT_MASK (they have a 1:1 mapping),
keep in mind that there are no thinkpads with both
a thinklight and a backlit keyboard, as those both
serve the same purpose so it looks like the re-used
the scancode.

I've tried this code on both a W541 and a P50 and both
emit TP_ACPI_HOTKEYSCAN_FNPAGEUP for the backlight
keyboard hotkey (fn + space), I'm naming the event for
this TP_HKEY_EV_THINKLIGHT for consistency with the
existing TP_ACPI_HKEY_THNKLGHT_MASK which corresponds
to TP_ACPI_HOTKEYSCAN_FNPAGEUP.

>>  	TP_HKEY_EV_VOL_UP		= 0x1015, /* Volume up or unmute */
>>  	TP_HKEY_EV_VOL_DOWN		= 0x1016, /* Volume down or unmute */
>>  	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
>> @@ -5167,6 +5168,8 @@ static int __init kbdlight_init(struct
>> ibm_init_struct *iibm) return rc;
>>  	}
>>
>> +	tpacpi_hotkey_driver_mask_set(hotkey_driver_mask |
>> +				      TP_ACPI_HKEY_THNKLGHT_MASK);
>>  	return 0;
>>  }
>>
>> @@ -9114,6 +9117,8 @@ static void tpacpi_driver_event(const unsigned
>> int hkey_event) volume_alsa_notify_change();
>>  		}
>>  	}
>> +	if (tp_features.kbdlight && hkey_event == TP_HKEY_EV_THINKLIGHT)
>> +		led_notify_brightness_change(&tpacpi_led_kbdlight.led_classdev);
>
> This looks incorrect. You are trying to inform tpacpi_led_kbdlight when
> tpacpi_led_thinklight change led status?

No as said the scancode / event is shared, notice the check for
tp_features.kbdlight, so the notify will only happen on laptops which
actually have a backlit keyboard.

Regards,

Hans


>
>>  }
>>
>>  static void hotkey_driver_event(const unsigned int scancode)
>
