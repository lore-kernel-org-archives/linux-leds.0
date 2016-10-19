From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] platform: x86: dell-*: Call
 led_notify_brightness_change on kbd brightness change
Date: Wed, 19 Oct 2016 18:09:27 +0200
Message-ID: <10c3baa9-db2f-3cf2-d924-70a77243e7f8@redhat.com>
References: <20161019133355.6192-1-hdegoede@redhat.com>
 <20161019133355.6192-3-hdegoede@redhat.com> <20161019140614.GF1689@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20161019140614.GF1689@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 19-10-16 16:06, Pali Rohár wrote:
> On Wednesday 19 October 2016 15:33:55 Hans de Goede wrote:
>> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
>> index d2412ab..7934953 100644
>> --- a/drivers/platform/x86/dell-smbios.c
>> +++ b/drivers/platform/x86/dell-smbios.c
>> @@ -21,6 +21,7 @@
>>  #include <linux/mutex.h>
>>  #include <linux/slab.h>
>>  #include <linux/io.h>
>> +#include <linux/leds.h>
>>  #include "../../firmware/dcdbas.h"
>>  #include "dell-smbios.h"
>>
>> @@ -40,6 +41,9 @@ static int da_command_code;
>>  static int da_num_tokens;
>>  static struct calling_interface_token *da_tokens;
>>
>> +struct led_classdev *dell_kbd_backlight_led;
>> +EXPORT_SYMBOL_GPL(dell_kbd_backlight_led);
>> +
>>  int dell_smbios_error(int value)
>>  {
>>  	switch (value) {
>
> This is ugly! dell-smbios.c file have nothing to do with led and
> keyboard backlight. It is generic interface for sending and receiving
> smbios requests.
>
> I know, there are "layering problems" and something better should be
> invented. Drivers dell-wmi.ko and dell-rbtn.ko provides events and
> dell-laptop.ko want to listen for them. There is already hack in
> dell-rbnt.ko which I really would like to fix and then delete...
>
> So I rather do not want to see another hacks in that code.

I agree that this is not pretty, but I could not come up with a
simple other solution. If you've any suggestions on how you want
to see this implemented instead I can give that a try.

Regards,

Hans
