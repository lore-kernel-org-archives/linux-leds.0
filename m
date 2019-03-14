From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 6/6] leds: netdev trigger: allow setting initial values
 in device tree
Date: Thu, 14 Mar 2019 16:05:51 +0100
Message-ID: <10d65087-2ae5-8ddf-e9be-02c9341b452b@rasmusvillemoes.dk>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-7-linux@rasmusvillemoes.dk>
 <742bd6b2-0a11-858e-d727-204b0313265e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <742bd6b2-0a11-858e-d727-204b0313265e@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 14/03/2019 15.24, Jacek Anaszewski wrote:
> Rasmus,
> 
> Thank you for the update.
> Still, there is one thing to improve.
> 

>>   static int netdev_trig_activate(struct led_classdev *led_cdev)
>>   {
>>       struct led_netdev_data *trigger_data;
>> @@ -423,6 +451,8 @@ static int netdev_trig_activate(struct
>> led_classdev *led_cdev)
>>       trigger_data->mode = 0;
>>       atomic_set(&trigger_data->interval, msecs_to_jiffies(50));
>>       trigger_data->last_activity = 0;
>> +    if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER)
>> +        netdev_trig_of_init(led_cdev, trigger_data);
> 
> We don't necessarily want OF settings to be used for initialization on
> each LED trigger activation for the LED class device, but only on the
> first one. That's why the triggers using this flags clean it here:
> 
> led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;

Right, I noticed that pattern, but wondered about it. If this is
supposed to be a general thing, why isn't it just done by the trigger
core after the call of led_trigger_set() in the two places the bit gets
set? I.e.

		led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
		led_trigger_set(led_cdev, trig);
+		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;

I can certainly add clearing the flag to my code, just wondering.

Rasmus
