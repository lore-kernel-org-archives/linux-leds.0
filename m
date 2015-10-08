From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: triggers: add invert to heartbeat
Date: Thu, 08 Oct 2015 09:43:22 +0200
Message-ID: <56161E9A.2000408@samsung.com>
References: <d59e47a523eb7e21f3986f316569cd48810bdc35.1444209737.git.jiri.prchal@aksignal.cz>
 <56151ED2.5020300@samsung.com> <561528DE.4070507@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47857 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751990AbbJHHn1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2015 03:43:27 -0400
In-reply-to: <561528DE.4070507@aksignal.cz>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jiri.prchal@aksignal.cz
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, cooloney@gmail.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org

Hi Jiri,

On 10/07/2015 04:14 PM, Ji=C5=99=C3=AD Prchal wrote:
> Hi Jacek,
> comments below...
>
> On 7.10.2015 15:32, Jacek Anaszewski wrote:
>> Hi Jiri,
>>
>> Thanks for the patch. It's nice in general, but please see my
>> comments below.
>>
>> On 10/07/2015 11:31 AM, Jiri Prchal wrote:
>>> This patcht adds possibility to invert heartbeat blinking. The
>>> inverted LED is
>>> more time ON then OFF.
>>> It's because it looks better when the heartbeat LED is next to othe=
r
>>> LED which
>>> is most time ON.
>>> The invert value is exported same way via sysfs in file invert like
>>> oneshot. I
>>> get inspiration from this trigger.
>>
>> Please adjust commit message so as it wouldn't exceed 75 characters =
line
>> length limit. scripts/checkpatch.pl is useful for  catching this kin=
d of
>> problems.
>>
>>> Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
>>> ---
>>>   drivers/leds/trigger/ledtrig-heartbeat.c | 49
>>> ++++++++++++++++++++++++++++++--
>>>   1 file changed, 47 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c
>>> b/drivers/leds/trigger/ledtrig-heartbeat.c
>>> index fea6871..c09c30b 100644
>>> --- a/drivers/leds/trigger/ledtrig-heartbeat.c
>>> +++ b/drivers/leds/trigger/ledtrig-heartbeat.c
>>> @@ -27,6 +27,7 @@ struct heartbeat_trig_data {
>>>       unsigned int phase;
>>>       unsigned int period;
>>>       struct timer_list timer;
>>> +    unsigned int invert;
>>>   };
>>>
>>>   static void led_heartbeat_function(unsigned long data)
>>> @@ -56,21 +57,27 @@ static void led_heartbeat_function(unsigned lon=
g
>>> data)
>>>               msecs_to_jiffies(heartbeat_data->period);
>>>           delay =3D msecs_to_jiffies(70);
>>>           heartbeat_data->phase++;
>>> -        brightness =3D led_cdev->max_brightness;
>>> +        if (!heartbeat_data->invert)
>>> +            brightness =3D led_cdev->max_brightness;
>>>           break;
>>>       case 1:
>>>           delay =3D heartbeat_data->period / 4 - msecs_to_jiffies(7=
0);
>>>           heartbeat_data->phase++;
>>> +        if (heartbeat_data->invert)
>>> +            brightness =3D led_cdev->max_brightness;
>>
>> As you are at it, could you change, in a separate patch,
>> led_cdev->max_brightness to led_cdev->brightness? I think there is n=
o
>> reason for which we shouldn't allow other values than max.
> I changed it but it doesn't blink at all.

Indeed, we can't rely on led_cdev->brightness as it is being zeroed
in the meantime.

We would have to use another variable for storing current brightness.
Probably we could use led_cdev->delayed_set_value, similarly as in
case of software blinking. It would require changes in
led_set_brightness(), so that it updated led_cdev->delayed_set_value
not only when timer trigger is enabled, but also in case other triggers
are.

I'll take care of that after recent patch set with LED core
improvements is applied.

>>
>>>           break;
>>>       case 2:
>>>           delay =3D msecs_to_jiffies(70);
>>>           heartbeat_data->phase++;
>>> -        brightness =3D led_cdev->max_brightness;
>>> +        if (!heartbeat_data->invert)
>>> +            brightness =3D led_cdev->max_brightness;
>>>           break;
>>>       default:
>>>           delay =3D heartbeat_data->period - heartbeat_data->period=
 / 4 -
>>>               msecs_to_jiffies(70);
>>>           heartbeat_data->phase =3D 0;
>>> +        if (heartbeat_data->invert)
>>> +            brightness =3D led_cdev->max_brightness;
>>>           break;
>>>       }
>>>
>>> @@ -78,15 +85,50 @@ static void led_heartbeat_function(unsigned lon=
g
>>> data)
>>>       mod_timer(&heartbeat_data->timer, jiffies + delay);
>>>   }
>>>
>>> +static ssize_t led_invert_show(struct device *dev,
>>> +        struct device_attribute *attr, char *buf)
>>> +{
>>> +    struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>>> +    struct heartbeat_trig_data *heartbeat_data =3D
>>> led_cdev->trigger_data;
>>> +
>>> +    return sprintf(buf, "%u\n", heartbeat_data->invert);
>>> +}
>>> +
>>> +static ssize_t led_invert_store(struct device *dev,
>>> +        struct device_attribute *attr, const char *buf, size_t siz=
e)
>>> +{
>>> +    struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>>> +    struct heartbeat_trig_data *heartbeat_data =3D
>>> led_cdev->trigger_data;
>>> +    unsigned long state;
>>> +    int ret;
>>> +
>>> +    ret =3D kstrtoul(buf, 0, &state);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    heartbeat_data->invert =3D !!state;
>>> +
>>> +    return size;
>>> +}
>>> +
>>> +static DEVICE_ATTR(invert, 0644, led_invert_show, led_invert_store=
);
>>> +
>>>   static void heartbeat_trig_activate(struct led_classdev *led_cdev=
)
>>>   {
>>>       struct heartbeat_trig_data *heartbeat_data;
>>> +    int rc;
>>>
>>>       heartbeat_data =3D kzalloc(sizeof(*heartbeat_data), GFP_KERNE=
L);
>>>       if (!heartbeat_data)
>>>           return;
>>>
>>>       led_cdev->trigger_data =3D heartbeat_data;
>>> +    rc =3D device_create_file(led_cdev->dev, &dev_attr_invert);
>>> +    if (rc) {
>>> +        kfree(led_cdev->trigger_data);
>>> +        return;
>>> +    }
>>> +
>>>       setup_timer(&heartbeat_data->timer,
>>>               led_heartbeat_function, (unsigned long) led_cdev);
>>>       heartbeat_data->phase =3D 0;
>>> @@ -100,9 +142,12 @@ static void heartbeat_trig_deactivate(struct
>>> led_classdev *led_cdev)
>>>
>>>       if (led_cdev->activated) {
>>>           del_timer_sync(&heartbeat_data->timer);
>>> +        device_remove_file(led_cdev->dev, &dev_attr_invert);
>>>           kfree(heartbeat_data);
>>>           led_cdev->activated =3D false;
>>>       }
>>> +
>>> +    led_set_brightness(led_cdev, LED_OFF);
>>
>> I believe this is a fix. Could you split it into a separate patch
>> and explain its merit?
> I'm not sure of necessity of it, I copied it from oneshot.
> Without it could leave LED in ON state. But never happens to me.
> Should I produce separate patch to discuss it in separate thread?

This is not necessary. led_trigger_remove() calls
let_trigger_set(led_cdev, NULL), which in turn calls
led_set_brightness(led_cdev, LED_OFF).

Please remove above line and adjust commit message format
so that checkpatch.pl doesn't complain.

>>
>>>   }
>>>
>>>   static struct led_trigger heartbeat_led_trigger =3D {
>>>
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--=20
Best Regards,
Jacek Anaszewski
