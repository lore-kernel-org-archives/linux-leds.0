From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH] leds:lp55xx: Correct Kconfig dependency for f/w user
 helper
Date: Tue, 8 Sep 2015 17:25:31 +0900
Message-ID: <55EE9B7B.7020503@ti.com>
References: <1441628701-3022-1-git-send-email-tiwai@suse.de>
 <55ED9CE1.1080002@samsung.com> <55EE2C0F.5040101@ti.com>
 <s5hwpw1fqjl.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <s5hwpw1fqjl.wl-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Bryan Wu <cooloney@gmail.com>
List-Id: linux-leds@vger.kernel.org

Hi Takashi,

On 9/8/2015 2:06 PM, Takashi Iwai wrote:
> On Tue, 08 Sep 2015 02:30:07 +0200,
> Kim, Milo wrote:
>>
>> Hi Takashi,
>>
>> On 9/7/2015 11:19 PM, Jacek Anaszewski wrote:
>>> Hi Takashi,
>>>
>>> Thanks for chasing this.
>>> Milo, could you express your opinion?
>>>
>>> On 09/07/2015 02:25 PM, Takashi Iwai wrote:
>>>> The commit [b67893206fc0: leds:lp55xx: fix firmware loading error]
>>>> tries to address the firmware file handling with user helper, but it
>>>> sets a wrong Kconfig CONFIG_FW_LOADER_USER_HELPER_FALLBACK.  Since the
>>>> wrong option was enabled, the system got a regression -- it suffers
>>>> from the unexpected long delays for non-present firmware files.
>>>>
>>>> This patch corrects the Kconfig dependency to the right one,
>>>> CONFIG_FW_LOADER_USER_HELPER.  This doesn't change the fallback
>>>> behavior but only enables UMH when needed.
>>>>
>>>> Bugzilla: https://bugzilla.opensuse.org/show_bug.cgi?id=944661
>>>> Fixes: b67893206fc0 ('leds:lp55xx: fix firmware loading error')
>>>> Cc: <stable@vger.kernel.org> # v4.2+
>>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>>> ---
>>>>     drivers/leds/Kconfig | 2 +-
>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index 70f4255ff291..2ba52bc2e174 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -229,7 +229,7 @@ config LEDS_LP55XX_COMMON
>>>>     	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>>>>     	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>>>>     	select FW_LOADER
>>>> -	select FW_LOADER_USER_HELPER_FALLBACK
>>>> +	select FW_LOADER_USER_HELPER
>>>>     	help
>>>>     	  This option supports common operations for LP5521/5523/55231/5562/8501
>>>>     	  devices.
>>
>> Thank for catching this. It seems I misunderstood firmware helper
>> configuration. LP55xx driver uses firmware interface to activate LED
>> visual effect. So this driver enables FW_LOADER_USER_HELPER_FALLBACK and
>> calls request_firmware_nowait() without uevent. Then, it will try to
>> load raw data manually when binary(firmware) file doesn't exist.
>>
>> I'm still not clear what the difference is between FW_LOADER_USER_HELPER
>> and FW_LOADER_USER_HELPER_FALLBACK. Kconfig description makes me confused.
>> Could you explain it in more details?
>
> FW_LOADER_USER_HELPER_FALLBACK globally enables the fallback to user
> helper mode when no file is loaded by the direct f/w loader.  It
> automatically sets FW_LOADER_USER_HELPER.
>
> OTOH, when FW_LOADER_USER_HELPER is set, requeset_firmware_nowait()
> does user mode fallback only when uevent (the second) argument is
> false.  Note that this is a special case.  In the usual cases --
> uevent = true or request_firmware() -- its doesn't enable the
> fallback.

Yes, I misunderstood here. lp55xx driver needs to enable user mode 
helper as *fallback*, so FW_LOADER_USER_HELPER_FALLBACK was set wrong.
Eventually, it enables the option flag, 'FW_OPT_USERHELPER'. So it 
affects other drivers which call request_firmware().

> The fallback to user helper mode is bad for the recent udev, since
> udev already dropped the f/w support code completely.  Thus every
> non-existing f/w load will result in 60 seconds stall.

However, timeout is changed to MAX_JIFFY_OFFSET when FW_OPT_UEVENT flag 
is not set.

static int _request_firmware_load(struct firmware_priv *fw_priv,
				  unsigned int opt_flags, long timeout)
{
	(snip)

	if (opt_flags & FW_OPT_UEVENT) {
		buf->need_uevent = true;
		dev_set_uevent_suppress(f_dev, false);
		dev_dbg(f_dev, "firmware: requesting %s\n", buf->fw_id);
		kobject_uevent(&fw_priv->dev.kobj, KOBJ_ADD);
	} else {
		timeout = MAX_JIFFY_OFFSET;
	}

	retval = wait_for_completion_interruptible_timeout(&buf->completion,
			timeout);
}

It will take too long to get the result. I don't know the reason why 
timeout was modified in the commit [68ff2a00dbf5: firmware_loader: 
handle timeout via wait_for_completion_interruptible_timeout()].
Moreover, this time value is not identical to the result of 
timeout_show(). Is it OK to remove the line as follows?

diff --git a/drivers/base/firmware_class.c b/drivers/base/firmware_class.c
index 171841a..8187404 100644
--- a/drivers/base/firmware_class.c
+++ b/drivers/base/firmware_class.c
@@ -909,8 +909,6 @@ static int _request_firmware_load(struct 
firmware_priv *fw_priv,
  		dev_set_uevent_suppress(f_dev, false);
  		dev_dbg(f_dev, "firmware: requesting %s\n", buf->fw_id);
  		kobject_uevent(&fw_priv->dev.kobj, KOBJ_ADD);
-	} else {
-		timeout = MAX_JIFFY_OFFSET;
  	}

  	retval = wait_for_completion_interruptible_timeout(&buf->completion,

If the driver requires longer loading time, then it can be done by 
updating '/sys/class/firmware/timeout'.

> In short, FW_LOAD_USER_HELPER_FALLBACK is present mostly only for
> older systems, just for compatibility.  For drivers that need the no
> direct f/w load and no udev interaction, set FW_LOAD_USER_HELPER
> instead.

Got your point. Thanks for clear explanation.

Best regards,
Milo
