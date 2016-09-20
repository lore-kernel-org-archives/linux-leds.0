From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Only remove trigger if one is actually configured.
Date: Tue, 20 Sep 2016 09:38:23 +0200
Message-ID: <7aece952-ce5a-6f8f-eddc-4267d6964d20@samsung.com>
References: <CGME20160914092340eucas1p27f875a415de6684be5b09872ab1b9ab6@eucas1p2.samsung.com>
 <1473844987-21112-1-git-send-email-daro@hms.se>
 <75e5d60e-39e4-574f-5417-7532f1f19f1f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <75e5d60e-39e4-574f-5417-7532f1f19f1f@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Romell <danielromell@gmail.com>, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Romell <daro@hms.se>
List-Id: linux-leds@vger.kernel.org

Hi Daniel,

I dropped that patch because we need to fix the problem
at the origin, i.e. inside led_trigger_set(). I submitted
the patch [0] doing that, and credited you by adding
Reported-by tag to the commit message.

Thanks,
Jacek Anaszewski

On 09/15/2016 01:48 PM, Jacek Anaszewski wrote:
> Hi Daniel,
>
> On 09/14/2016 11:23 AM, Daniel Romell wrote:
>> In led_trigger_remove(), check if there is a trigger
>> configured before calling led_trigger_set(). This will
>> prevent some unnecessary work, and more importantly stop
>> sending uevent change events when no change has in fact
>> occurred.
>>
>> Signed-off-by: Daniel Romell <daro@hms.se>
>> ---
>>  drivers/leds/led-triggers.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>> index 59d6a3e..28c7a66 100644
>> --- a/drivers/leds/led-triggers.c
>> +++ b/drivers/leds/led-triggers.c
>> @@ -147,7 +147,8 @@ EXPORT_SYMBOL_GPL(led_trigger_set);
>>  void led_trigger_remove(struct led_classdev *led_cdev)
>>  {
>>      down_write(&led_cdev->trigger_lock);
>> -    led_trigger_set(led_cdev, NULL);
>> +    if (led_cdev->trigger)
>> +        led_trigger_set(led_cdev, NULL);
>>      up_write(&led_cdev->trigger_lock);
>>  }
>>  EXPORT_SYMBOL_GPL(led_trigger_remove);
>>
>
> Thanks for the patch. Applied.
>

[0] 
https://git.kernel.org/cgit/linux/kernel/git/j.anaszewski/linux-leds.git/commit/?h=for-next&id=19afa7b4c4c9deebd312d293df2e2703de29e26a
