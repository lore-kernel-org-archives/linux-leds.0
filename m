From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 1/2] leds: core: Introduce LED pattern trigger
Date: Mon, 6 Aug 2018 13:41:29 +0200
Message-ID: <b7407dc4-73b3-f819-2c44-03ed65999e32@gmail.com>
References: <c43374283744539702023053c896efe3c73b7833.1533441631.git.baolin.wang@linaro.org>
 <3d7e8701-d92b-9f51-befa-a585b5957488@gmail.com>
 <CAMz4kuLSBLReVSo4zXf8b64kwCmRt2PS=JkeD2wJO41X-WmBQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMz4kuLSBLReVSo4zXf8b64kwCmRt2PS=JkeD2wJO41X-WmBQQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, rteysseyre@gmail.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Baolin,

On 08/06/2018 03:53 AM, Baolin Wang wrote:
> Hi Jacek,
[...]
>>> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
>>> @@ -0,0 +1,21 @@
>>> +What:                /sys/class/leds/<led>/pattern
>>> +Date:                August 2018
>>> +KernelVersion:       4.19
>>> +Description:
>>> +             Specify a pattern for the LED, for LED hardware that support
>>> +             altering the brightness as a function of time.
>>> +
>>> +             The pattern is given by a series of tuples, of brightness and
>>> +             duration (ms). The LED is expected to traverse the series and
>>> +             each brightness value for the specified duration. Duration of
>>> +             0 means brightness should immediately change to new value.
>>> +
>>> +             The format of the pattern values should be:
>>> +             "brightness_1 duration_1 brightness_2 duration_2 brightness_3
>>> +             duration_3 ...".
>>> +
>>> +What:                /sys/class/leds/<led>/repeat
>>> +Date:                August 2018
>>> +KernelVersion:       4.19
>>> +Description:
>>> +             Specify a pattern repeat number. 0 means repeat indefinitely.
>>
>> In current implementation this file on read returns the number
>> of remaining repeat intervals. I'd add that to this description.
> 
> I saw Pavel's comments that he did not suggest do this. So I will keep
> the original description?

Yes, please report always the original value.

[...]
>>> +static ssize_t pattern_trig_store_repeat(struct device *dev,
>>> +                                      struct device_attribute *attr,
>>> +                                      const char *buf, size_t count)
>>> +{
>>> +     struct led_classdev *led_cdev = dev_get_drvdata(dev);
>>> +     struct pattern_trig_data *data = led_cdev->trigger_data;
>>> +     unsigned long res;
>>> +     int err;
>>> +
>>> +     err = kstrtoul(buf, 10, &res);
>>> +     if (err)
>>> +             return err;
>>> +
>>> +     if (!led_cdev->pattern_set)
>>> +             del_timer_sync(&data->timer);
>>
>> Is there a reason for not having this check under mutex?
> 
> We will hold the mutex in pattern_trig_timer_function(), so if we do
> del_timer_sync() under the mutex protection, we may meet dead-lock
> issue. Moreover, the del_timer_sync() will make sure deactivating one
> timer is safe.

Ack.

-- 
Best regards,
Jacek Anaszewski
