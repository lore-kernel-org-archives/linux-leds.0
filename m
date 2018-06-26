From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 1/2] leds: core: Introduce generic pattern interface
Date: Tue, 26 Jun 2018 13:08:03 +0800
Message-ID: <CAMz4kuKiMrE-z9D3gsSqJU9zCdGz-gakLeSWSLWOL2efTgm-1Q@mail.gmail.com>
References: <046c0cf717cbdfd55dcdc2bb7463642734e2ca4c.1529902636.git.baolin.wang@linaro.org>
 <20180625121845.GA32505@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180625121845.GA32505@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 25 June 2018 at 20:18, Pavel Machek <pavel@ucw.cz> wrote:
> On Mon 2018-06-25 13:03:19, Baolin Wang wrote:
>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
>> Some LED controllers have support for autonomously controlling
>> brightness over time, according to some preprogrammed pattern or
>> function.
>>
>> This adds a new optional operator that LED class drivers can implement
>> if they support such functionality as well as a new device attribute to
>> configure the pattern for a given LED.
>
> Thanks for doing this!
>
>> index 5f67f7a..fe90a12 100644
>> --- a/Documentation/ABI/testing/sysfs-class-led
>> +++ b/Documentation/ABI/testing/sysfs-class-led
>> @@ -61,3 +61,19 @@ Description:
>>               gpio and backlight triggers. In case of the backlight trigger,
>>               it is useful when driving a LED which is intended to indicate
>>               a device in a standby like state.
>> +
>> +What: /sys/class/leds/<led>/pattern
>> +Date: June 2018
>> +KernelVersion: 4.18
>> +Description:
>> +     Specify a pattern for the LED, for LED hardware that support
>> +     altering the brightness as a function of time.
>> +
>> +     The pattern is given by a series of tuples, of brightness and
>> +     duration (ms). The LED is expected to traverse the series and
>> +     each brightness value for the specified duration.
>> +
>> +     As LED hardware might have different capabilities and precision
>> +     the requested pattern might be slighly adjusted by the driver
>> +     and the resulting pattern of such operation should be returned
>> +     when this file is read.
>
> I'd add "Duration of 0 means brightness should immediately change to
> new value."

Sure.

>
>> +     struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +     struct led_pattern *pattern = NULL;
>> +     unsigned long val;
>> +     char *sbegin;
>> +     char *elem;
>> +     char *s;
>> +     int ret, len = 0;
>> +     bool odd = true;
>> +
>> +     s = sbegin = kstrndup(buf, size, GFP_KERNEL);
>> +     if (!s)
>> +             return -ENOMEM;
>> +
>> +     /* Trim trailing newline */
>> +     s[strcspn(s, "\n")] = '\0';
>
> Is substring function best to use here? Will it do the right thing
> when \n is not present?

We always have a '\n' to present the end of the string passed from
userspace. Or anything I missed here?

>
>> +     /* If the remaining string is empty, clear the pattern */
>> +     if (!s[0]) {
>> +             ret = led_cdev->pattern_clear(led_cdev);
>> +             goto out;
>> +     }
>> +
>> +     pattern = kcalloc(size, sizeof(*pattern), GFP_KERNEL);
>> +     if (!pattern) {
>> +             ret = -ENOMEM;
>> +             goto out;
>> +     }
>> +
>> +     /* Parse out the brightness & delta_t touples and check for repeat */
>> +     while ((elem = strsep(&s, " ")) != NULL) {
>> +             ret = kstrtoul(elem, 10, &val);
>> +             if (ret)
>> +                     goto out;
>> +
>> +             if (odd) {
>> +                     pattern[len].brightness = val;
>> +             } else {
>> +                     /* Ensure we don't have any delta_t == 0 */
>> +                     if (!val) {
>> +                             ret = -EINVAL;
>> +                             goto out;
>> +                     }
>
> I believe we should support delta_t of 0 for "change immediately".

OK. Thanks for your comments.

-- 
Baolin Wang
Best Regards
