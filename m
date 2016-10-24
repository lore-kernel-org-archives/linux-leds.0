From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 3/4] platform: x86: dell-*: Call
 led_notify_brightness_change on kbd brightness change
Date: Mon, 24 Oct 2016 15:57:41 +0200
Message-ID: <ec56e728-9e50-3e47-3a9f-5f0920da19e1@redhat.com>
References: <20161023194652.24335-1-hdegoede@redhat.com>
 <20161023194652.24335-3-hdegoede@redhat.com> <20161024133459.GD12154@pali>
 <48df1537-4f76-6c7b-cb50-9c1aeaf41b6c@redhat.com>
 <20161024135101.GF12154@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20161024135101.GF12154@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 24-10-16 15:51, Pali Rohár wrote:
> On Monday 24 October 2016 15:43:50 Hans de Goede wrote:
>> Hi,
>>
>> On 24-10-16 15:34, Pali Rohár wrote:
>>> On Sunday 23 October 2016 21:46:51 Hans de Goede wrote:
>>>> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
>>>> index da2fe18..f86e774 100644
>>>> --- a/drivers/platform/x86/dell-wmi.c
>>>> +++ b/drivers/platform/x86/dell-wmi.c
>>>> @@ -319,6 +319,11 @@ static void dell_wmi_process_key(int type, int code)
>>>> 	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
>>>> 		return;
>>>>
>>>> +	if (type == 0x0011 && (code == 0x01e1 || code == 0x02ea ||
>>>> +			 code == 0x02eb || code == 0x02ec || code == 0x02f6))
>>>> +		dell_smbios_call_notifier(
>>>> +			dell_smbios_kbd_backlight_brightness_changed, NULL);
>>>> +
>>>> 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
>>>> }
>>>>
>>>
>>> This part of patch is ugly. Some random numbers are checked and then
>>> notifier is called. We already have big table with explanation of those
>>> events... It is not possible to extend it with some flag or somehow
>>> other that value should be called via notifier?
>>
>> Nope, sparse_keymaps are a well defined API for, well, keymaps! The problem
>> really is this commit:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86?id=e075b3c898e4055ec62a1f0ed7f3b8e62814bfb6
>>
>> Which mixes status-events and key-press events in one sparse-keymap,
>> which happens to work because so far all the status events are
>> using { KE_IGNORE, 0x...., { KEY_RESERVED } }, but now we want to
>> actually do something and that shows that the above commit really
>> is a bad idea (at least for the 0x0011 type events, if we (partially)
>> revert that, then the ugly if goes away and I can simply insert
>> the dell_smbios_call_notifier() above the break in the original
>> switch-case handling for 0x0011 type events.
>>
>> So shall I revert the 0011 part of the mentioned commit?
>
> Does not help us, because keyboard backlight change event is also in
> dell_wmi_keymap_type_0000 table.

Hmm, the 0000 table contains:

         /* Key code is followed by keyboard illumination level */
         { KE_IGNORE, 0xe00c, { KEY_KBDILLUMTOGGLE } },

We could use the same keycode in the 0011 table for kbd brightness events and then do:

	if (event->keycode == KEY_KBDILLUMTOGGLE)
		dell_smbios_kbd_backlight_brightness_changed, NULL);

I will send an updated version using this.

Regards,

Hans
