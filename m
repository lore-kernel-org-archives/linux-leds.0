From: Joe Xue <lgxue@hotmail.com>
Subject: RE: [PATCH] Add LED pattern trigger
Date: Mon, 30 Dec 2013 18:24:51 -0500
Message-ID: <BLU172-W3543A0F3EFB217C99994F4ACCE0@phx.gbl>
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

>> +#define MAX_PATTEN_LEN 255
>
> Arbitary limits that are not needed if it was in userspace, and not it
> seems a sensible one - why not use 256 ?

The maximum memory is 256, we keep one for '\0'

>> +static ssize_t pattern_delay_unit_store(struct device *dev,
>> + struct device_attribute *attr, const char *buf, size_t size)
>> +{
>> + struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> + struct pattern_trig_data *pattern_data = led_cdev->trigger_data;
>> + unsigned long state;
>> + ssize_t ret = -EINVAL;
>> +
>> + ret = kstrtoul(buf, 10, &state);
>> + if (ret)
>> + return ret;
>> +
>> + pattern_data->delay_unit = state;
>
> What happens if this is zero ?

Yes, we should not accept 0 here. Will fix it.

>> +static ssize_t pattern_pattern_store(struct device *dev,
>> + struct device_attribute *attr, const char *buf, size_t size)
>> +{
>> + struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> + struct pattern_trig_data *pattern_data = led_cdev->trigger_data;
>> + int i;
>> + ssize_t ret = -EINVAL;
>> +
>> + int len = (size> MAX_PATTEN_LEN) ? MAX_PATTEN_LEN : (size - 1);
>> +
>> + /* legality check */
>> + for (i = 0; i < len; i++) {
>> + if (buf[i] != ' ' && buf[i] != '#' && buf[i] != '/')
>> + return ret;
>> + }
>> +
>> + del_timer_sync(&pattern_data->timer);
>> +
>> + memcpy(pattern_data->pattern, buf, len);
>> + pattern_data->pattern[len] = '\0';
>> + pattern_data->pattern_len = len;
>> + pattern_data->count = 0;
>> +
>> + mod_timer(&pattern_data->timer, jiffies + 1);
>
> What if the pattern isn't currently active ?

Doesn't matter as per my test.

>> + return size;
>
> You only consumed len bytes so you should return len here.
>
>> +}
>> +
>> +static DEVICE_ATTR(pattern, 0644, pattern_pattern_show, pattern_pattern_store);
>> +static DEVICE_ATTR(delay_unit, 0644,
>> + pattern_delay_unit_show, pattern_delay_unit_store);
>
> Why are these world readable. If patterns tell you an action is due they
> provide information that other processes shouldn't have access to.
>
>> + memset(tdata->pattern, 0, MAX_PATTEN_LEN + 1);
>
> Why +1, you don't need a zero terminator you know the length
>
> Why allocate a fixed 256 byte blob when you can make the data the end of
> the struct (ie pattern[0] in the declaration) and not waste memory.

This just easy for patten_show.

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

I believe kernel will handle this

>> + led_cdev->trigger_data = NULL;
>> + led_cdev->activated = false;
>> + kfree(pattern_data);
>> + }
>> + __led_set_brightness(led_cdev, LED_OFF);
>> +}
>> +
>> +static struct led_trigger pattern_trigger = {
>
> const ?

? 		 	   		  