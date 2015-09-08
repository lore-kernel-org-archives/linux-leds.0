From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH] leds:lp55xx: Correct Kconfig dependency for f/w user
 helper
Date: Tue, 8 Sep 2015 09:30:07 +0900
Message-ID: <55EE2C0F.5040101@ti.com>
References: <1441628701-3022-1-git-send-email-tiwai@suse.de>
 <55ED9CE1.1080002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:50384 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751197AbbIHAab (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 20:30:31 -0400
In-Reply-To: <55ED9CE1.1080002@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>

Hi Takashi,

On 9/7/2015 11:19 PM, Jacek Anaszewski wrote:
> Hi Takashi,
>
> Thanks for chasing this.
> Milo, could you express your opinion?
>
> On 09/07/2015 02:25 PM, Takashi Iwai wrote:
>> The commit [b67893206fc0: leds:lp55xx: fix firmware loading error]
>> tries to address the firmware file handling with user helper, but it
>> sets a wrong Kconfig CONFIG_FW_LOADER_USER_HELPER_FALLBACK.  Since the
>> wrong option was enabled, the system got a regression -- it suffers
>> from the unexpected long delays for non-present firmware files.
>>
>> This patch corrects the Kconfig dependency to the right one,
>> CONFIG_FW_LOADER_USER_HELPER.  This doesn't change the fallback
>> behavior but only enables UMH when needed.
>>
>> Bugzilla: https://bugzilla.opensuse.org/show_bug.cgi?id=944661
>> Fixes: b67893206fc0 ('leds:lp55xx: fix firmware loading error')
>> Cc: <stable@vger.kernel.org> # v4.2+
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> ---
>>    drivers/leds/Kconfig | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 70f4255ff291..2ba52bc2e174 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -229,7 +229,7 @@ config LEDS_LP55XX_COMMON
>>    	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>>    	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>>    	select FW_LOADER
>> -	select FW_LOADER_USER_HELPER_FALLBACK
>> +	select FW_LOADER_USER_HELPER
>>    	help
>>    	  This option supports common operations for LP5521/5523/55231/5562/8501
>>    	  devices.

Thank for catching this. It seems I misunderstood firmware helper 
configuration. LP55xx driver uses firmware interface to activate LED 
visual effect. So this driver enables FW_LOADER_USER_HELPER_FALLBACK and 
calls request_firmware_nowait() without uevent. Then, it will try to 
load raw data manually when binary(firmware) file doesn't exist.

I'm still not clear what the difference is between FW_LOADER_USER_HELPER 
and FW_LOADER_USER_HELPER_FALLBACK. Kconfig description makes me confused.
Could you explain it in more details?

Best regards,
Milo
