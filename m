From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 01/26] ALSA: line6: Avoid polluting led_* namespace
Date: Thu, 18 Apr 2019 20:46:20 +0200
Message-ID: <4fbd3711-a1a9-cde0-cc63-d2ced55eff4a@gmail.com>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-2-jacek.anaszewski@gmail.com>
 <s5h8sw7riwt.wl-tiwai@suse.de> <20190418122135.GA6925@amd>
 <s5htvevh56y.wl-tiwai@suse.de>
 <b0d841c4-f027-d99d-ab76-721fba4a2a1e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b0d841c4-f027-d99d-ab76-721fba4a2a1e@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, dtor@google.com, robh@kernel.org, Jaroslav Kysela <perex@perex.cz>, linux@roeck-us.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 4/18/19 7:12 PM, Jacek Anaszewski wrote:
> On 4/18/19 2:24 PM, Takashi Iwai wrote:
>> On Thu, 18 Apr 2019 14:21:35 +0200,
>> Pavel Machek wrote:
>>>
>>> On Thu 2019-04-18 07:17:54, Takashi Iwai wrote:
>>>> On Wed, 17 Apr 2019 22:54:14 +0200,
>>>> Jacek Anaszewski wrote:
>>>>>
>>>>> led_colors clashes with the array of the same name being added
>>>>> to the LED class. Do the following amendments to fix this issue
>>>>> and the other prospective one.
>>>>>
>>>>> led_colors -> toneport_led_colors
>>>>> led_init_vals -> toneport_led_init_vals
>>>>>
>>>>> Fixes: f44edd7b2bbed ("ALSA: line6/toneport: Implement LED controls 
>>>>> via LED class")
>>>>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>>>> Cc: Jaroslav Kysela <perex@perex.cz>
>>>>> Cc: Takashi Iwai <tiwai@suse.com>
>>>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>>>
>>>> Looks good.
>>>>
>>>> Feel free to take my ack:
>>>>    Reviewed-by: Takashi Iwai <tiwai@suse.de>
> 
> Thanks.
> 
>>> I guess this is independend of pretty much everything, and should be
>>> taken through the sound tree?
>>
>> I don't mind either way.  If it's easier for you to take through sound
>> tree, just let me know.
> 
> I prefer to take it via LED tree as this patch is needed
> by the LED naming set.

Applied to the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
