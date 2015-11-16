From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: ktd2692: Add missing of_node_put
Date: Mon, 16 Nov 2015 15:30:18 +0100
Message-ID: <5649E87A.8030602@samsung.com>
References: <1447124424-16525-1-git-send-email-ingi2.kim@samsung.com>
 <5649A92C.1020502@samsung.com>
 <CAL_JsqJWfSkZPEKaFdUQbQQb8m6MaKSHYMYOEf3U6frqGK_a3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAL_JsqJWfSkZPEKaFdUQbQQb8m6MaKSHYMYOEf3U6frqGK_a3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Ingi Kim <ingi2.kim@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 11/16/2015 03:09 PM, Rob Herring wrote:
> On Mon, Nov 16, 2015 at 4:00 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> Hi Ingi, Rob,
>>
>> With this patch we will be leaking of_node when parsing succeeds.
>> I think that "return 0" should be removed. I can remove it and apply,
>> provided that Rob's ack is still in force with this. Rob?
>
> Okay.

Removed discussed line and applied, thanks.

>> On 11/10/2015 04:00 AM, Ingi Kim wrote:
>>>
>>> The refcount of device_node increases after of_node_get() is called.
>>> So, a break out of the loop requires of_node_put().
>>>
>>> This patch adds missing of_node_put() when loop breaks.
>>>
>>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>>> ---
>>>    drivers/leds/leds-ktd2692.c | 11 ++++++++---
>>>    1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
>>> index feca07b..dbf37ce 100644
>>> --- a/drivers/leds/leds-ktd2692.c
>>> +++ b/drivers/leds/leds-ktd2692.c
>>> @@ -332,21 +332,26 @@ static int ktd2692_parse_dt(struct ktd2692_context
>>> *led, struct device *dev,
>>>                                     &cfg->movie_max_microamp);
>>>          if (ret) {
>>>                  dev_err(dev, "failed to parse led-max-microamp\n");
>>> -               return ret;
>>> +               goto err_parse_dt;
>>>          }
>>>
>>>          ret = of_property_read_u32(child_node, "flash-max-microamp",
>>>                                     &cfg->flash_max_microamp);
>>>          if (ret) {
>>>                  dev_err(dev, "failed to parse flash-max-microamp\n");
>>> -               return ret;
>>> +               goto err_parse_dt;
>>>          }
>>>
>>>          ret = of_property_read_u32(child_node, "flash-max-timeout-us",
>>>                                     &cfg->flash_max_timeout);
>>> -       if (ret)
>>> +       if (ret) {
>>>                  dev_err(dev, "failed to parse flash-max-timeout-us\n");
>>> +               goto err_parse_dt;
>>> +       }
>>> +
>>> +       return 0;
>>>
>>> +err_parse_dt:
>>>          of_node_put(child_node);
>>>          return ret;
>>>    }
>>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>


-- 
Best Regards,
Jacek Anaszewski
