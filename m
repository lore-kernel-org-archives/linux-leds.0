From: Joe Xue <lgxue@hotmail.com>
Subject: RE: [PATCH] Add LED pattern trigger
Date: Tue, 31 Dec 2013 13:48:50 -0500
Message-ID: <BLU172-W451DF59115DB2B0A7F694AACC90@phx.gbl>
References: <1388362275-1618-1-git-send-email-lgxue@hotmail.com>,<20131230162158.7420e811@alan.etchedpixels.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131230162158.7420e811@alan.etchedpixels.co.uk>
Sender: linux-doc-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

>> + * Based on Richard Purdie's ledtrig-timer.c and Atsushi Nemoto's
>> + * ledtrig-heartbeat.c and Shuah Khan's ledtrig-transient.c
>
> I stil think this belongs in user space except for platforms with hardware
> acceleration for it.

This can free the user space application from loop or thread.

>> +#define MAX_PATTEN_LEN 255
>
> Arbitary limits that are not needed if it was in userspace, and not it
> seems a sensible one - why not use 256 ?

Yes, will change it to kmalloc


>> +static DEVICE_ATTR(pattern, 0644, pattern_pattern_show, pattern_pattern_store);
>> +static DEVICE_ATTR(delay_unit, 0644,
>> +static void pattern_trig_deactivate(struct led_classdev *led_cdev)
>> +{
>> + struct pattern_trig_data *pattern_data = led_cdev->trigger_data;
>> +
>> + if (led_cdev->activated) {
>> + del_timer_sync(&pattern_data->timer);
>> + device_remove_file(led_cdev->dev, &dev_attr_pattern);
>> + device_remove_file(led_cdev->dev, &dev_attr_delay_unit);
>
> This doesn't as far as I can see do what you think. If I have the file
> currently open then device_remove_file will not remove my existing access
> to it, but you just released the pattern data so I now write to free
> memory.

will add the mutex lock to avoid that 		 	   		  